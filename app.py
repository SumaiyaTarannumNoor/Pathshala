import json
import os
from flask import Blueprint, Flask, current_app, jsonify, redirect, render_template, request, session, url_for
import pymysql.cursors
from werkzeug.utils import secure_filename
from flask_mail import Mail, Message
from urllib.parse import urlparse
from tld import get_tld
from flask import request, jsonify

import math

app = Flask(__name__)
app.secret_key = 'eer'

# Mail configuration
app.config['MAIL_SERVER'] = 'mail.ahmedul.com'
app.config['MAIL_PORT'] = 587
app.config['MAIL_USERNAME'] = 'contact@ahmedul.com'
app.config['MAIL_PASSWORD'] = 'pZLZ4hh$?u.m'
app.config['MAIL_USE_TLS'] = True
app.config['MAIL_USE_SSL'] = False
mail = Mail(app)

connection = pymysql.connect(
    host='localhost',
    user='root',
    password='',
    database='pathshala',
    cursorclass=pymysql.cursors.DictCursor
)

# Define a route to render the index.html template
@app.route('/')
def index():
    return render_template('index.html')

@app.route('/login_user', methods=['POST'])
def login_user():
    if request.method == 'POST':
        usermail = request.form.get('usermail')
        password = request.form.get('pass')  # Encode password to bytes
        print(usermail)
        print(password)
        with connection.cursor() as cursor:
            # Retrieve user based on usermail
            sql = "SELECT * FROM admin WHERE email = %s"
            cursor.execute(sql, (usermail,))
            user = cursor.fetchone()

            if user and password == user['pass']:
                session['loggedin'] = True
                session['id'] = user['admin_id']
                session['email'] = user['email']
                session['name'] = user['name']
                return jsonify({'redirect': url_for('deshboard')})  # Redirect to dashboard on successful login
            else:
                error = "Invalid credentials. Please try again."
                return jsonify({'error': error})
    else:
        return jsonify({'error': 'Method not allowed'})
    
    
@app.route('/login_trainee', methods=['POST'])
def login_trainee():
    if request.method == 'POST':
        usermail = request.form.get('usermail')
        password = request.form.get('pass')  # Encode password to bytes

        with connection.cursor() as cursor:
            # Retrieve user based on usermail
            sql = "SELECT * FROM trainees WHERE email = %s"
            cursor.execute(sql, (usermail,))
            user = cursor.fetchone()

            if user and password == user['password']:
                session['loggedin'] = True
                session['id'] = user['trainee_id']
                session['email'] = user['email']
                session['name'] = user['full_name']
                # Redirect to profile_dashboard route
                # return redirect(url_for('profile_dashboard'))
                return jsonify({'redirect': url_for('profile_dashboard')})
            else:
                error = "Invalid credentials. Please try again."
                return jsonify({'error': error})
    else:
        return jsonify({'error': 'Method not allowed'})

@app.route('/profile', methods=['GET', 'POST'])
def get_trainee():
    if 'loggedin' in session and session['loggedin']:
        try:
            with connection.cursor() as cursor:
                # Retrieve trainee data based on trainee_id
                trainee_id= session['id']
                trainee_sql = "SELECT * FROM trainees WHERE trainee_id = %s"
                cursor.execute(trainee_sql, (trainee_id,))
                trainee_data = cursor.fetchone()
                if trainee_data:
                    # return render_template('profile_dashboard.html', trainee=trainee_data)
                    return jsonify(trainee_data)
                else:
                    return "Trainee not found"
        except Exception as e:
            return jsonify({'error': f"Request error: {str(e)}"})
    else:
        return redirect(url_for('index'))




@app.route('/registration', methods=['GET', 'POST'])
def registration():
    try:
        if request.method == 'POST':
            full_name = request.form.get('full_name')
            email = request.form.get('email')
            organization = request.form.get('organization')
            phone_number = request.form.get('phone_number')
            address = request.form.get('address')
            educational_level = request.form.get('educational_level')
            skills = request.form.get('skills')
            freelancing_experience = request.form.get('freelancing_experience')
            # portfolio_link = request.form.get('portfolio_link')
            # language_proficiency = request.form.get('language_proficiency')
            # institution = request.form.get('institution')
            # educational_certificates = request.form.get('educational_certificates
            # availability = request.form.get('availability')
            # preferred_work_type = request.form.get('preferred_work_type')
            # hourly_rate = request.form.get('hourly_rate')
            # certifications = request.form.get('certifications')
            # linkedIn_profile = request.form.get('linkedIn_profile')
            # github_profile = request.form.get('github_profile')
            # course_joining_date = request.form.get('course_joining_date')
            # Handling language proficiency
            portfolio_links = {}

            # Extract portfolio links for selected platforms
            if 'fiverr' in request.form:
                portfolio_links['fiverr'] = request.form.get('fiverr_link')
            if 'upwork' in request.form:
                portfolio_links['upwork'] = request.form.get('upwork_link')
            if 'freelancer' in request.form:
                portfolio_links['freelancer'] = request.form.get('freelancer_link')
            if 'toptal' in request.form:
                portfolio_links['toptal'] = request.form.get('toptal_link')
            if 'guru' in request.form:
                portfolio_links['guru'] = request.form.get('guru_link')
            if 'other' in request.form:
                portfolio_links['other'] = request.form.get('other_link')

            # Convert the dictionary to a JSON string
            json_data = json.dumps(portfolio_links)
        

            languages = []
            if 'bangla' in request.form:
                languages.append('Bangla')
            if 'english' in request.form:
                languages.append('English')
            if 'other_language' in request.form:
                other_language = request.form.get('other_language')
                if other_language:
                    languages.append(other_language)
            # print(languages)
            # exit()
            language_proficiency = ', '.join(languages)
            
            done_trainings = []
            if 'copywriting' in request.form:
                done_trainings.append('Copywriting')
            if 'digital_marketing' in request.form:
                done_trainings.append('Digital Marketing')
            if 'graphic_design' in request.form:
                done_trainings.append('Graphic Design')  
            if 'data_entry' in request.form:
                done_trainings.append('Data Entry')    
            if 'seo' in request.form:
                done_trainings.append('SEO')    
            if 'uxui' in request.form:
                done_trainings.append('UX/UI Design') 
            if 'other_done_training' in request.form:
                other_done_training = request.form.get('other_done_training')
                if other_done_training:
                    done_trainings.append(other_done_training)        
                       
            done_trainings = ', '.join(done_trainings)
            
            wantTo_trainings = []
            if 'copywriting' in request.form:
                wantTo_trainings.append('Copywriting')
            if 'digital_marketing' in request.form:
                wantTo_trainings.append('Digital Marketing')
            if 'graphic_design' in request.form:
                wantTo_trainings.append('Graphic Design')  
            if 'data_entry' in request.form:
                wantTo_trainings.append('Data Entry')    
            if 'seo' in request.form:
                wantTo_trainings.append('SEO')    
            if 'uxui' in request.form:
                wantTo_trainings.append('UX/UI Design') 
            if 'other_wantTo_training' in request.form:
                other_wantTo_training = request.form.get('other_wantTo_training')
                if other_wantTo_training:
                    wantTo_trainings.append(other_wantTo_training)        
                       
            wantTo_trainings = ', '.join(wantTo_trainings) 
            
            password = request.form.get('password')

        # Check for required fields
            if not ([full_name, email, phone_number, address, educational_level, password]):
                return jsonify({"message": "You must fill up these required fields."}), 400
            
            # Perform database operations
            with connection.cursor() as cursor:
                trainee_create_sql = "INSERT INTO trainees (full_name, organization, email, phone_number, address, educational_level, skills, freelancing_experience, portfolio_link, language_proficiency, done_trainings, wantTo_trainings, password) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"
                cursor.execute(trainee_create_sql, (full_name, organization, email, phone_number, address, educational_level, skills, freelancing_experience, json_data,language_proficiency, done_trainings, wantTo_trainings, password))
                connection.commit()

            return jsonify({'success': 'Registration successful'}), 200
        
        elif request.method == 'GET':
            return jsonify({'message': 'GET request received'}), 200

    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"}), 500
       

@app.route('/all_data', methods=['GET','POST'])
def all_data():
    try:
        with connection.cursor() as cursor:
            # SQL query to fetch data from the users table
            users_sql = "SELECT * FROM ahm_profile LIMIT 1"
            cursor.execute(users_sql)
            user_data = cursor.fetchone()

            users_edu_work_sql = "SELECT * FROM ahm_edu_work"
            cursor.execute(users_edu_work_sql)
            users_edu_work_data = cursor.fetchall()

            users_service_products_sql = "SELECT * FROM service_products"
            cursor.execute(users_service_products_sql)
            service_products_data = cursor.fetchall()

            users_gallary_sql = "SELECT * FROM ahm_gallary_partners"
            cursor.execute(users_gallary_sql)
            gallary_data = cursor.fetchall()

            users_profile_photos_sql = "SELECT * FROM ahm_profile_photos"
            cursor.execute(users_profile_photos_sql)
            profile_photos_data = cursor.fetchall()
            
            users_social_media_sql = "SELECT * FROM ahm_social"
            cursor.execute(users_social_media_sql)
            profile_social_data = cursor.fetchall()

            users_testimonial_sql = "SELECT * FROM ahm_testimonial"
            cursor.execute(users_testimonial_sql)
            users_testimonial_data = cursor.fetchall()

            users_address_sql = "SELECT * FROM ahm_address"
            cursor.execute(users_address_sql)
            users_address_data = cursor.fetchall()

            hide_show_sql = "SELECT * FROM hide_show"
            cursor.execute(hide_show_sql)
            hide_show_data = cursor.fetchall()


            all_data = {
                'user_profile': user_data,
                'edu_work': users_edu_work_data,
                'service_products': service_products_data,
                'gallary_partners': gallary_data,
                'profile_photos': profile_photos_data,
                'social_media': profile_social_data,
                'testimonial': users_testimonial_data,
                'users_address_data': users_address_data,
                'hide_show_data': hide_show_data,
            }
            return jsonify(all_data)
        
    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})

@app.route('/profile_data', methods=['GET','POST'])
def profile_data():
    try:
        with connection.cursor() as cursor:
            # SQL query to fetch data from the users table
            users_sql = "SELECT * FROM ahm_profile"
            cursor.execute(users_sql)
            user_data = cursor.fetchall()
        # print(service_products_data)
        return jsonify(user_data)  
    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})

@app.route('/profile_data_update', methods=['GET', 'POST'])
def profile_data_update():
    try:
        if request.method == 'POST':
            json_data = request.form.get('json_data')
            json_data = json.loads(json_data)

            updated_id = 1
            name = json_data.get('name')
            about = json_data.get('about')

            with connection.cursor() as cursor:
                serive_update_sql = "UPDATE ahm_profile SET name=%s, about=%s WHERE profile_id = %s"
                cursor.execute(serive_update_sql, (name, about, updated_id))
                connection.commit()

            return jsonify({'success': 'Update Success'})

    except Exception as e:
        return jsonify({'error': f"Database error: {str(e)}"})

@app.route('/header_data_update', methods=['GET', 'POST'])
def header_data_update():
    try:
        if request.method == 'POST':
            json_data = request.form.get('header_json_data')
            json_data = json.loads(json_data)

            updated_id = 1
            header_1 = json_data.get('header_1')
            header_2 = json_data.get('header_2')
            header_3 = json_data.get('header_3')
            header_4 = json_data.get('header_4')
            header_5 = json_data.get('header_5')

            with connection.cursor() as cursor:
                header_update_sql = "UPDATE ahm_profile SET header_1=%s, header_2=%s, header_3=%s, header_4=%s, header_5=%s WHERE profile_id = %s"
                cursor.execute(header_update_sql, (header_1, header_2, header_3, header_4, header_5, updated_id))
                connection.commit()

            return jsonify({'success': 'Header Update Success'})

    except Exception as e:
        return jsonify({'error': f"Database error: {str(e)}"})

@app.route('/adress_update', methods=['GET', 'POST'])
def adress_update():
    try:
        if request.method == 'POST':
            json_data = request.form.get('address_json_data')
            json_data = json.loads(json_data)

            address_id = json_data.get('address_id')
            title = json_data.get('title')
            adress = json_data.get('adress')
            phone = json_data.get('phone')
            mobile = json_data.get('mobile')
            whatsapp = json_data.get('whatsapp')
            email = json_data.get('email')

            with connection.cursor() as cursor:
                address_update_sql = "UPDATE ahm_address SET address_title=%s, address=%s, phone=%s, mobile=%s, whatsapp=%s, mail=%s WHERE address_id = %s"
                cursor.execute(address_update_sql, (title, adress, phone, mobile, whatsapp, email, address_id))
                connection.commit()

            return jsonify({'success': 'Adress Update Success'})

    except Exception as e:
        return jsonify({'error': f"Database error: {str(e)}"})


@app.route('/profile_image_update', methods=['GET','POST'])
def profile_image_update():
    try:
        if request.method == 'POST':
            json_data = request.form.get('json_data')
            json_data = json.loads(json_data)
            image_num = json_data.get('image_num')
            file_photo = request.files['file_photo']
            file_name = file_photo.filename
            original_filename = secure_filename(file_name)
    
            # Replace spaces with underscores in the original filename
            filename_without_spaces = original_filename.replace(' ', '_')
            new_filename = f"profile_{image_num}_{filename_without_spaces}"
            if file_photo and new_filename != '':
                with connection.cursor() as cursor:
                    profile_update_sql = "UPDATE ahm_profile_photos SET photos_name =%s WHERE photos_id =%s"
                    cursor.execute(profile_update_sql, (new_filename, image_num))
                    connection.commit()
                    file_path = os.path.join('static/mainassets/images/users', new_filename)
                    file_photo.save(file_path)
                return jsonify({'success':'Update Success'})

    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})

@app.route('/profile_logo_update', methods=['GET','POST'])
def profile_logo_update():
    try:
        if request.method == 'POST':
            updated_id = 1
            file_photo = request.files['file_photo']
            file_name = file_photo.filename
            original_filename = secure_filename(file_name)
    
            # Replace spaces with underscores in the original filename
            filename_without_spaces = original_filename.replace(' ', '_')
            new_filename = f"logo_{filename_without_spaces}"
            if file_photo and new_filename != '':
                with connection.cursor() as cursor:
                    logo_update_sql = "UPDATE ahm_profile SET logo =%s WHERE profile_id =%s"
                    cursor.execute(logo_update_sql, (new_filename, updated_id))
                    connection.commit()
                    file_path = os.path.join('static/mainassets/images/logos', new_filename)
                    file_photo.save(file_path)
                return jsonify({'success':'Update Success'})

    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})

@app.route('/social_add', methods=['POST'])
def social_add():
    try:
        if request.method == 'POST':
            json_data = request.form.get('json_data')
            json_data = json.loads(json_data)
            social_link = json_data.get('link')
            social_name = get_tld(social_link, as_object=True).domain
            show_data = json_data.get('show')
            social_show = show_data.get('social')
            try:
                with connection.cursor() as cursor:
                    social_add_sql = "INSERT INTO ahm_social (social_name, social_link, social_show) VALUES (%s, %s, %s)"
                    cursor.execute(social_add_sql, (social_name, social_link, social_show))
                    connection.commit()

                return jsonify({'success': 'Social Insert Success'})
                    
            except Exception as e:
                return jsonify({'error': f"Database error: {str(e)}"})

    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})  


@app.route('/test_add', methods=['POST'])
def test_add():
    try:
        if request.method == 'POST':
            json_data = request.form.get('json_data')
            json_data = json.loads(json_data)
            print(json_data)
            author_name = json_data.get('name')
            testimonial = json_data.get('testimonial')
            file = request.files['file_photo']
            # file_photo_name = file.filename
            original_filename = secure_filename(file.filename)
    
            # Replace spaces with underscores in the original filename
            filename_without_spaces = original_filename.replace(' ', '_')
            new_filename = f"testimonial_{author_name}_{filename_without_spaces}"
            try:
                with connection.cursor() as cursor:
                    social_add_sql = "INSERT INTO ahm_testimonial (testimonial_details, testimonial_name, testimonial_photo) VALUES (%s, %s, %s)"
                    cursor.execute(social_add_sql, (testimonial, author_name,new_filename))
                    connection.commit()
                    file_path = os.path.join('static/mainassets/images/users', new_filename)
                    file.save(file_path)

                return jsonify({'success': 'ocial Insert Success'})
                    
            except Exception as e:
                return jsonify({'error': f"Database error: {str(e)}"})

    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"}) 

@app.route('/social_update', methods=['GET','POST'])
def social_update():
    try:
        if request.method == 'POST':
            json_data = request.form.get('json_data')
            json_data = json.loads(json_data)
            updated_id = json_data.get('id')
            link = json_data.get('link')
            social_name = get_tld(link, as_object=True).domain
            show_data = json_data.get('show')
            social_show = show_data.get('social')
            
            with connection.cursor() as cursor:
                serive_update_sql = "UPDATE ahm_social SET social_name=%s, social_link=%s, social_show=%s WHERE social_id =%s"
                cursor.execute(serive_update_sql, (social_name, link, social_show, updated_id))
                connection.commit()

            return jsonify({'success': 'Update Success'})
            
    except Exception as e:
        return jsonify({'error': f"Database error: {str(e)}"})
    

@app.route('/test_update', methods=['GET','POST'])
def test_update():
    try:
        if request.method == 'POST':
            json_data = request.form.get('json_data')
            json_data = json.loads(json_data)

            updated_id = json_data.get('id')
            name = json_data.get('name')
            testimonial = json_data.get('testimonial')

            file = request.files['file_photo']
            original_filename = secure_filename(file.filename)
            filename_without_spaces = original_filename.replace(' ', '_')
            new_filename = f"testimonial_{name}_{filename_without_spaces}"
            if file and new_filename != '':
                with connection.cursor() as cursor:
                    test_update_sql = "UPDATE ahm_testimonial SET testimonial_name=%s, testimonial_details=%s, testimonial_photo=%s WHERE testimonial_id =%s"
                    cursor.execute(test_update_sql, (name, testimonial, new_filename, updated_id))
                    connection.commit()
                    file_path = os.path.join('static/mainassets/images/users', new_filename)
                    file.save(file_path)

            else:
                with connection.cursor() as cursor:
                    test_update_sql = "UPDATE ahm_testimonial SET testimonial_name=%s, testimonial_details=%s WHERE testimonial_id =%s"
                    cursor.execute(test_update_sql, (name, testimonial, updated_id))
                    connection.commit()

            return jsonify({'success': 'Update Success'})
            
    except Exception as e:
        return jsonify({'error': f"Database error: {str(e)}"})

@app.route('/social_delete', methods=['GET','POST'])
def social_delete():
    try:
        if request.method == 'POST':
            deleted_id = request.form.get('deleted_id')
            print(deleted_id)
            cursor = connection.cursor()
            social_delete_query = "DELETE FROM ahm_social WHERE social_id = %s"
            cursor.execute(social_delete_query, (deleted_id,))
            connection.commit()
            return jsonify({'success': 'Delete Success'})
        return jsonify({'error': 'Invalid request'})
    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})
    
@app.route('/test_delete', methods=['GET','POST'])
def test_delete():
    try:
        if request.method == 'POST':
            deleted_id = request.form.get('deleted_id')
            print(deleted_id)
            cursor = connection.cursor()
            test_delete_query = "DELETE FROM ahm_testimonial WHERE testimonial_id = %s"
            cursor.execute(test_delete_query, (deleted_id,))
            connection.commit()
            return jsonify({'success': 'Delete Success'})
        return jsonify({'error': 'Invalid request'})
    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})

@app.route('/edu_work', methods=['GET','POST'])
def edu_work():
    try:
        with connection.cursor() as cursor:
            # SQL query to fetch data from the users table
            users_service_products_sql = "SELECT * FROM ahm_edu_work"
            cursor.execute(users_service_products_sql)
            service_products_data = cursor.fetchall()
        # print(service_products_data)
        return jsonify(service_products_data)  
    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})


@app.route('/edu_work_add', methods=['POST'])
def edu_work_add():
    try:
        if request.method == 'POST':
            json_data = request.form.get('json_data')
            json_data = json.loads(json_data)
            print(json_data)
            institute_name = json_data.get('name')
            position = json_data.get('position')
            category = json_data.get('category')
            start_time = json_data.get('start_time')
            show_data = json_data.get('show')
            name_value = show_data.get('name')
            position_value = show_data.get('position')
            time_value = show_data.get('time')
            if(json_data.get('end_time') == ''):
                end_time = 'Present'
            else:
                end_time = json_data.get('end_time')
            try:
                with connection.cursor() as cursor:
                    serive_add_sql = "INSERT INTO ahm_edu_work (institute_name, name_show, degree_or_position, position_show, start_date, end_date, time_frame_show, category) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
                    cursor.execute(serive_add_sql, (institute_name,name_value, position, position_value, start_time, end_time, time_value, category))
                    connection.commit()

                return jsonify({'success': 'Service/Product Insert Success'})
                    
            except Exception as e:
                return jsonify({'error': f"Database error: {str(e)}"})

    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})  

@app.route('/edu_work_update', methods=['POST'])
def edu_work_update():
    try:
        if request.method == 'POST':
            json_data = request.form.get('json_data')
            json_data = json.loads(json_data)
            print(json_data)
            updated_id = json_data.get('edu_work_id')
            institute_name = json_data.get('name')
            position = json_data.get('position')
            category = json_data.get('category')
            show_data = json_data.get('show')
            start_time = json_data.get('start_time')
            print(show_data)
            name_value = show_data.get('name')
            position_value = show_data.get('position')
            time_value = show_data.get('time')

            print(position_value)
            if(json_data.get('end_time') == ''):
                end_time = 'Present'
            else:
                end_time = json_data.get('end_time')
            
            try:
                with connection.cursor() as cursor:
                    serive_update_sql = "UPDATE ahm_edu_work SET institute_name=%s, name_show=%s, degree_or_position=%s, position_show=%s, start_date=%s, end_date=%s, time_frame_show=%s, category=%s WHERE edu_work_id =%s"
                    cursor.execute(serive_update_sql, (institute_name,name_value, position, position_value, start_time, end_time, time_value, category, updated_id))
                    connection.commit()

                return jsonify({'success': 'Service/Product Update Success'})
                    
            except Exception as e:
                return jsonify({'error': f"Database error: {str(e)}"})

    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})        

@app.route('/edu_work_delete', methods=['GET','POST'])
def edu_work_delete():
    try:
        if request.method == 'POST':
            deleted_id = request.form.get('deleted_id')
            print(deleted_id)
            cursor = connection.cursor()
            edu_work_delete_query = "DELETE FROM ahm_edu_work WHERE edu_work_id  = %s"
            cursor.execute(edu_work_delete_query, (deleted_id,))
            connection.commit()
            return jsonify({'success': 'Delete Success'})
        return jsonify({'error': 'Invalid request'})
    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})


@app.route('/services', methods=['GET','POST'])
def services():
    try:
        with connection.cursor() as cursor:
            # SQL query to fetch data from the users table
            users_service_products_sql = "SELECT * FROM service_products"
            cursor.execute(users_service_products_sql)
            service_products_data = cursor.fetchall()
        # print(service_products_data)
        return jsonify(service_products_data)  
    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})


@app.route('/services_add', methods=['POST'])
def services_add():
    try:
        if request.method == 'POST':
            json_data = request.form.get('json_data')
            json_data = json.loads(json_data)

            services_name = json_data.get('name')
            services_details = json_data.get('details')
            services_category = json_data.get('category')
            print(services_name)
            print(services_details)
            print(services_category)

            file = request.files['file']
            # file_photo_name = file.filename
            original_filename = secure_filename(file.filename)
    
            # Replace spaces with underscores in the original filename
            filename_without_spaces = original_filename.replace(' ', '_')
            new_filename = f"{services_category}_{filename_without_spaces}"
            print(new_filename)

            if file and new_filename != '':
                try:
                    # Perform database update
                    with connection.cursor() as cursor:
                        serive_update_sql = "INSERT INTO service_products(title_name, description, cover_image, category) VALUES (%s, %s, %s, %s)"
                        cursor.execute(serive_update_sql, (services_name, services_details, new_filename, services_category))
                        connection.commit()

                    # Save the file
                    file_path = os.path.join('static/mainassets/images/media', new_filename)
                    file.save(file_path)

                    return jsonify({'success': 'Service/Product Insert Success'})
                    
                except Exception as e:
                    return jsonify({'error': f"Database error: {str(e)}"})
            else:
                print('In Here')
                return jsonify({'error': f"Database error: {str(e)}"})
                
    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})


@app.route('/services_edit', methods=['POST'])
def services_edit():
    try:
        if request.method == 'POST':
            json_data = request.form.get('json_data')
            json_data = json.loads(json_data)

            services_id = json_data.get('service_id')
            services_name = json_data.get('name')
            services_details = json_data.get('details')
            services_category = json_data.get('category')
            print(services_id)
            print(services_name)
            print(services_details)
            print(services_category)

            file = request.files['file'] 
            
            file_photo_name = file.filename
            print(file)

            if file and file.filename != '':
                try:
                    # Perform database update
                    with connection.cursor() as cursor:
                        serive_update_sql = "UPDATE service_products SET title_name=%s, description=%s, cover_image=%s, category=%s WHERE service_product_id =%s"
                        cursor.execute(serive_update_sql, (services_name, services_details, file_photo_name, services_category, services_id))
                        connection.commit()

                    # Save the file
                    file_path = os.path.join('static/mainassets/images/media', file_photo_name)
                    file.save(file_path)

                    return jsonify({'success': 'Service/Product Update Success'})
                    
                except Exception as e:
                    return jsonify({'error': f"Database error: {str(e)}"})
            
            else:
                print('In Here')
                try:
                    # Perform database update
                    with connection.cursor() as cursor:
                        serive_update_sql = "UPDATE service_products SET title_name=%s, description=%s, category=%s WHERE service_product_id =%s"
                        cursor.execute(serive_update_sql, (services_name, services_details, services_category, services_id))
                        connection.commit()

                    return jsonify({'success': 'Service/Product Update Success'})
                    
                except Exception as e:
                    return jsonify({'error': f"Database error: {str(e)}"})
                
    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})


@app.route('/services_delete', methods=['GET','POST'])
def services_delete():
    try:
        if request.method == 'POST':
            deleted_id = request.form.get('id')
            print(deleted_id)
            cursor = connection.cursor()
            serives_delete_query = "DELETE FROM service_products WHERE service_product_id  = %s"
            cursor.execute(serives_delete_query, (deleted_id,))
            connection.commit()
            return jsonify({'success': 'Delete Success'})
        return jsonify({'error': 'Invalid request'})
    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})   

@app.route('/gallary', methods=['GET','POST'])
def gallary():
    try:
        with connection.cursor() as cursor:
            # SQL query to fetch data from the users table
            users_gallary_sql = "SELECT * FROM ahm_gallary_partners"
            cursor.execute(users_gallary_sql)
            gallary_data = cursor.fetchall()
        # print(service_products_data)
        return jsonify(gallary_data)  
    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})
    
@app.route('/user_gallery', methods=['GET','POST'])
def get_user_gallary():
    try:
        with connection.cursor() as cursor:
            # SQL query to fetch data from the users table
            # users_gallary_sql = "SELECT * FROM ahm_gallary_partners LIMIT 6"
            users_gallary_sql = "SELECT * FROM ahm_gallary_partners WHERE category = 'gallary' LIMIT 6"
            cursor.execute(users_gallary_sql)
            gallary_data = cursor.fetchall()
            
           
            count_query = "SELECT COUNT(g_p_id) FROM ahm_gallary_partners WHERE category = 'gallary'"
            cursor.execute(count_query)
            total_records = cursor.fetchone()
            count_value = total_records['COUNT(g_p_id)']
            
        
        limit_per_page = 6
        total_pages = (count_value + limit_per_page)
        
        # print(gallary_data)
        # sys.exit(1)
        
        total_pages = math.ceil(total_pages / limit_per_page)-1

        return render_template('user_gallary.html', gallaries=gallary_data, current_page=1, total_pages=total_pages)
    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})
    
    

# GET NEXT 10 IMAGES
PER_PAGE = 6  # Number of items per page
START_PAGE = 2  # Starting page number

@app.route('/user_gallary_pagination', methods=['GET'])
def user_gallary_pagination():
    try:
        # Get the page number from the request arguments, default to START_PAGE if not provided
        page = request.args.get('page', START_PAGE, type=int)
        
        selected_year = request.args.get('selected_year')

        # Calculate the OFFSET based on the page number and number of items per page
        offset = (page - 1) * PER_PAGE

        with connection.cursor() as cursor:
            
            if selected_year:
                # SQL query to fetch paginated data from the users table
                users_gallary_sql = f"SELECT * FROM ahm_gallary_partners WHERE category = 'gallary' and year=%s LIMIT %s OFFSET %s"
                cursor.execute(users_gallary_sql, (selected_year, PER_PAGE, offset))
                gallary_data = cursor.fetchall()
                
                count_query = f"SELECT COUNT(g_p_id) FROM ahm_gallary_partners WHERE category = 'gallary' and year=%s"
                cursor.execute(count_query, (selected_year))
                total_records = cursor.fetchone()
                count_value = total_records['COUNT(g_p_id)']
            else:
                 # SQL query to fetch paginated data from the users table
                users_gallary_sql = f"SELECT * FROM ahm_gallary_partners WHERE category = 'gallary' LIMIT %s OFFSET %s"
                cursor.execute(users_gallary_sql, (PER_PAGE, offset))
                gallary_data = cursor.fetchall()
                
                count_query = "SELECT COUNT(g_p_id) FROM ahm_gallary_partners WHERE category = 'gallary'"
                cursor.execute(count_query)
                total_records = cursor.fetchone()
                count_value = total_records['COUNT(g_p_id)']
            
            
           
            
        limit_per_page = 6
        total_pages = (count_value + limit_per_page)
        
        # print(gallary_data)
        # sys.exit(1)
        
        total_pages = math.ceil(total_pages / limit_per_page)-1

        return jsonify({'galleries': gallary_data, 'page': page, 'total_pages': total_pages})

    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})
    

@app.route('/user_gallery_by_year', methods=['GET', 'POST'])
def get_user_gallery_by_year():
    
    if request.method == 'POST':
    
        try:
            data = request.json
            selected_year = data['year']
            
            
            with connection.cursor() as cursor:
                # SQL query to fetch data from the ahm_gallary_partners table based on selected year
                users_gallary_sql = "SELECT * FROM ahm_gallary_partners WHERE category = 'gallary' AND year = %s"
                cursor.execute(users_gallary_sql, (selected_year,))
                gallary_data = cursor.fetchall()
                
                count_query = "SELECT COUNT(g_p_id) FROM ahm_gallary_partners WHERE category = 'gallary' AND year = %s"
                cursor.execute(count_query, (selected_year,))
                total_records = cursor.fetchone()
                count_value = total_records['COUNT(g_p_id)']
                
            limit_per_page = 6
            total_pages = math.ceil(count_value / limit_per_page)
            
            # return render_template('user_gallary.html', gallaries=gallary_data, current_page=1, total_pages=total_pages)
            return jsonify({'galleries': gallary_data, 'current_page': 1, 'total_pages': total_pages})
        except Exception as e:
            return jsonify({'error': f"Request error: {str(e)}"})




# @app.route('/upload_gellary', methods=['POST'])
# def upload():
#     if request.method == 'POST':
#         image_name = request.form['image_name']
#         short_details = request.form['short_details']
#         category = request.form['category']
#         file_photo = request.files['file_photo']
#         show = request.form['show_gallery']

#         print(show)
#         photo_name = file_photo.filename
#         # print(short_details)
#         original_filename = secure_filename(photo_name)
#         filename_without_spaces = original_filename.replace(' ', '_')
#         new_filename = f"{category}_{filename_without_spaces}"
#         if file_photo and file_photo.filename != '':
#             try:
#                 with connection.cursor() as cursor:
#                     cursor.execute('INSERT INTO ahm_gallary_partners (image_title, image_short_details, image_name, show, category) VALUES (%s, %s, %s,%s, %s)',
#                         (image_name, short_details, new_filename, show, category))
#                     connection.commit()
#                     file_path = os.path.join('static/mainassets/images/media', new_filename)
#                     file_photo.save(file_path)
#                     return jsonify({'success': 'Image Upload Success'})
                
#             except Exception as e:
#                 return jsonify({'error': f"Request error: {str(e)}"})
#         else:
#             return jsonify({'success': 'No file uploaded or empty filename.'})

@app.route('/upload_gellary', methods=['POST'])
def upload():
    if request.method == 'POST':
        image_name = request.form['image_name']
        short_details = request.form['short_details']
        category = request.form['category']
        file_photo = request.files['file_photo']
        year = request.form['year']
        event = request.form['event']

        # print(radio)
        photo_name = file_photo.filename
        # print(short_details)
        original_filename = secure_filename(photo_name)
        filename_without_spaces = original_filename.replace(' ', '_')
        new_filename = f"{category}_{filename_without_spaces}"
        if file_photo and file_photo.filename != '':
            try:
                with connection.cursor() as cursor:
                    cursor.execute('INSERT INTO ahm_gallary_partners (image_title, image_short_details, image_name, category, year, event) VALUES (%s, %s,%s, %s, %s, %s)',
                        (image_name, short_details, new_filename, category, year, event))
                    connection.commit()
                    file_path = os.path.join('static/mainassets/images/media', new_filename)
                    file_photo.save(file_path)
                    return jsonify({'success': 'Image Upload Success'})
                
            except Exception as e:
                return jsonify({'error': f"Request error: {str(e)}"})
        else:
            return jsonify({'success': 'No file uploaded or empty filename.'})

@app.route('/gallary_edit', methods=['GET','POST'])
def gallary_edit():
    if request.method == 'POST':
        json_data = request.form.get('json_data')
        json_data_dict = json.loads(json_data)
        image_id = json_data_dict.get('gallary_id')
        image_name = json_data_dict.get('image_name')
        short_details = json_data_dict.get('short_details')
        year = json_data_dict.get('year')
        event = json_data_dict.get('event')
        show_data = json_data_dict.get('show')
        show = show_data.get('gallery')

        
        print(show_data)
        # Get the file from the request
        file_photo = request.files['file_photo']
        file_name = file_photo.filename
        original_filename = secure_filename(file_name)
        filename_without_spaces = original_filename.replace(' ', '_')
        new_filename = f"gallery_{filename_without_spaces}"
        if file_photo and file_photo.filename != '':
            try:
                with connection.cursor() as cursor:
                    sql = "UPDATE ahm_gallary_partners SET image_title=%s, image_short_details=%s, image_name=%s, `show`=%s, `year`=%s, `event`=%s WHERE g_p_id =%s"
                    # Get user ID from session or however you manage it
                    cursor.execute(sql, (image_name, short_details, year, event, new_filename, show, image_id))
                    connection.commit()
                    file_path = os.path.join('static/mainassets/images/media', new_filename)
                    file_photo.save(file_path)
                    return jsonify({'success': 'Image Edited Success'})
            except Exception as e:
                return jsonify({'error': f"Request error: {str(e)}"})
        else:
            try:
                with connection.cursor() as cursor:
                    sql = "UPDATE ahm_gallary_partners SET image_title=%s, image_short_details=%s, `show`=%s WHERE g_p_id =%s"
                    # Get user ID from session or however you manage it
                    cursor.execute(sql, (image_name, short_details, show, image_id))
                    connection.commit()
                    return jsonify({'success': 'Image Edited Success'})
            except Exception as e:
                return jsonify({'error': f"Request error: {str(e)}"})



@app.route('/gallary_delete', methods=['GET','POST'])
def gallary_delete():
    try:
        if request.method == 'POST':
            gallery_id = request.form.get('gallary_id')
            print(gallery_id)
            cursor = connection.cursor()
            event_delete_query = "DELETE FROM ahm_gallary_partners WHERE g_p_id = %s"
            cursor.execute(event_delete_query, (gallery_id,))
            connection.commit()
            return jsonify({'success': 'Delete Success'})
        return jsonify({'error': 'Invalid request'})
    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})
    

@app.route('/trainee_list', methods=['GET', 'POST'])
def trainee_list():
    if 'loggedin' in session and session['loggedin']:
        try:
            with connection.cursor() as cursor:
                trainee_sql = "SELECT * FROM trainees"
                cursor.execute(trainee_sql)
                trainee_data = cursor.fetchall()
                return render_template('trainee_list.html', trainees=trainee_data)
        except Exception as e:
            return jsonify({'error': f"Request error: {str(e)}"})
    else:
        return redirect(url_for('admin'))
    


# @app.route('/trainee_list_edit', methods=['GET','POST'])
# def trainee_list_edit():
#     if request.method == 'POST':
#         json_data = request.form.get('json_data')
#         json_data_dict = json.loads(json_data)
#         if request.method == 'POST':
#                 full_name = request.form.get('full_name')
#                 email = request.form.get('email')
#                 organization = request.form.get('organization')
#                 phone_number = request.form.get('phone_number')
#                 address = request.form.get('address')
#                 educational_level = request.form.get('educational_level')
#                 skills = request.form.get('skills')
#                 freelancing_experience = request.form.get('freelancing_experience')
#                 portfolio_link = request.form.get('portfolio_link')
#                 language_proficiency = request.form.get('language_proficiency')
#                 show_data = json_data_dict.get('show')
#                 show = show_data.get('trainee_list')

        
#         print(show_data)
#         if full_name and address and email and educational_level and phone_number != '':
#             try:
#                 with connection.cursor() as cursor:
#                     sql = "UPDATE trainees SET full_name=%s, organization=%s, email=%s, phone_number=%s, address=%s, educational_level=%s, skills=%s, freelancing_experience=%s, portfolio_link=%s, language_proficiency=%s `show`=%s WHERE trainee_id =%s"
#                     # Get user ID from session or however you manage it
#                     cursor.execute(sql, (full_name, organization, email, phone_number, address, educational_level, skills, freelancing_experience, portfolio_link, language_proficiency, show, trainee_id))
#                     connection.commit()
#                     return jsonify({'success': 'Trainee Edit Successful'})
#             except Exception as e:
#                 return jsonify({'error': f"Request error: {str(e)}"})
#         else:
#             try:
#                 with connection.cursor() as cursor:
#                     sql = "UPDATE trainees SET full_name=%s, organization=%s, email=%s, phone_number=%s, address=%s, educational_level=%s, skills=%s, freelancing_experience=%s, portfolio_link=%s, language_proficiency=%s `show`=%s WHERE trainee_id =%s"
#                     # Get user ID from session or however you manage it
#                     cursor.execute(sql, (full_name, organization, email, phone_number, address, educational_level, skills, freelancing_experience, portfolio_link, language_proficiency, show, trainee_id))
#                     connection.commit()
#                     return jsonify({'success': 'Trainee Info Successfully edited.'})
#             except Exception as e:
#                 return jsonify({'error': f"Request error: {str(e)}"})    
        
@app.route('/trainee_list_edit/<int:trainee_id>', methods=['GET','POST'])
def trainee_list_edit(trainee_id):
    if request.method == 'POST':
        trainee_id = request.form.get('trainee_id')
        full_name = request.form.get('full_name')
        email = request.form.get('email')
        organization = request.form.get('organization')
        phone_number = request.form.get('phone_number')
        address = request.form.get('address')
        educational_level = request.form.get('educational_level')
        skills = request.form.get('skills')
        freelancing_experience = request.form.get('freelancing_experience')
        portfolio_link = request.form.get('portfolio_link')
        language_proficiency = request.form.get('language_proficiency')

        # Perform database operations
        try:
            with connection.cursor() as cursor:
                trainee_update_sql = "UPDATE trainees SET full_name=%s, organization=%s, email=%s, phone_number=%s, address=%s, educational_level=%s, skills=%s, freelancing_experience=%s, portfolio_link=%s, language_proficiency=%s WHERE trainee_id = %s"
                cursor.execute(trainee_update_sql, (full_name, organization, email, phone_number, address, educational_level, skills, freelancing_experience, portfolio_link, language_proficiency, trainee_id))
                connection.commit()

            return jsonify({'success': 'Trainee info updated successfully'}), 200
        except Exception as e:
            return jsonify({'error': f"Request error: {str(e)}"}), 500


@app.route('/trainee_delete/<int:trainee_id>', methods=['GET','POST'])
def trainee_delete(trainee_id):
    try:
        if request.method == 'POST':
            # trainee_id = request.form.get('trainee_id ')
            # print(trainee_id )
            cursor = connection.cursor()
            event_delete_query = "DELETE FROM trainees  WHERE trainee_id  = %s"
            cursor.execute(event_delete_query, (trainee_id,))
            connection.commit()
            return jsonify({'success': 'Delete Success'})
        return jsonify({'error': 'Invalid request'})
    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})
    
@app.route('/blogs', methods=['GET', 'POST'])
def get_blogs():
        try:
            with connection.cursor() as cursor:
                blog_sql = "SELECT * FROM blogs ORDER BY created_at DESC LIMIT 6" 
                cursor.execute(blog_sql)
                blog_data = cursor.fetchall()
                return render_template('blogs.html', blogs=blog_data)
        except Exception as e:
            return jsonify({'error': f"Request error: {str(e)}"})    
        
@app.route('/blogs_admin_panel', methods=['GET', 'POST'])
def get_blogs_admin_panel():
    if 'loggedin' in session and session['loggedin']:
        try:
            with connection.cursor() as cursor:
                blog_sql = "SELECT * FROM blogs"
                cursor.execute(blog_sql)
                blog_data = cursor.fetchall()
                return render_template('blogs_admin_panel.html', blogs=blog_data)
        except Exception as e:
            return jsonify({'error': f"Request error: {str(e)}"})   
    else:
        return redirect(url_for('admin'))             


# @app.route('/blog_creation', methods=['GET', 'POST'])
# def create_blogs():
#     try:
#         if request.method == 'POST':
#             writers_name = request.form.get('writers_name')
#             topic = request.form.get('topic')
#             blog_headline = request.form.get('blog_headline')
#             blog_details = request.form.get('blog_details')
           

#         # Check for required fields
#             if not ([writers_name, topic, blog_headline, blog_details]):
#                 return jsonify({"message": "You must fill up these required fields."}), 400
            
#             # Perform database operations
#             with connection.cursor() as cursor:
#                 blog_create_sql = "INSERT INTO blogs  (writers_name, topic, blog_headline, blog_details) VALUES (%s, %s, %s, %s)"
#                 cursor.execute(blog_create_sql, (writers_name, topic, blog_headline, blog_details))
#                 connection.commit()

#             return jsonify({'success': 'Blog Creation successful'}), 200
        
#         elif request.method == 'GET':
#             return jsonify({'message': 'GET request received'}), 200

#     except Exception as e:
#         return jsonify({'error': f"Request error: {str(e)}"}), 500

@app.route('/blog_creation', methods=['POST'])
def create_blogs():
    try:
        if request.method == 'POST':
            # image = request.form['image']
            writers_name = request.form.get('writers_name')
            topic = request.form.get('topic')
            blog_headline = request.form.get('blog_headline')
            blog_details = request.form.get('blog_details')

            # Check for required fields
            if not all([writers_name, topic, blog_headline, blog_details]):
                return jsonify({"message": "You must fill up all required fields."}), 400
            
            # Save the image file
            file_photo = request.files['file_photo']
            if file_photo.filename != '':
                image = secure_filename(file_photo.filename)
                file_path = os.path.join('static/mainassets/images/blog_images', image)
                file_photo.save(file_path)
                
            # Perform database operations
            with connection.cursor() as cursor:
                blog_create_sql = "INSERT INTO blogs  (image, writers_name, topic, blog_headline, blog_details) VALUES (%s, %s, %s, %s, %s)"
                cursor.execute(blog_create_sql, (image, writers_name, topic, blog_headline, blog_details))
                connection.commit()

            return jsonify({'success': 'Blog Creation successful'}), 200

    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"}), 500



@app.route('/blog_delete/<int:blog_id>', methods=['GET','POST'])
def blog_delete(blog_id):
    try:
        if request.method == 'POST':
            cursor = connection.cursor()
            event_delete_query = "DELETE FROM blogs  WHERE blog_id  = %s"
            cursor.execute(event_delete_query, (blog_id))
            connection.commit()
            return jsonify({'success': 'Delete Success'})
        return jsonify({'error': 'Invalid request'})
    except Exception as e:
        return jsonify({'error': f"Request error: {str(e)}"})

@app.route('/email_send', methods=['GET','POST'])
def email_send():
    if request.method == 'POST':
        sender_name = request.form['name']
        sender_mail = request.form['email']
        sender_message = request.form['message']
        recieve_mail = ['contact@ahmedul.com','ahmedulbabu@gmail.com']

        root_email = "contact@ahmedul.com"
        subject = 'Contact with me from Ahmedul.com'
        message_body = render_template('email_send.html',
                                        name=sender_name, email= sender_mail, message =sender_message)
        msg = Message(subject, sender=root_email, recipients=recieve_mail)
        msg.html = message_body 
        

        try:
            # Send the email using Flask-Mail
            mail.send(msg)
            print('Verification email sent successfully!')
            return redirect('/')
        except Exception as e:
            pass


@app.route('/show_hide_update', methods=['GET', 'POST'])
def show_hide_update():
    try:
        if request.method == 'POST':
            json_data = request.form.get('json_data')
            json_data = json.loads(json_data)

            updated_id = json_data.get('id')
            name = json_data.get('name')
            status = json_data.get('status')

            with connection.cursor() as cursor:
                serive_update_sql = "UPDATE hide_show SET name=%s, status=%s WHERE id = %s"
                cursor.execute(serive_update_sql, (name, status, updated_id))
                connection.commit()

            return jsonify({'success': 'Update Success'})

    except Exception as e:
        return jsonify({'error': f"Database error: {str(e)}"})


# Define a route to render the index.html template
@app.route('/deshboard')
def deshboard():
    if 'loggedin' in session and session['loggedin']:
        return render_template('deshboard.html')
    else:
        return redirect(url_for('admin'))
    
@app.route('/admin')
def admin():
    if 'loggedin' in session and session['loggedin']:
        return redirect(url_for('deshboard'))
    else:
        return render_template('login.html')

@app.route('/ahm_profile')
def ahm_profile():
    if 'loggedin' in session and session['loggedin']:
        return render_template('ahm_profile.html')
    else:
        return redirect(url_for('admin'))
    

@app.route('/profile_dashboard')
def profile_dashboard():
    if 'loggedin' in session and session['loggedin']:
        return render_template('profile_dashboard.html')
    else:
        return redirect(url_for('trainee_login'))
    

@app.route('/ahm_edu_work')
def ahm_edu_work():
    if 'loggedin' in session and session['loggedin']:
        return render_template('ahm_edu_work.html')
    else:
        return redirect(url_for('admin'))
    
    
@app.route('/ahm_social_testimonial')
def ahm_social_testimonial():
    if 'loggedin' in session and session['loggedin']:
        return render_template('ahm_social_testimonial.html')
    else:
        return redirect(url_for('admin'))
    

@app.route('/ahm_service_products')
def ahm_service_products():
    if 'loggedin' in session and session['loggedin']:
        return render_template('ahm_service_products.html')
    else:
        return redirect(url_for('admin'))
    

@app.route('/ahm_gallery_part')
def ahm_gallery_part():
    if 'loggedin' in session and session['loggedin']:
        return render_template('ahm_gallery_part.html')
    else:
        return redirect(url_for('admin'))
    
@app.route('/ahm_show_hide')
def ahm_show_hide():
    if 'loggedin' in session and session['loggedin']:
        return render_template('ahm_show_hide.html')
    else:
        return redirect(url_for('admin'))




@app.route('/logout')
def logout():
    session.clear()
    return redirect(url_for('admin')) 

@app.route('/trainee_logout')
def trainee_logout():
    session.clear()
    return redirect(url_for('trainee_login')) 

# @app.route('/trainee_list')
# def trainee_list():
#     if 'loggedin' in session and session['loggedin']:
#         return render_template('trainee_list.html')
#     else:
#         return redirect(url_for('admin'))


@app.route('/trainee_registration')
def trainee_registration():
    return render_template('trainee_registration.html')

@app.route('/trainee_login')
def trainee_login():
    return render_template('login_trainee.html')


@app.route('/blogs')
def blogs():
    return render_template('blogs.html')

@app.route('/blogs_admin_panel')
def blogs_admin_panel():
    return render_template('blogs_admin_panel.html')

@app.route('/user_gallery')
def user_gallary():
    return render_template('user_gallary.html')    


if __name__ == '__main__':
    app.run(debug=True)


