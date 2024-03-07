-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2024 at 05:58 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pathshala`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `email`, `pass`) VALUES
(1, 'Lelin Chakma', 'ahmedul', 'Tkgl@432!');

-- --------------------------------------------------------

--
-- Table structure for table `ahm_address`
--

CREATE TABLE `ahm_address` (
  `address_id` int(11) NOT NULL,
  `address_title` varchar(50) NOT NULL,
  `address` varchar(256) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `whatsapp` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ahm_address`
--

INSERT INTO `ahm_address` (`address_id`, `address_title`, `address`, `phone`, `mobile`, `whatsapp`, `mail`, `created_at`) VALUES
(1, 'Bangladesh', '5/9 Block B, Lalmatia, Mohammadpur Dhaka-1207, BANGLADESH', '+880 1713-453337', '', '+880 1713-453337', 'ahmedulbabu@gmail.com', '2024-01-17 11:51:15'),
(2, 'Japan', '東京都世田谷区尾山台 1丁目10番4号, 日本', '+880 1713-453337', '', '+880 1713-453337', 'ahmedulbabu@gmail.com', '2024-01-17 11:51:15');

-- --------------------------------------------------------

--
-- Table structure for table `ahm_edu_work`
--

CREATE TABLE `ahm_edu_work` (
  `edu_work_id` int(11) NOT NULL,
  `institute_name` varchar(256) NOT NULL,
  `name_show` tinyint(1) NOT NULL,
  `degree_or_position` varchar(256) NOT NULL,
  `position_show` tinyint(1) NOT NULL,
  `start_date` varchar(10) NOT NULL,
  `end_date` varchar(10) NOT NULL,
  `time_frame_show` tinyint(1) NOT NULL,
  `category` varchar(20) NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ahm_edu_work`
--

INSERT INTO `ahm_edu_work` (`edu_work_id`, `institute_name`, `name_show`, `degree_or_position`, `position_show`, `start_date`, `end_date`, `time_frame_show`, `category`, `create_at`) VALUES
(1, 'Bangladesh Association of Software and Information Services (BASIS)', 1, 'Director', 1, '', 'Present', 0, 'work', '2024-01-09 07:11:43'),
(2, 'Bangladesh Association of Contact Center and Outsourcing (BACCO)', 1, 'Director', 1, '', 'Present', 0, 'work', '2024-01-09 07:11:43'),
(5, 'University of Dhaka', 1, 'Master of Applied Physics & Electronics <br> Bachelor of Science with Honours in Applied Physics and Electronics', 1, '2024-01', '2024-04', 0, 'education', '2024-01-09 07:14:56'),
(7, 'Presidency University, Bangladesh', 1, 'Master of Business Administration', 1, '', 'Present', 0, 'education', '2024-01-09 07:15:48'),
(8, 'IBA - University of Dhaka, Bangladesh', 1, 'Advanced Certificate for Management Professionals (ACMP) 4.0', 1, '2023-06', 'Present', 0, 'education', '2024-01-09 07:15:48'),
(9, 'BDJP Consulting Limited', 1, 'Chairman & CEO', 1, '', 'Present', 0, 'work', '2024-01-09 11:49:29'),
(10, 'Federation of Bangladesh Chambers of Commerce & Industries (FBCCI)', 1, 'GB Member', 1, '', 'Present', 0, 'work', '2024-01-09 11:50:22'),
(13, '', 0, 'Training Program & System Software by BASIS with the support of Asia Invest Programme of the Commission of European Union in collaboration with the University if Bremen, Germany and Paris Chamber of Commerece Industries (CCIP), France.', 1, '2023-06', 'Present', 0, 'training', '2024-01-09 07:15:48'),
(15, 'Japan-Bangladesh Chamber of Commerce and Industry (JBCCI)', 1, 'GB Member', 1, '', 'Present', 1, 'work', '2024-01-09 11:50:22'),
(16, 'TechKnowGram Limited', 1, 'Founder & CEO', 1, '2021-06', 'Present', 0, 'work', '0000-00-00 00:00:00'),
(18, 'Government Science College, Bangladesh', 1, 'Secondary School Certificate <br>\nHigher Secondary School Certificate', 1, '2021-06', 'Present', 0, 'education', '0000-00-00 00:00:00'),
(19, 'Sobjanta AI', 1, 'Founder & CEO', 1, '2021-06', 'Present', 0, 'work', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ahm_gallary_partners`
--

CREATE TABLE `ahm_gallary_partners` (
  `g_p_id` int(11) NOT NULL,
  `image_title` varchar(50) NOT NULL,
  `image_short_details` varchar(255) NOT NULL,
  `image_name` varchar(100) NOT NULL,
  `show` tinyint(1) NOT NULL,
  `category` varchar(25) NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ahm_gallary_partners`
--

INSERT INTO `ahm_gallary_partners` (`g_p_id`, `image_title`, `image_short_details`, `image_name`, `show`, `category`, `create_at`) VALUES
(2, 'Ict Division', 'Ict Division', 'hi_tech.png', 1, 'partners', '2024-01-09 12:27:24'),
(4, '', '', 'microsense.png', 1, 'partners', '2024-01-09 12:26:20'),
(5, '', '', 'nanma.png', 1, 'partners', '2024-01-09 12:27:24'),
(6, '', '', 'ict_devision.png', 1, 'partners', '2024-01-09 12:27:24'),
(13, 'Nothing', '‘শুরুসি ককাসনা ডকছু বুঝিাম না। গুগল ও ইউটউব কেসট ডিখসি লাগলাম।\nে্লিার কেসয় ব্যথিে াই কবডি হসি লাগল। এখনকার মসিা িখন এি ককাসেরে\nব্যবস্থাও ডছল না। অসনক ইসে ডছল ওসয়ব-কিসভলপসমসন্টর ওপর কাি করব।\nকেটাসি খুব কবডি ে্লিা না আোয় ডিডিটাল মাসকটে িংসয়র ওপর কাি করসি\n ', 'gallery_Amy_Toensing-300x300.jpg', 1, 'gallary', '0000-00-00 00:00:00'),
(21, 'TechKnowGram', 'TechKnowGram', 'techknowgram.png', 1, 'partners', '2024-01-28 07:16:19'),
(22, 'Blanket Distribution', '‘শুরুসি ককাসনা ডকছু বুঝিাম না। গুগল ও ইউটউব কেসট ডিখসি লাগলাম।\nে্লিার কেসয় ব্যথিে াই কবডি হসি লাগল। এখনকার মসিা িখন এি ককাসেরে\nব্যবস্থাও ডছল না। অসনক ইসে ডছল ওসয়ব-কিসভলপসমসন্টর ওপর কাি করব।\nকেটাসি খুব কবডি ে্লিা না আোয় ডিডিটাল মাসকটে িংসয়র ওপর কাি করসি\n ', 'gallary_Amy_Toensing-300x300.jpg', 1, 'gallary', '0000-00-00 00:00:00'),
(24, 'Blanket Distribution', '‘শুরুসি ককাসনা ডকছু বুঝিাম না। গুগল ও ইউটউব কেসট ডিখসি লাগলাম।\r\nে্লিার কেসয় ব্যথিে াই কবডি হসি লাগল। এখনকার মসিা িখন এি ককাসেরে\r\nব্যবস্থাও ডছল না। অসনক ইসে ডছল ওসয়ব-কিসভলপসমসন্টর ওপর কাি করব।\r\nকেটাসি খুব কবডি ে্লিা না আোয় ডিডিটাল মাসকটে িংসয়র ওপর কাি করস', 'gallary_Amy_Toensing-300x300.jpg', 0, 'gallary', '0000-00-00 00:00:00'),
(25, 'Blanket Distribution', '‘শুরুসি ককাসনা ডকছু বুঝিাম না। গুগল ও ইউটউব কেসট ডিখসি লাগলাম।\nে্লিার কেসয় ব্যথিে াই কবডি হসি লাগল। এখনকার মসিা িখন এি ককাসেরে\nব্যবস্থাও ডছল না। অসনক ইসে ডছল ওসয়ব-কিসভলপসমসন্টর ওপর কাি করব।\nকেটাসি খুব কবডি ে্লিা না আোয় ডিডিটাল মাসকটে িংসয়র ওপর কাি করস', 'gallary_Amy_Toensing-300x300.jpg', 1, 'gallary', '0000-00-00 00:00:00'),
(26, 'Blanket Distribution', '‘শুরুসি ককাসনা ডকছু বুঝিাম না। গুগল ও ইউটউব কেসট ডিখসি লাগলাম।\nে্লিার কেসয় ব্যথিে াই কবডি হসি লাগল। এখনকার মসিা িখন এি ককাসেরে\nব্যবস্থাও ডছল না। অসনক ইসে ডছল ওসয়ব-কিসভলপসমসন্টর ওপর কাি করব।\nকেটাসি খুব কবডি ে্লিা না আোয় ডিডিটাল মাসকটে িংসয়র ওপর কাি করস', 'gallary_Amy_Toensing-300x300.jpg', 1, 'gallary', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ahm_profile`
--

CREATE TABLE `ahm_profile` (
  `profile_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `about` text NOT NULL,
  `logo` varchar(250) NOT NULL,
  `header_1` varchar(50) NOT NULL,
  `header_2` varchar(50) NOT NULL,
  `header_3` varchar(50) NOT NULL,
  `header_4` varchar(50) NOT NULL,
  `header_5` varchar(50) NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ahm_profile`
--

INSERT INTO `ahm_profile` (`profile_id`, `name`, `about`, `logo`, `header_1`, `header_2`, `header_3`, `header_4`, `header_5`, `create_at`) VALUES
(1, 'Freelancing Pathshala', '\"Freelancing Pathshala” is a television training program on digital course which is going to be aired on Nexus Television from 1st January 2024 in collaboration with the Directorate of ICT to achieve the goal of Digital Bangladesh and to improve the skills of the youth society through freelancing. The program will be telecast on Nexus Television as live. The program will cover various topics which have importance to freelancing platform', 'logo_aa.jpg', 'Home', 'Education & Work', 'Services & Products', 'Partners & Gallery', 'Contact', '2024-01-09 11:10:04');

-- --------------------------------------------------------

--
-- Table structure for table `ahm_profile_photos`
--

CREATE TABLE `ahm_profile_photos` (
  `photos_id` int(11) NOT NULL,
  `photos_name` varchar(255) NOT NULL,
  `photos_size` varchar(255) NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ahm_profile_photos`
--

INSERT INTO `ahm_profile_photos` (`photos_id`, `photos_name`, `photos_size`, `create_at`) VALUES
(1, 'profile_1_benefits-of-technology-in-classroom.jpg', '2423523', '2024-01-13 07:33:57'),
(2, 'profile_2_ICT_image.jpeg', '2423523', '2024-01-13 07:33:57'),
(3, 'profile_3_digital-marketing-scaled.jpg', '2423523', '2024-01-13 07:33:57'),
(4, 'profile_4_download.webp', '2423523', '2024-01-13 07:33:57');

-- --------------------------------------------------------

--
-- Table structure for table `ahm_social`
--

CREATE TABLE `ahm_social` (
  `social_id` int(11) NOT NULL,
  `social_name` varchar(50) NOT NULL,
  `social_link` varchar(255) NOT NULL,
  `social_show` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ahm_social`
--

INSERT INTO `ahm_social` (`social_id`, `social_name`, `social_link`, `social_show`, `created_at`) VALUES
(1, 'facebook', 'https://www.facebook.com/', 1, '2024-01-13 15:16:25'),
(2, 'twitter', 'https://www.twitter.com/', 1, '2024-01-13 15:16:25'),
(4, 'linkedin', 'https://www.linkedin.com/in/', 1, '2024-01-13 15:50:47'),
(5, 'boxicons', 'https://boxicons.com/?query=cir', 0, '2024-01-28 10:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `ahm_testimonial`
--

CREATE TABLE `ahm_testimonial` (
  `testimonial_id` int(11) NOT NULL,
  `testimonial_details` varchar(1000) NOT NULL,
  `testimonial_name` varchar(50) NOT NULL,
  `testimonial_photo` varchar(256) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ahm_testimonial`
--

INSERT INTO `ahm_testimonial` (`testimonial_id`, `testimonial_details`, `testimonial_name`, `testimonial_photo`, `created_at`) VALUES
(2, 'Ahmedul had been brilliant in getting my work done. He and his team are problem solvers and provided a spontaneous vision of how to build on and clarify whatever was requested. TechKnowGram is praised for its ability to develop workable solutions and for its attention to professional service', 'Hirokazu Yoshida', 'testimonial_awaweqwe_Screenshot_2023-12-19_204453.png', '2024-01-13 15:25:46'),
(3, 'TechKnowGram delivered our work quickly and provided designs that attracted both our clients and partners, while also eliminating the need for a business analyst. They offer a complete solution for all client requirements, making them a valuable asset for any customer.', 'Kenta Kato', 'testimonial_awaweqwe_Screenshot_2023-12-19_204453.png', '2024-01-13 15:25:46'),
(4, 'TechKnowGram’s team provided fast and flexible service with considerable expertise. Their unique approach to assessing feedback helped me solve my problem. Ahmed, their leader, is highly regarded for his unwavering commitment to justice.', 'Malliga Subramanium', 'testimonial_awaweqwe_Screenshot_2023-12-19_204453.png', '2024-01-13 15:25:46'),
(5, 'TechKnowGram and Ahmedul worked for us for quite some time. The whole team of Ahmedul became solution provider. They presented a remarkable positive attitude. All the work was done in a short span of time and the team achieved the impossible', 'Kinya Ishii', 'testimonial_awaweqwe_Screenshot_2023-12-19_204453.png', '2024-01-13 15:25:46');

-- --------------------------------------------------------

--
-- Table structure for table `hide_show`
--

CREATE TABLE `hide_show` (
  `id` int(11) NOT NULL,
  `identity` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `update_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hide_show`
--

INSERT INTO `hide_show` (`id`, `identity`, `name`, `status`, `update_at`, `created_at`) VALUES
(1, 'about', 'about', 1, '2024-01-31 11:13:27', '2024-01-31 11:13:27'),
(2, 'service', 'service', 1, '2024-01-31 11:13:27', '2024-01-31 11:13:27'),
(3, 'product', 'product', 0, '2024-01-31 11:13:27', '2024-01-31 11:13:27'),
(4, 'client', 'partners', 1, '2024-01-31 11:13:27', '2024-01-31 11:13:27'),
(5, 'gallery', 'gallery', 1, '2024-01-31 11:13:27', '2024-01-31 11:13:27'),
(6, 'testimonial', 'testimonial', 0, '2024-01-31 11:13:27', '2024-01-31 11:13:27'),
(7, 'social', 'social', 1, '2024-01-31 11:13:27', '2024-01-31 11:13:27'),
(8, 'address', 'address', 1, '2024-01-31 11:13:27', '2024-01-31 11:13:27'),
(9, 'contact', 'contact', 1, '2024-01-31 11:13:27', '2024-01-31 11:13:27'),
(10, 'education', 'education', 0, '2024-01-31 11:13:27', '2024-01-31 11:13:27'),
(11, 'work', 'work', 0, '2024-01-31 11:13:27', '2024-01-31 11:13:27');

-- --------------------------------------------------------

--
-- Table structure for table `service_products`
--

CREATE TABLE `service_products` (
  `service_product_id` int(11) NOT NULL,
  `title_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `cover_image` varchar(255) NOT NULL,
  `category` varchar(25) NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_products`
--

INSERT INTO `service_products` (`service_product_id`, `title_name`, `description`, `cover_image`, `category`, `create_at`) VALUES
(5, 'Sobjanta AI', 'Sobjanta Is A Generative AI-Based Personal Assistant. It also known as a conversational AI or chatbot trained to be informative and comprehensive. It can able to communicate and generate human-like text in response to a wide range of prompts and questions', 'logo-bk2.png', 'products', '2024-01-10 05:55:54'),
(6, 'Bridge Management System', 'The Roads and Highways Department (RHD) of Bangladesh Government is responsible for maintaining and managing the country\'s road and bridge infrastructure.', 'bms.png', 'products', '2024-01-10 05:55:54'),
(7, 'TKGL ERP', 'TechknowGram Limited offers its own Enterprise Resource Planning solution called TKG ERP, which can be tailored to meet the unique needs of any business entity, including those in the Construction Industry, Education, Manufacturing, Workshops, and RMG ind', 'tkgerp.png', 'products', '2024-01-10 05:57:19'),
(8, 'QuizWin', 'QuizWin is an interactive quiz platform for knowledge enthusiasts, as its name implies. We offer a range of quiz events that users can participate in and potentially win prizes. The leaderboard provides a complete competitive experience.Ideal solution for', 'quiz.png', 'products', '2024-01-10 05:57:19'),
(9, 'Prostuti', 'TechKnowGram has created Prostuti,an exam management platform for institutes to administer exams. The platform was designed with the goal of automating the exam process, which can often be tedious and repetitive.', 'prostuti.png', 'products', '2024-01-10 05:58:40'),
(10, 'KHOZ', 'KHOZ is a recently developed project for Beacon-based Indoor Navigation System that incorporates IoT technology to deliver precise and up-to-date location data to users navigating indoor environments. The system operates by using beacons - small, cost-eff', 'khoz.png', 'products', '2024-01-10 05:58:40'),
(12, 'TKG MIS', 'TechknowGram Limited offers its own Management Information System solution called TKG MIS, which can be tailored to meet the unique needs of any business entity, including those in the Construction Industry, Education, Manufacturing, Workshops, and RMG industries. This ERP is developed and supported with the latest 4IR technology.', 'tkgmis.png', 'products', '2024-01-10 05:57:19'),
(13, 'TKG HRM', 'TechknowGram Limited offers its own Human Resource Management solution called TKG HRM, which can be tailored to meet the unique needs of any business entity, including those in the Construction Industry, Education, Manufacturing, Workshops, and RMG industries. This ERP is developed and supported with the latest 4IR technology.', 'tkghrm.png', 'products', '2024-01-10 05:57:19'),
(19, 'Digital Marketing', 'Analysts & Developers of TechKnowGram Limited love creating application and tools to solve your specific business issues but, our first job, as creative software specialists, is to listen you. We want to hear about your business challenges so that we can ', 'digital-marketing-scaled.jpg', 'services', '0000-00-00 00:00:00'),
(20, 'Digital Marketing', 'Analysts & Developers of TechKnowGram Limited love creating application and tools to solve your specific business issues but, our first job, as creative software specialists, is to listen you. We want to hear about your business challenges so that we can ', 'products_illustration-graphic-vector-digital-marketing-for-different-purpose-FWENFT.jpg', 'products', '0000-00-00 00:00:00'),
(24, 'Freelancing Basics', 'Analysts & Developers of TechKnowGram Limited love creating application and tools to solve your specific business issues but, our first job, as creative software specialists, is to listen you. We want to hear about your business challenges so that we can ', 'download.webp', 'services', '0000-00-00 00:00:00'),
(25, 'Data Visualization', 'Analysts & Developers of TechKnowGram Limited love creating application and tools to solve your specific business issues but, our first job, as creative software specialists, is to listen you. We want to hear about your business challenges so that we can ', '10-types-of-data-visualization-1.jpg', 'services', '0000-00-00 00:00:00'),
(26, 'Graphics Design', 'Analysts & Developers of TechKnowGram Limited love creating application and tools to solve your specific business issues but, our first job, as creative software specialists, is to listen you. We want to hear about your business challenges so that we can ', 'Graphic-Design-Course.-1.png', 'services', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `trainees`
--

CREATE TABLE `trainees` (
  `trainee_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `address` varchar(255) NOT NULL,
  `skills` text DEFAULT NULL,
  `educational_level` varchar(50) DEFAULT NULL,
  `institution` varchar(255) DEFAULT NULL,
  `educational_certificates` varchar(255) DEFAULT NULL,
  `freelancing_experience` varchar(255) DEFAULT NULL,
  `portfolio_link` varchar(255) DEFAULT NULL,
  `availability` varchar(50) DEFAULT NULL,
  `preferred_work_type` varchar(100) DEFAULT NULL,
  `hourly_rate` decimal(10,2) DEFAULT NULL,
  `language_proficiency` varchar(100) DEFAULT NULL,
  `certifications` text DEFAULT NULL,
  `linkedIn_profile` varchar(255) DEFAULT NULL,
  `github_profile` varchar(255) DEFAULT NULL,
  `course_joining_date` date NOT NULL,
  `organization` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainees`
--

INSERT INTO `trainees` (`trainee_id`, `full_name`, `email`, `phone_number`, `address`, `skills`, `educational_level`, `institution`, `educational_certificates`, `freelancing_experience`, `portfolio_link`, `availability`, `preferred_work_type`, `hourly_rate`, `language_proficiency`, `certifications`, `linkedIn_profile`, `github_profile`, `course_joining_date`, `organization`) VALUES
(4, 'ede', 's2@gmail.com', 'wedw', 'dsd', NULL, 'dsda', 'asd', 'sdasd', NULL, NULL, 'sd', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-07', 'TKG'),
(6, 'ede', 's6@gmail.com', 'wedw', 'dsd', NULL, 'dsda', 'asd', 'sdasd', NULL, NULL, 'sd', NULL, NULL, NULL, NULL, NULL, NULL, '2024-02-07', 'TKG'),
(7, 'Shelly', 'shelly@gmail.com', '402834', 'ty road', '', 'HSc', 'Lalmatia mohila college', 'SSc, HSc', 'none', 'none', 'none', 'none', 0.00, 'none', 'none', 'none', 'none', '2024-02-28', 'TKG'),
(8, 'Kashif', 'kashif@gmail.com', '9078564', 'Dhanmondi, Dhaka', NULL, 'BSc', 'South East University', 'BSc', '', '', 'Not Available', '', 0.00, '', '', '', '', '2024-03-06', 'TKG'),
(9, 'Safa', 'safa@yahoo.com', '453459565406', 'Dhaka', '', 'BSc', NULL, NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, '0000-00-00', 'TKG'),
(10, 'Robi', 'robi@yahoo.com', '624343489', 'Dhaka', '', 'BBA', NULL, NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, '0000-00-00', ''),
(11, 'Sony', 'sony@gmail.com', '5345893409', 'Dhaka', '', 'BSc', NULL, NULL, '', '', NULL, NULL, NULL, '', NULL, NULL, NULL, '0000-00-00', 'TKG');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `ahm_address`
--
ALTER TABLE `ahm_address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `ahm_edu_work`
--
ALTER TABLE `ahm_edu_work`
  ADD PRIMARY KEY (`edu_work_id`);

--
-- Indexes for table `ahm_gallary_partners`
--
ALTER TABLE `ahm_gallary_partners`
  ADD PRIMARY KEY (`g_p_id`);

--
-- Indexes for table `ahm_profile`
--
ALTER TABLE `ahm_profile`
  ADD PRIMARY KEY (`profile_id`);

--
-- Indexes for table `ahm_profile_photos`
--
ALTER TABLE `ahm_profile_photos`
  ADD PRIMARY KEY (`photos_id`);

--
-- Indexes for table `ahm_social`
--
ALTER TABLE `ahm_social`
  ADD PRIMARY KEY (`social_id`);

--
-- Indexes for table `ahm_testimonial`
--
ALTER TABLE `ahm_testimonial`
  ADD PRIMARY KEY (`testimonial_id`);

--
-- Indexes for table `hide_show`
--
ALTER TABLE `hide_show`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_products`
--
ALTER TABLE `service_products`
  ADD PRIMARY KEY (`service_product_id`);

--
-- Indexes for table `trainees`
--
ALTER TABLE `trainees`
  ADD PRIMARY KEY (`trainee_id`),
  ADD UNIQUE KEY `EmailAddress` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ahm_address`
--
ALTER TABLE `ahm_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ahm_edu_work`
--
ALTER TABLE `ahm_edu_work`
  MODIFY `edu_work_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `ahm_gallary_partners`
--
ALTER TABLE `ahm_gallary_partners`
  MODIFY `g_p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `ahm_profile`
--
ALTER TABLE `ahm_profile`
  MODIFY `profile_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ahm_profile_photos`
--
ALTER TABLE `ahm_profile_photos`
  MODIFY `photos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ahm_social`
--
ALTER TABLE `ahm_social`
  MODIFY `social_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ahm_testimonial`
--
ALTER TABLE `ahm_testimonial`
  MODIFY `testimonial_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hide_show`
--
ALTER TABLE `hide_show`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `service_products`
--
ALTER TABLE `service_products`
  MODIFY `service_product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `trainees`
--
ALTER TABLE `trainees`
  MODIFY `trainee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
