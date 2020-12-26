-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Dec 26, 2020 at 09:12 PM
-- Server version: 5.7.32
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elearning`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cour_id` int(11) NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `sections_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`id`, `user_id`, `name`, `cour_id`, `file`, `description`, `sections_id`) VALUES
(1, 19, 'Activity 1', 21, 'dd907a2413a793c7b97374846c9a1e18.pdf', 'this is the first activity', 1),
(2, 19, 'activity 2', 21, '94e21cebd7fa90afb24b1582dfc6485b.pdf', 'This is the second activity', 3),
(7, 22, 'sdqsd', 21, 'e506ae98051fe92efcfd0736dadb2e29.pdf', 'qsdqsd', 1),
(8, 22, 'sqdsd', 21, '5b300b86ae190aaeabcde5b84780bfe6.pdf', 'sqdsqd', 5),
(9, 22, 'sdfsd', 21, 'a2207cc223126d70dae02ccb131d3186.pdf', 'sdfdsf', 1);

-- --------------------------------------------------------

--
-- Table structure for table `archive`
--

CREATE TABLE `archive` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `depot_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `archive`
--

INSERT INTO `archive` (`id`, `name`, `file`, `user_id`, `depot_id`) VALUES
(6, 'Archive3', 'e4cea1f3bbc03f055bb388765e08b479.pdf', 19, 1),
(8, 'archive1', 'b2d54b8725558b1151afbf7211d07e7b.pdf', 18, 1),
(10, 'qsdsqd', '81b241c5be83578ea8b6dfd040212dba.pdf', 22, 7);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(3, 'info');

-- --------------------------------------------------------

--
-- Table structure for table `cour`
--

CREATE TABLE `cour` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cour`
--

INSERT INTO `cour` (`id`, `user_id`, `category_id`, `name`, `description`, `section`, `image`) VALUES
(14, 13, 3, 'python 101', 'cours for python', 'python', '8318e5e00f9812cf42e8857b6050df2b.jpeg'),
(15, 13, 3, 'java', 'cours for java advanced', 'java', '75b99a876c280852cf3a08d13df74799.jpeg'),
(16, 13, 3, 'big data', 'this cours is for big data', 'big data', '78762ee73f265d4dd984ddb97d1f60fd.jpeg'),
(17, 14, 3, 'Angular', 'this cour for angular', 'angular', 'f4d6444df5fbe01022f1b90a61777a6f.jpeg'),
(18, 16, 3, 'angylar js', 'this cours is for angular2', 'angular', '/tmp/phpJboDEE'),
(19, 16, 3, 'angular 2', 'this cours is for angular 2', 'angular 2', '9300145d3eb89eb6018b951ccd109f9d.jpeg'),
(20, 18, 3, 'test', 'sdsqd', 'qsdqsd', 'ecce0b66e6160e2c0ec975ecd4b46e7d.jpeg'),
(21, 18, 3, 'python', 'test2', 'test2', '277a7cfa522c8ff6e4b03211d1fdd785.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `depot`
--

CREATE TABLE `depot` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `activity_id` int(11) NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `depot`
--

INSERT INTO `depot` (`id`, `user_id`, `activity_id`, `file`, `description`) VALUES
(1, 18, 2, 'sqedqsd', 'sqdqsd'),
(6, 22, 7, 'sdfgfsdg', 'dfsgsfdg'),
(7, 22, 8, 'sdfdsf', 'dsfdsf');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20201129104634', '2020-11-30 17:29:44', 198),
('DoctrineMigrations\\Version20201130154322', '2020-12-01 18:22:59', 61),
('DoctrineMigrations\\Version20201201172428', '2020-12-01 18:24:47', 151),
('DoctrineMigrations\\Version20201201204509', '2020-12-01 21:45:26', 622),
('DoctrineMigrations\\Version20201201211710', '2020-12-01 22:17:22', 92),
('DoctrineMigrations\\Version20201201212513', '2020-12-01 22:25:31', 318),
('DoctrineMigrations\\Version20201201214228', '2020-12-01 22:42:36', 142),
('DoctrineMigrations\\Version20201203164926', '2020-12-03 17:49:50', 249),
('DoctrineMigrations\\Version20201205184343', '2020-12-05 19:43:56', 347),
('DoctrineMigrations\\Version20201205201531', '2020-12-05 21:15:49', 116),
('DoctrineMigrations\\Version20201206180522', '2020-12-06 19:05:33', 361),
('DoctrineMigrations\\Version20201208193936', '2020-12-08 20:39:49', 483),
('DoctrineMigrations\\Version20201208201437', '2020-12-08 21:14:53', 111),
('DoctrineMigrations\\Version20201209110049', '2020-12-09 12:01:00', 199),
('DoctrineMigrations\\Version20201220155349', '2020-12-20 16:54:07', 203),
('DoctrineMigrations\\Version20201221091822', '2020-12-21 10:18:45', 990),
('DoctrineMigrations\\Version20201221142419', '2020-12-21 15:24:36', 149),
('DoctrineMigrations\\Version20201221142924', '2020-12-21 15:29:32', 212),
('DoctrineMigrations\\Version20201222150100', '2020-12-22 16:01:14', 373),
('DoctrineMigrations\\Version20201222205846', '2020-12-22 21:59:17', 43),
('DoctrineMigrations\\Version20201222210708', '2020-12-22 22:07:29', 275),
('DoctrineMigrations\\Version20201225200502', '2020-12-25 21:05:17', 142);

-- --------------------------------------------------------

--
-- Table structure for table `groupe`
--

CREATE TABLE `groupe` (
  `id` int(11) NOT NULL,
  `cours_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `groupe`
--

INSERT INTO `groupe` (`id`, `cours_id`, `name`, `password`) VALUES
(17, 14, 'python', 'python'),
(18, 15, 'java', 'test'),
(19, 16, 'big data', 'test'),
(20, 17, 'Angular', 'test'),
(21, 18, 'angylar js', 'angylar js'),
(22, 19, 'angular 2', 'angular 2'),
(23, 20, 'test', 'test'),
(24, 21, 'test2', 'test2');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `groupe_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`id`, `groupe_id`, `user_id`, `content`) VALUES
(1, 17, 22, 'swdqsdsqd'),
(2, 17, 22, 'dqsfqdsf'),
(3, 17, 22, 'dqsfqdsf'),
(4, 17, 22, 'safa'),
(5, 17, 22, 'dfsdfsdf'),
(6, 17, 22, 'test'),
(7, 17, 22, 'qsdsqd'),
(8, 17, 22, 'sdfqsdfqsdfqsdfqsdfqsdf'),
(9, 17, 24, 'sqdqsd'),
(10, 17, 24, 'he yser can you help me in the vedio 4 of this cours'),
(11, 17, 24, 'qsdqsdqsdqsd'),
(12, 20, 24, 'sdqfqdsfqsdf'),
(13, 24, 24, 'sdfdf');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `question_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `task_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `question_title`, `answer`, `task_id`) VALUES
(1, 'select\r\na)<br>\r\nb)<br>\r\nc)<br>\r\n', 'a', 1),
(2, 'question 2 ', 'a', 1);

-- --------------------------------------------------------

--
-- Table structure for table `question_user`
--

CREATE TABLE `question_user` (
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question_user`
--

INSERT INTO `question_user` (`question_id`, `user_id`) VALUES
(1, 18);

-- --------------------------------------------------------

--
-- Table structure for table `section`
--

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `cour_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `section`
--

INSERT INTO `section` (`id`, `cour_id`, `title`) VALUES
(1, 21, 'section 1 '),
(3, 21, 'section2'),
(4, 21, 'Section 3'),
(5, 21, 'Section4'),
(6, 21, 'section 4');

-- --------------------------------------------------------

--
-- Table structure for table `task`
--

CREATE TABLE `task` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `cour_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `task`
--

INSERT INTO `task` (`id`, `title`, `description`, `cour_id`) VALUES
(1, 'task 1', 'Now that you\'ve logged into the server, you\'re gonna wanna do things, and everything that can be done over SSH is done by running commands. To start out, we\'ll take a look at some of the basic commands, and the first command will be echo. Type echo hello, and press enter and you\'ll see your input echoed back at you.\r\n\r\n\r\n\r\n\r\n\r\nMuch like the word it\'s named after, echoreturns whatever is inputted into it. Congratulations, you\'ve just ran your first Linux command!', 21),
(3, 'task 2', 'this is python task 2', 21),
(4, 'task 3', 'task 3 description', 21);

-- --------------------------------------------------------

--
-- Table structure for table `upload`
--

CREATE TABLE `upload` (
  `id` int(11) NOT NULL,
  `cour_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file_pdf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file_vedio` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `section_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `upload`
--

INSERT INTO `upload` (`id`, `cour_id`, `user_id`, `description`, `title`, `file_pdf`, `file_vedio`, `section_id`) VALUES
(18, 21, 18, 'test', '1', NULL, NULL, 1),
(21, 21, 19, 'this is the first document', 'Document 1', '4d4af1d36af74321748ac17239201814.pdf', NULL, 1),
(22, 21, 19, 'this is the second document', 'Document 2', '1d996723178a2ac5c0b126ed2cc2ac80.pdf', NULL, 1),
(23, 21, 19, 'this is the third document', 'Document 3', 'fccccd13201544cb3fffb0e0e6d0629c.pdf', NULL, 3),
(28, 21, 22, 'sqdsqd', 'qsdsqd', NULL, 'https://www.youtube.com/embed/MjLXgAEPMkU', 1),
(30, 21, 22, 'qsdqsdqsd', 'php', NULL, 'https://www.youtube.com/embed/DVjwfOV-VAM', 5),
(31, 21, 22, 'test pdf', 'testpdf', '3430223c198adb125420b3aef7677ca8.pdf', NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `username`) VALUES
(13, 'user10@gmail.com', '[\"ROLE_TEACHER\"]', 'useruser123', 'user1'),
(14, 'user@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$sMg6BCxl63qHM7Hwj/AIcw$cU6PLNOJ7IdRHHcaNUyAm3xpn46urWoBEuXMVCh7wpQ', 'user'),
(15, 'user2', '[\"ROLE_TEACHER\"]', '$argon2id$v=19$m=65536,t=4,p=1$KiqHrPRT8omtybPIKizZHQ$tEQUDF6UGr+Oc4LwO+4i+XJCZ7nxc5rEi5/WrBGprbU', 'user2@gmail.com'),
(16, 'user3@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$dKNys6H3j9UpjSjU8VQPeg$kB+EGjunNJ6FX/teK4iqx6/ldAAAgZHut65yxWCmqN0', 'user3'),
(17, 'safa@gmail.com', '[\"ROLE_USER\"]', 'safa', 'Safa'),
(18, 'test2@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$6UMW1s+iW/lRUc6mzL5cvg$d0vzSNC6BQhV4HqYI/ZR4Qz0VGkS1dK3PRigYFpFhvY', 'test2'),
(19, 'safa123456@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$GhqKWnb8BX6HpPf12Xn3wQ$2Fr4S08yFzZZJgvHU+M7iPHDTiSsvv2VM6A9QKtm3gU', 'safa123456'),
(20, 'test3@gmail.com', '[\"ROLE_USER\"]', '$argon2id$v=19$m=65536,t=4,p=1$MOvtv4DsWfQjln4bVOWgjw$+cBxlcS5oFvCfU5JGVPr2on1sMSWFAk79RbLmKCrgp0', 'test3'),
(21, 'admin@gmail.com', '[\"ROLE_ADMIN\"]', '$argon2id$v=19$m=65536,t=4,p=1$pslSCG2N3ZpA2kM26vmoWA$Twl+LTWtDYoxdrgogYVNFgfQpLnEU2ZnPQPMUTnHS4E', 'admin'),
(22, 'teacher@gmail.com', '[\"ROLE_TEACHER\"]', '$argon2id$v=19$m=65536,t=4,p=1$8SKg48qtKbNb/OYbN7eFgw$1BtQyaPnrpUicJ8RVfLwt5Dw3pHEVBqqIeFYSy9VEwY', 'teacher'),
(24, 'student@gmail.com', '[\"ROLE_STUDENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$gbwKjp6wB03aR8rwKBf59g$Vyvc4pGUb0lhFDY44RSudyQP03l6GFgDnZSk0iGrPyo', 'student'),
(25, 'Anis@gmail.com', '[\"ROLE_STUDENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$ALNW7M7N6847j6pjN4aCHQ$6KHfFBGke9m5IaDnklbcb6WmotylnzBdRZlhzc2vlzg', 'Anis'),
(26, 'yasmine@gmail.com', '[\"ROLE_TEACHER\"]', '$argon2id$v=19$m=65536,t=4,p=1$cydRHifQFNlimlAed/ie7A$S2lPFLsDYSfbOp7viJYN/vb6DPmWxONupFMeD2fPp/Y', 'yasmine'),
(27, 'iheb@gmail.com', '[\"ROLE_STUDENT\"]', '$argon2id$v=19$m=65536,t=4,p=1$+mDhlqC8vKRjcS09OQC4UQ$fmhxZyPcYETF+MroUJFQeEfdl6ZKhLA77A1knU3uIp4', 'iheb');

-- --------------------------------------------------------

--
-- Table structure for table `user_groupe`
--

CREATE TABLE `user_groupe` (
  `user_id` int(11) NOT NULL,
  `groupe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_groupe`
--

INSERT INTO `user_groupe` (`user_id`, `groupe_id`) VALUES
(13, 17),
(13, 18),
(13, 19),
(14, 20),
(16, 17),
(16, 18),
(16, 21),
(16, 22),
(17, 17),
(18, 23),
(18, 24),
(19, 24),
(20, 24),
(22, 24),
(24, 17),
(24, 20),
(24, 24);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity`
--
ALTER TABLE `activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_AC74095AA76ED395` (`user_id`),
  ADD KEY `IDX_AC74095AB7942F03` (`cour_id`),
  ADD KEY `IDX_AC74095A577906E4` (`sections_id`);

--
-- Indexes for table `archive`
--
ALTER TABLE `archive`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D5FC5D9CA76ED395` (`user_id`),
  ADD KEY `IDX_D5FC5D9C8510D4DE` (`depot_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cour`
--
ALTER TABLE `cour`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A71F964FA76ED395` (`user_id`),
  ADD KEY `IDX_A71F964F12469DE2` (`category_id`);

--
-- Indexes for table `depot`
--
ALTER TABLE `depot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_47948BBCA76ED395` (`user_id`),
  ADD KEY `IDX_47948BBC81C06096` (`activity_id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `groupe`
--
ALTER TABLE `groupe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_4B98C217ECF78B0` (`cours_id`);

--
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B6BD307F7A45358C` (`groupe_id`),
  ADD KEY `IDX_B6BD307FA76ED395` (`user_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B6F7494E8DB60186` (`task_id`);

--
-- Indexes for table `question_user`
--
ALTER TABLE `question_user`
  ADD PRIMARY KEY (`question_id`,`user_id`),
  ADD KEY `IDX_D37D3BA61E27F6BF` (`question_id`),
  ADD KEY `IDX_D37D3BA6A76ED395` (`user_id`);

--
-- Indexes for table `section`
--
ALTER TABLE `section`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2D737AEFB7942F03` (`cour_id`);

--
-- Indexes for table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_527EDB25B7942F03` (`cour_id`);

--
-- Indexes for table `upload`
--
ALTER TABLE `upload`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_17BDE61FB7942F03` (`cour_id`),
  ADD KEY `IDX_17BDE61FA76ED395` (`user_id`),
  ADD KEY `IDX_17BDE61FD823E37A` (`section_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- Indexes for table `user_groupe`
--
ALTER TABLE `user_groupe`
  ADD PRIMARY KEY (`user_id`,`groupe_id`),
  ADD KEY `IDX_61EB971CA76ED395` (`user_id`),
  ADD KEY `IDX_61EB971C7A45358C` (`groupe_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity`
--
ALTER TABLE `activity`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `archive`
--
ALTER TABLE `archive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cour`
--
ALTER TABLE `cour`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `depot`
--
ALTER TABLE `depot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `groupe`
--
ALTER TABLE `groupe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `section`
--
ALTER TABLE `section`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `task`
--
ALTER TABLE `task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `upload`
--
ALTER TABLE `upload`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity`
--
ALTER TABLE `activity`
  ADD CONSTRAINT `FK_AC74095A577906E4` FOREIGN KEY (`sections_id`) REFERENCES `section` (`id`),
  ADD CONSTRAINT `FK_AC74095AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_AC74095AB7942F03` FOREIGN KEY (`cour_id`) REFERENCES `cour` (`id`);

--
-- Constraints for table `archive`
--
ALTER TABLE `archive`
  ADD CONSTRAINT `FK_D5FC5D9C8510D4DE` FOREIGN KEY (`depot_id`) REFERENCES `depot` (`id`),
  ADD CONSTRAINT `FK_D5FC5D9CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `cour`
--
ALTER TABLE `cour`
  ADD CONSTRAINT `FK_A71F964F12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FK_A71F964FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `depot`
--
ALTER TABLE `depot`
  ADD CONSTRAINT `FK_47948BBC81C06096` FOREIGN KEY (`activity_id`) REFERENCES `activity` (`id`),
  ADD CONSTRAINT `FK_47948BBCA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `groupe`
--
ALTER TABLE `groupe`
  ADD CONSTRAINT `FK_4B98C217ECF78B0` FOREIGN KEY (`cours_id`) REFERENCES `cour` (`id`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK_B6BD307F7A45358C` FOREIGN KEY (`groupe_id`) REFERENCES `groupe` (`id`),
  ADD CONSTRAINT `FK_B6BD307FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `FK_B6F7494E8DB60186` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`);

--
-- Constraints for table `question_user`
--
ALTER TABLE `question_user`
  ADD CONSTRAINT `FK_D37D3BA61E27F6BF` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D37D3BA6A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `section`
--
ALTER TABLE `section`
  ADD CONSTRAINT `FK_2D737AEFB7942F03` FOREIGN KEY (`cour_id`) REFERENCES `cour` (`id`);

--
-- Constraints for table `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `FK_527EDB25B7942F03` FOREIGN KEY (`cour_id`) REFERENCES `cour` (`id`);

--
-- Constraints for table `upload`
--
ALTER TABLE `upload`
  ADD CONSTRAINT `FK_17BDE61FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_17BDE61FB7942F03` FOREIGN KEY (`cour_id`) REFERENCES `cour` (`id`),
  ADD CONSTRAINT `FK_17BDE61FD823E37A` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`);

--
-- Constraints for table `user_groupe`
--
ALTER TABLE `user_groupe`
  ADD CONSTRAINT `FK_61EB971C7A45358C` FOREIGN KEY (`groupe_id`) REFERENCES `groupe` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_61EB971CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
