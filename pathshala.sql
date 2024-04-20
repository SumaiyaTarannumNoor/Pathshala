-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2024 at 08:57 AM
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
(1, 'Bangladesh', '5/9 Block B, Lalmatia, Mohammadpur Dhaka-1207, BANGLADESH', '+880 1713-453337', '+880 1713-453337', '+880 1713-453337', 'ahmedulbabu@gmail.com', '2024-01-17 11:51:15'),
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
  `create_at` datetime NOT NULL,
  `year` int(11) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ahm_gallary_partners`
--

INSERT INTO `ahm_gallary_partners` (`g_p_id`, `image_title`, `image_short_details`, `image_name`, `show`, `category`, `create_at`, `year`, `event`) VALUES
(2, 'Ict Division', 'Ict Division', 'hi_tech.png', 1, 'partners', '2024-01-09 12:27:24', NULL, NULL),
(4, '', '', 'microsense.png', 1, 'partners', '2024-01-09 12:26:20', NULL, NULL),
(5, '', '', 'nanma.png', 1, 'partners', '2024-01-09 12:27:24', NULL, NULL),
(6, '', '', 'ict_devision.png', 1, 'partners', '2024-01-09 12:27:24', NULL, NULL),
(13, 'Nothing', '‘শুরুসি ককাসনা ডকছু বুঝিাম না। গুগল ও ইউটউব কেসট ডিখসি লাগলাম।\nে্লিার কেসয় ব্যথিে াই কবডি হসি লাগল। এখনকার মসিা িখন এি ককাসেরে\nব্যবস্থাও ডছল না। অসনক ইসে ডছল ওসয়ব-কিসভলপসমসন্টর ওপর কাি করব।\nকেটাসি খুব কবডি ে্লিা না আোয় ডিডিটাল মাসকটে িংসয়র ওপর কাি করসি\n ', 'gallery_Amy_Toensing-300x300.jpg', 1, 'gallary', '0000-00-00 00:00:00', NULL, NULL),
(21, 'TechKnowGram', 'TechKnowGram', 'techknowgram.png', 1, 'partners', '2024-01-28 07:16:19', NULL, NULL),
(22, 'Blanket Distribution', '‘শুরুসি ককাসনা ডকছু বুঝিাম না। গুগল ও ইউটউব কেসট ডিখসি লাগলাম।\nে্লিার কেসয় ব্যথিে াই কবডি হসি লাগল। এখনকার মসিা িখন এি ককাসেরে\nব্যবস্থাও ডছল না। অসনক ইসে ডছল ওসয়ব-কিসভলপসমসন্টর ওপর কাি করব।\nকেটাসি খুব কবডি ে্লিা না আোয় ডিডিটাল মাসকটে িংসয়র ওপর কাি করসি\n ', 'gallary_Amy_Toensing-300x300.jpg', 1, 'gallary', '0000-00-00 00:00:00', NULL, NULL),
(24, 'Blanket Distribution', '‘শুরুসি ককাসনা ডকছু বুঝিাম না। গুগল ও ইউটউব কেসট ডিখসি লাগলাম।\r\nে্লিার কেসয় ব্যথিে াই কবডি হসি লাগল। এখনকার মসিা িখন এি ককাসেরে\r\nব্যবস্থাও ডছল না। অসনক ইসে ডছল ওসয়ব-কিসভলপসমসন্টর ওপর কাি করব।\r\nকেটাসি খুব কবডি ে্লিা না আোয় ডিডিটাল মাসকটে িংসয়র ওপর কাি করস', 'gallary_Amy_Toensing-300x300.jpg', 0, 'gallary', '0000-00-00 00:00:00', NULL, NULL),
(25, 'Blanket Distribution', '‘শুরুসি ককাসনা ডকছু বুঝিাম না। গুগল ও ইউটউব কেসট ডিখসি লাগলাম।\nে্লিার কেসয় ব্যথিে াই কবডি হসি লাগল। এখনকার মসিা িখন এি ককাসেরে\nব্যবস্থাও ডছল না। অসনক ইসে ডছল ওসয়ব-কিসভলপসমসন্টর ওপর কাি করব।\nকেটাসি খুব কবডি ে্লিা না আোয় ডিডিটাল মাসকটে িংসয়র ওপর কাি করস', 'gallary_Amy_Toensing-300x300.jpg', 1, 'gallary', '0000-00-00 00:00:00', NULL, NULL),
(26, 'Blanket Distribution', '‘শুরুসি ককাসনা ডকছু বুঝিাম না। গুগল ও ইউটউব কেসট ডিখসি লাগলাম।\nে্লিার কেসয় ব্যথিে াই কবডি হসি লাগল। এখনকার মসিা িখন এি ককাসেরে\nব্যবস্থাও ডছল না। অসনক ইসে ডছল ওসয়ব-কিসভলপসমসন্টর ওপর কাি করব।\nকেটাসি খুব কবডি ে্লিা না আোয় ডিডিটাল মাসকটে িংসয়র ওপর কাি করস', 'gallary_Amy_Toensing-300x300.jpg', 1, 'gallary', '0000-00-00 00:00:00', NULL, NULL),
(27, 'Test', 'frgfaergg', 'gallary_6201-SeriesHeaders_NARSHP_2000x800.jpg', 0, 'gallary', '0000-00-00 00:00:00', 2019, '{\"year\": null}'),
(28, 'rgtr', 'brghrhb', 'gallary_6201-SeriesHeaders_NARSHP_2000x800.jpg', 0, 'gallary', '0000-00-00 00:00:00', 2019, '{\"year\": null}'),
(29, 'dfbg', 'fvdfv', 'gallary_6201-SeriesHeaders_NARSHP_2000x800.jpg', 0, 'gallary', '0000-00-00 00:00:00', 2019, 'wfrefger'),
(30, 'rf', 'refhjrebgf', 'gallary_custom-3d-wallpaper-naruto-photo-wallpaper.jpg', 0, 'gallary', '0000-00-00 00:00:00', 0, 'ferfgtghrt'),
(31, '2test', 'dfberfjhedljfefej\'pk', 'gallary_custom-3d-wallpaper-naruto-photo-wallpaper.jpg', 0, 'gallary', '0000-00-00 00:00:00', 0, 'nwfwkfjnreof'),
(32, 'rfgreg', 'gqegeg', 'gallary_custom-3d-wallpaper-naruto-photo-wallpaper.jpg', 0, 'gallary', '0000-00-00 00:00:00', 2020, 'fjefrefk'),
(33, 'gretg', 'frgfreg', 'gallary_custom-3d-wallpaper-naruto-photo-wallpaper.jpg', 0, 'gallary', '0000-00-00 00:00:00', 2021, 'Basis Program');

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
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  `header_6` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ahm_profile`
--

INSERT INTO `ahm_profile` (`profile_id`, `name`, `about`, `logo`, `header_1`, `header_2`, `header_3`, `header_4`, `header_5`, `create_at`, `header_6`) VALUES
(1, 'Freelancing Pathshala', '\"Freelancing Pathshala” is a television training program on digital course which is going to be aired on Nexus Television from 1st January 2024 in collaboration with the Directorate of ICT to achieve the goal of Digital Bangladesh and to improve the skills of the youth society through freelancing. The program will be telecast on Nexus Television as live. The program will cover various topics which have importance to freelancing platform', 'logo_aa.jpg', 'Home', 'Education & Work', 'Services & Products', 'Partners & Gallery', 'Contact', '2024-01-09 11:10:04', 'Blogs & Articles');

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
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `blog_id` int(11) NOT NULL,
  `writers_name` varchar(50) NOT NULL,
  `topic` varchar(255) NOT NULL,
  `blog_headline` varchar(100) NOT NULL,
  `blog_details` text NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`blog_id`, `writers_name`, `topic`, `blog_headline`, `blog_details`, `created_at`, `image`) VALUES
(3, 'Sumaiya', 'AI', 'Random AI is GAINING Popularity', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean at leo eros. Nulla sagittis orci nec pulvinar commodo. Fusce eget accumsan justo. In id sodales arcu. Cras faucibus elementum lacus, a cursus nulla pharetra id. Ut varius tellus bibendum vehicula vehicula. Nullam nec orci vitae lacus lobortis porttitor. In hac habitasse platea dictumst. Fusce blandit, massa auctor rutrum efficitur, erat turpis mollis urna, a tincidunt felis mi id eros. Pellentesque suscipit nisi ut varius iaculis. Morbi quis malesuada felis. Integer malesuada nibh vitae libero luctus, ut porttitor dui aliquet.\r\n\r\nPellentesque in ornare ante. Sed eu ante ac arcu elementum tristique et id nunc. Cras gravida vehicula diam, non efficitur ligula efficitur vel. Aliquam vitae aliquet erat. Quisque id ipsum turpis. Duis at purus erat. Sed venenatis purus vitae nunc ornare, vitae fringilla purus lobortis. Nunc pellentesque eu ligula a pellentesque. Curabitur urna magna, tempor sed posuere aliquet, pretium eget nisi. Pellentesque sit amet metus justo. Mauris facilisis eros eu luctus pulvinar.\r\n\r\nSed eu velit turpis. Sed tincidunt tellus ut neque efficitur pulvinar. Ut semper urna vitae lacinia blandit. Nam eget gravida lacus. Ut orci ante, mattis eget tempus at, gravida ut nisi. Proin nec auctor ligula. Maecenas at dictum lectus, eget aliquet lectus. Vivamus a placerat lorem, et rhoncus mauris. Nam sollicitudin quam eget erat tristique efficitur. Mauris laoreet, risus id rhoncus volutpat, diam sem scelerisque nibh, ac eleifend sem nisi non turpis. Nam scelerisque ipsum pulvinar sagittis blandit. Aliquam erat volutpat. Nullam bibendum neque id ante aliquam blandit. Proin lacinia congue mauris eget porta. Nam scelerisque molestie sodales. Donec non nisl quis dolor vehicula ornare.\r\n\r\nPraesent in porta lacus, quis ultricies urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur maximus luctus felis ac congue. In aliquam fringilla eros. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer vitae consectetur purus. Nulla justo nunc, porttitor sed volutpat faucibus, euismod vitae leo. Mauris eget leo et nunc egestas elementum at in sem. Suspendisse eleifend felis eget tellus vestibulum ultricies. Aliquam mattis felis quis cursus tincidunt. Nullam at faucibus elit. Fusce eleifend tincidunt condimentum.\r\n\r\nPraesent vehicula scelerisque lobortis. Suspendisse elit massa, faucibus quis dignissim efficitur, molestie gravida nibh. Donec venenatis metus eget risus faucibus, posuere varius ex interdum. Mauris bibendum, ex in mollis posuere, lorem justo rutrum nibh, nec pulvinar metus magna finibus velit. Phasellus fermentum augue vel enim aliquet, sed finibus nisi eleifend. Morbi semper, quam at semper dictum, felis enim posuere nunc, sit amet congue justo massa in leo. Proin id est in diam venenatis cursus. Cras a luctus turpis. Proin commodo, erat sed gravida semper, purus tortor ullamcorper velit, fermentum consectetur nulla ante at felis.', '2024-03-13 07:44:21', NULL),
(4, 'Sumaiya', 'Development', 'How to Change the World', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean at leo eros. Nulla sagittis orci nec pulvinar commodo. Fusce eget accumsan justo. In id sodales arcu. Cras faucibus elementum lacus, a cursus nulla pharetra id. Ut varius tellus bibendum vehicula vehicula. Nullam nec orci vitae lacus lobortis porttitor. In hac habitasse platea dictumst. Fusce blandit, massa auctor rutrum efficitur, erat turpis mollis urna, a tincidunt felis mi id eros. Pellentesque suscipit nisi ut varius iaculis. Morbi quis malesuada felis. Integer malesuada nibh vitae libero luctus, ut porttitor dui aliquet.\r\n\r\nPellentesque in ornare ante. Sed eu ante ac arcu elementum tristique et id nunc. Cras gravida vehicula diam, non efficitur ligula efficitur vel. Aliquam vitae aliquet erat. Quisque id ipsum turpis. Duis at purus erat. Sed venenatis purus vitae nunc ornare, vitae fringilla purus lobortis. Nunc pellentesque eu ligula a pellentesque. Curabitur urna magna, tempor sed posuere aliquet, pretium eget nisi. Pellentesque sit amet metus justo. Mauris facilisis eros eu luctus pulvinar.\r\n\r\nSed eu velit turpis. Sed tincidunt tellus ut neque efficitur pulvinar. Ut semper urna vitae lacinia blandit. Nam eget gravida lacus. Ut orci ante, mattis eget tempus at, gravida ut nisi. Proin nec auctor ligula. Maecenas at dictum lectus, eget aliquet lectus. Vivamus a placerat lorem, et rhoncus mauris. Nam sollicitudin quam eget erat tristique efficitur. Mauris laoreet, risus id rhoncus volutpat, diam sem scelerisque nibh, ac eleifend sem nisi non turpis. Nam scelerisque ipsum pulvinar sagittis blandit. Aliquam erat volutpat. Nullam bibendum neque id ante aliquam blandit. Proin lacinia congue mauris eget porta. Nam scelerisque molestie sodales. Donec non nisl quis dolor vehicula ornare.\r\n\r\nPraesent in porta lacus, quis ultricies urna. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Curabitur maximus luctus felis ac congue. In aliquam fringilla eros. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer vitae consectetur purus. Nulla justo nunc, porttitor sed volutpat faucibus, euismod vitae leo. Mauris eget leo et nunc egestas elementum at in sem. Suspendisse eleifend felis eget tellus vestibulum ultricies. Aliquam mattis felis quis cursus tincidunt. Nullam at faucibus elit. Fusce eleifend tincidunt condimentum.\r\n\r\nPraesent vehicula scelerisque lobortis. Suspendisse elit massa, faucibus quis dignissim efficitur, molestie gravida nibh. Donec venenatis metus eget risus faucibus, posuere varius ex interdum. Mauris bibendum, ex in mollis posuere, lorem justo rutrum nibh, nec pulvinar metus magna finibus velit. Phasellus fermentum augue vel enim aliquet, sed finibus nisi eleifend. Morbi semper, quam at semper dictum, felis enim posuere nunc, sit amet congue justo massa in leo. Proin id est in diam venenatis cursus. Cras a luctus turpis. Proin commodo, erat sed gravida semper, purus tortor ullamcorper velit, fermentum consectetur nulla ante at felis.', '2024-03-13 07:44:36', NULL),
(5, 'Sumaiys', 'Development', 'Never Try This', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', '2024-03-25 05:55:36', NULL),
(6, 'Sumaiys', 'AI', 'Let Us Celebrate', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', '2024-03-25 05:55:59', NULL),
(11, 'DFSBVDFBV', 'Developmentzdfbv', 'Random AI is GAINING Popularity', 'FXDGDFGHGFXDH', '2024-03-25 08:16:37', '6201-SeriesHeaders_NARSHP_2000x800.jpg'),
(13, 'Sumaiya', 'Development', 'Naruto Is Over, Accept It', 'Tarty giant letter generator uses text symbols ▓▒░▄█▀▌▐─. █▀█ █▄█ ▀█▀ / █▬█ █ ▀█▀ font (no, not ▟▛ █▬█ █ ▜▛ font) uses a different bunch of symbols to fonm letters. By the way, check out my collection of text drawings. ≧^◡^≦ When you\'ll find a copy of my big text generators around the internet - there\'s plenty of copies, please know that this is the actual original and we actually designed all of these big letters with my friends, including ASCII Text Art Generator and 𝗧𝗲𝘅𝘁 font copy paste. Proud and angry!', '2024-03-25 08:46:57', '6201-SeriesHeaders_NARSHP_2000x800.jpg'),
(14, 'Sumaiya', 'Development', 'Naruto Is Over, Accept It', 'Tarty giant letter generator uses text symbols ▓▒░▄█▀▌▐─. █▀█ █▄█ ▀█▀ / █▬█ █ ▀█▀ font (no, not ▟▛ █▬█ █ ▜▛ font) uses a different bunch of symbols to fonm letters. By the way, check out my collection of text drawings. ≧^◡^≦ When you\'ll find a copy of my big text generators around the internet - there\'s plenty of copies, please know that this is the actual original and we actually designed all of these big letters with my friends, including ASCII Text Art Generator and 𝗧𝗲𝘅𝘁 font copy paste. Proud and angry!', '2024-03-25 08:47:44', '6201-SeriesHeaders_NARSHP_2000x800.jpg'),
(15, 'Sumaiya', 'Development', 'Naruto Rules Forever', 'The plot of the Naruto series is told across several different time periods, known as Part I, Part II, the Blank Period, New Era: Part I, and New Era: Part II. These time periods are themselves broken into several story arcs comprised of manga chapters, anime episodes, and/or other media types. This article attempts to present these sections of the story in order, though the chronology sometimes differs between different adaptations of the same material.', '2024-03-27 06:10:46', 'custom-3d-wallpaper-naruto-photo-wallpaper.jpg'),
(16, 'Fluffy', 'Anime', 'Naruto', 'Naruto vs Sasuke soon to be seen.', '2024-04-20 06:46:53', '6201-SeriesHeaders_NARSHP_2000x800.jpg'),
(17, 'Fluffy', 'Anime', 'Naruto ', 'We are going to re watch the season.', '2024-04-20 06:49:01', 'custom-3d-wallpaper-naruto-photo-wallpaper.jpg');

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
  `freelancing_experience` enum('0-1 year','1-3 years','3-5 years','more than 5 years') DEFAULT NULL,
  `portfolio_link` varchar(255) DEFAULT NULL,
  `availability` varchar(50) DEFAULT NULL,
  `preferred_work_type` varchar(100) DEFAULT NULL,
  `hourly_rate` decimal(10,2) DEFAULT NULL,
  `certifications` text DEFAULT NULL,
  `linkedIn_profile` varchar(255) DEFAULT NULL,
  `github_profile` varchar(255) DEFAULT NULL,
  `course_joining_date` date NOT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `language_proficiency` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `done_trainings` text DEFAULT NULL,
  `wantTo_trainings` text DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `joined_on` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainees`
--

INSERT INTO `trainees` (`trainee_id`, `full_name`, `email`, `phone_number`, `address`, `skills`, `educational_level`, `institution`, `educational_certificates`, `freelancing_experience`, `portfolio_link`, `availability`, `preferred_work_type`, `hourly_rate`, `certifications`, `linkedIn_profile`, `github_profile`, `course_joining_date`, `organization`, `language_proficiency`, `done_trainings`, `wantTo_trainings`, `password`, `joined_on`) VALUES
(19, 'fdrfraef', 'g3g@gmail.com', '3534534', 'Dhaka', 'deigning', 'HSC', NULL, NULL, '', 'twt', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'TKG', 'Bangla, English', NULL, NULL, '', '2024-03-31 06:06:03'),
(20, 'r34err', 'egfrqeg@yahoo.com', 'ff', 'rff', 'freref', 'HSC', NULL, NULL, '', 'ef', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'rewr', 'Arabic', NULL, NULL, '', '2024-03-31 06:06:03'),
(21, 'dd', 'fff@gmail.com', '43535', '554654', '', 'HSC', NULL, NULL, '', '{\"fiverr\": \"https://getbootstrap.com/docs/4.0/utilities/spacing/\", \"upwork\": \"\", \"freelancer\": \"\", \"toptal\": \"\", \"guru\": \"\", \"other\": \"\"}', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'asddd', '', NULL, NULL, '', '2024-03-31 06:06:03'),
(22, 'Sony', 'sony.croft@gmail.com', '232343546', 'Dhanmondi, Dhaka', 'Graphic Design', 'MSc', NULL, NULL, '3-5 years', '{\"fiverr\": \"https://getbootstrap.com/docs/4.0/utilities/spacing/\", \"upwork\": \"\", \"freelancer\": \"\", \"toptal\": \"\", \"guru\": \"\", \"other\": \"https://getbootstrap.com/docs/4.0/utilities/spacing/\"}', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'TKG', 'Bangla, English', NULL, NULL, '', '2024-03-31 06:06:03'),
(23, 'ewrfewrf', 'rfrefg@gmail.com', 'ggg', 'regeg', 'gfg', 'HSC', NULL, NULL, '0-1 year', '{\"fiverr\": \"https://getbootstrap.com/docs/4.0/utilities/spacing/\", \"guru\": \"https://getbootstrap.com/docs/4.0/utilities/spacing/\"}', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'regg', 'Bangla', NULL, NULL, '', '2024-03-31 06:06:03'),
(24, 'Sakib', 'sakib@gmail.com', '345354654', 'Dhanmondi, Dhaka', 'deigning', 'BSc', NULL, NULL, '1-3 years', '{\"other\": \"https://app.prntscr.com/en/download.html\"}', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'TKG', 'English, Other', NULL, NULL, '', '2024-03-31 06:06:03'),
(25, 'tret', 'tger@gmail.com', '567y56756', 'dasdcd', 'yy', 'SSC', NULL, NULL, '3-5 years', '{\"other\": \"https://app.prntscr.com/en/download.html\"}', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'tgre', 'Other', NULL, NULL, '', '2024-03-31 06:06:03'),
(26, 'tt', 's56756@gmail.com', 'yhehe', 'tywr', 'asdA', 'HSC', NULL, NULL, '0-1 year', '{}', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'TKG', 'Hindi', NULL, NULL, '', '2024-03-31 06:06:03'),
(27, 'fdfe', 's254@gmail.com', 'ghnhn', 'nghnn', 'mnhn', 'HSC', NULL, NULL, '3-5 years', '{\"guru\": \"nghnthn\"}', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'thnh', 'Bangla', 'Data Entry, hnh', NULL, '', '2024-03-31 06:06:03'),
(28, 'yytyrty', 's6546546@gmail.com', 'tj', 'jyj', '', 'HSC', NULL, NULL, '1-3 years', '{}', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'yy', '', 'Copywriting, kjjkmj', NULL, '', '2024-03-31 06:06:03'),
(29, 'gdfb', 'frewrfe@email.com', 'dvfv', 'fvdfav', 'svav', 'HSC', NULL, NULL, '1-3 years', '{\"upwork\": \"dfvdfv\"}', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'dscsd', 'English', 'vdfv', 'avdvdv', '', '2024-03-31 06:06:03'),
(30, 'koli', 'koli.koli@email.com', '402834', 'Dhanmondi, Dhaka', 'Graphic Design', 'HSC', NULL, NULL, '1-3 years', '{\"upwork\": \"dfqeferf\"}', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'TKG', 'Bangla, fvfv', 'Copywriting, Data Entry, SEO', 'Copywriting, Data Entry, SEO', '', '2024-03-31 06:06:03'),
(31, 'wefrf', 'ffefewf@gmail.com', '4', 'dfv', 'ASDASD', 'SSC', NULL, NULL, '0-1 year', '{}', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'fdsfdfvd', 'Bangla', '', '', '12345', '2024-03-31 06:06:03'),
(32, 'fregfe', 'srewrf@gmail.com', '645676', 'Dhaka', 'deigning', 'HSC', NULL, NULL, '0-1 year', '{\"fiverr\": \"v nvbn vbn\"}', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'TKG', 'Bangla', '', '', 'weer', '2024-03-31 06:06:03'),
(33, 'Fluffy', 'fluffy@email.com', '3424355', 'Dhanmondi, Dhaka', 'Graphic Design, Video Editting', 'SSC', NULL, NULL, '0-1 year', '{\"fiverr\": \"Fiverr login\", \"other\": \"Other\"}', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'TKG', 'Bangla, English', 'UX/UI Design', 'Copywriting, Hello', '12345', '2024-03-31 06:06:03'),
(34, 'Fluffy', 'fluffy1@email.com', '334244534', 'Dhanmondi, Dhaka', '', 'BSc', NULL, NULL, '3-5 years', '{\"fiverr\": \"wfgrwbrgb\"}', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'TKG', 'Bangla, English', 'UX/UI Design, gdfgfb', 'UX/UI Design', '12345', '2024-03-31 06:06:03'),
(35, 'Nihar', 'nihar@gmail.com', '354646', 'Dhanmondi, Dhaka', 'Graphic Design', 'BSc', NULL, NULL, '1-3 years', '{\"fiverr\": \"Fiverr\", \"other\": \"Nothing\"}', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'TKG', 'Bangla, English', 'Copywriting, Graphic Design, UX/UI Design', 'Copywriting, Graphic Design, UX/UI Design', 'nihar', '2024-03-31 08:03:05'),
(36, 'Nitu', 'nitu@gmail.com', '5465767', 'Dhanmondi, Dhaka', 'Graphic Design', 'BSc', NULL, NULL, '3-5 years', '{\"fiverr\": \"Fiverr\"}', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'TKG', 'Bangla, English', 'Copywriting, Video Editing', 'Copywriting', '1234', '2024-04-02 04:21:03'),
(37, 'Kolim', 'kolim@gmail.com', '54647676', 'Dhanmondi, Dhaka', 'SEO', 'SSC', NULL, NULL, '0-1 year', '{\"upwork\": \"upwork profile url\"}', NULL, NULL, NULL, NULL, NULL, NULL, '0000-00-00', 'TKG', 'Bangla, English', 'Copywriting', 'Digital Marketing', '', '2024-04-03 08:47:13');

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
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`blog_id`);

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
  MODIFY `g_p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

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
  MODIFY `trainee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
