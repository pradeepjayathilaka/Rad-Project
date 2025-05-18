-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 11, 2024 at 10:49 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my-quiz-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `question_text` varchar(255) NOT NULL,
  `option1` varchar(255) NOT NULL,
  `option2` varchar(255) NOT NULL,
  `option3` varchar(255) NOT NULL,
  `option4` varchar(255) NOT NULL,
  `correct_answer` varchar(255) NOT NULL,
  `subject_id` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `question_text`, `option1`, `option2`, `option3`, `option4`, `correct_answer`, `subject_id`) VALUES
(13, 'Which of the following is considered a current asset?', 'Land', 'Building', 'Accounts Receivable', 'Equipment', 'Accounts Receivable', 3),
(14, 'What does the balance sheet show?', 'Revenue and expenses ', 'Financial position at a specific date', 'Cash inflows and outflows', 'Owner\'s equity for a period', 'Financial position at a specific date', 3),
(15, 'Which of the following is an example of a liability?', 'Cash', 'Inventory', 'Accounts Payable', 'Retained Earnings', 'Accounts Payable', 3),
(16, 'What type of account is âRetained Earningsâ?', 'Asset', 'Liability', 'Equity', 'Expense', 'Equity', 3),
(17, 'The formula for calculating net income is:', 'Revenue - Expenses', 'Assets - Liabilities', 'Revenue + Liabilities', 'Assets + Owner\'s Equity', 'Revenue - Expenses', 3),
(18, 'Which financial statement provides information about a companyâs cash receipts and cash payments?', 'Balance Sheet', 'Income Statement', 'Statement of Cash Flows', 'Statement of Retained Earnings', 'Statement of Cash Flows', 3),
(19, 'Depreciation is an example of which type of expense?', 'Operating Expense', 'Capital Expense', 'Interest Expense', 'Non-operating Expense', 'Operating Expense', 3),
(20, 'Which accounting principle requires that expenses be recorded in the period in which they are incurred to generate revenue?', 'Matching Principle', 'Revenue Recognition Principle', 'Consistency Principle', 'Full Disclosure Principle', 'Matching Principle', 3),
(21, 'Which of the following is considered a long-term liability?', 'Accounts Payable', 'Short-term Loan', 'Mortgage Payable', 'Prepaid Expenses', 'Mortgage Payable', 3),
(22, 'What is the purpose of a trial balance?', 'To show all transactions for a period', 'To summarize revenues and expenses', 'To ensure that debits equal credits', 'To calculate net income', 'To ensure that debits equal credits', 3),
(23, 'What is the chemical symbol for gold?', 'Au', 'Ag', 'Pb', 'Fe', 'Au', 2),
(24, 'Which planet is known as the Red Planet?', 'Venus', 'Mars', 'Jupiter', 'Saturn', 'Mars', 2),
(25, 'What is the powerhouse of the cell?', 'Nucleus', 'Ribosome', 'Mitochondria', 'Endoplasmic Reticulum', 'Mitochondria', 2),
(26, 'Who developed the theory of relativity?', 'Isaac Newton', 'Albert Einstein', 'Galileo Galilei', 'Nikola Tesla', 'Albert Einstein', 2),
(27, 'What is the boiling point of water at sea level?', '90Â°C', '95Â°C', '100Â°C', '105Â°C', '100Â°C', 2),
(28, 'Which gas do plants primarily use for photosynthesis?', 'Oxygen', 'Nitrogen', 'Carbon Dioxide', 'Hydrogen', 'Carbon Dioxide', 2),
(29, 'What is the largest organ in the human body?', 'Heart', 'Liver', 'Skin', 'Lung', 'Skin', 2),
(30, 'What force keeps planets in orbit around the Sun?', 'Electromagnetic Force', ' Gravitational Force', 'Nuclear Force', 'Frictional Force', 'Gravitational Force', 2),
(31, 'Which element is represented by the symbol \'O\'?', 'Osmium', 'Oxygen', 'Gold', 'Oganesson', 'Oxygen', 2),
(32, 'What is the primary source of energy for Earthâs climate system?', 'The Moon', 'Volcanoes', 'Solar Radiation', 'Geothermal Heat', 'Solar Radiation', 2),
(34, 'Who was the first President of the United States?', 'Thomas Jefferson', 'George Washington', 'John Adams', 'James Madison', 'George Washington', 4),
(35, 'Which ancient civilization built the pyramids of Giza?', 'Maya', 'Inca', 'Egyptians', 'Greeks', 'Egyptians', 4),
(37, 'What year did World War I begin?', '1912', '1914', '1916', '1918', '1914', 4),
(38, 'Who wrote the Declaration of Independence?', 'Benjamin Franklin', 'Thomas Jefferson', 'John Adams', 'James Madison', 'Thomas Jefferson', 4),
(39, 'What was the main cause of the fall of the Roman Empire?', 'Invasion by Germanic tribes', 'Economic prosperity', 'Invention of the printing press', 'Discovery of America', 'Invasion by Germanic tribes', 4),
(40, 'Who was the leader of the Soviet Union during World War II?', 'Vladimir Lenin', ' Joseph Stalin', 'Nikita Khrushchev', 'Leon Trotsky', 'Joseph Stalin', 4),
(41, 'What was the significance of the Magna Carta?', 'Ended the Black Death', 'Established the principle of rule of law', 'Initiated the Renaissance', 'Began the American Revolution', 'Established the principle of rule of law', 4),
(42, 'Which event marked the beginning of the French Revolution?', 'The signing of the Treaty of Versailles', 'The storming of the Bastille', 'The execution of Louis XVI', 'The publication of the Communist Manifesto', 'The storming of the Bastille', 4),
(43, 'What was the primary purpose of the Silk Road?', 'Trade between Europe and Asia', 'Military conquests', 'Exploration of the Americas', 'Spread of Christianity', 'Trade between Europe and Asia', 4),
(44, 'Which country was the first to grant women the right to vote?', 'United States', 'Canada', 'New Zealand', 'United Kingdom', 'New Zealand', 4);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `duration` int(11) NOT NULL DEFAULT 30,
  `teacher_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `name`, `description`, `duration`, `teacher_id`) VALUES
(2, 'Science', 'jkgfkj', 10, 0),
(3, 'accounting', 'accounting for quizes', 10, 0),
(4, 'History', 'History -mcq', 10, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(32) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `role` varchar(10) NOT NULL DEFAULT 'user',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `email`, `password`, `phone`, `role`, `created_at`) VALUES
(10, 'admin', 'admin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '07584201265', 'admin', '0000-00-00 00:00:00'),
(25, 'amilka hasindu', 'amilkahasindu@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0577897653', 'teacher', '2024-08-11 07:19:03'),
(26, 'ashen nethsara', 'ashennethsara12@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0778675976', 'teacher', '2024-08-11 07:19:53'),
(27, 'Isuru lakshan', 'Isurulakshan56@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0558976567', 'teacher', '2024-08-11 07:20:39'),
(28, 'imashi nayanethri', 'pradeepjayathilaka12@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0763143656', 'teacher', '2024-08-11 07:21:50'),
(29, 'mashi siriwardhana', 'Mashisiriwardhana1@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0766156848', 'teacher', '2024-08-11 07:22:32'),
(30, 'nipun  sanjaya', 'nipun04@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0789657812', 'user', '2024-08-11 07:25:11'),
(31, 'kasun  kalhara', 'kasunkalhara5@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0764379780', 'user', '2024-08-11 07:26:06'),
(32, 'ayesha  dulanjalee', 'ayeshadulanjalee@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0785674578', 'user', '2024-08-11 07:27:18'),
(33, 'sahan rathnayaka', 'sahanrathnayaka03@gmail.com', '4739c5c11d833bb199c16ff95a92b267', '0785678945', 'user', '2024-08-11 07:28:26'),
(34, 'pavan  rathnayaka', 'pradeepjayathilaka12a@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '0765879650', 'user', '2024-08-11 07:30:25'),
(35, 'kavinda madushan', 'kavinda@gmail.com', '01cfcd4f6b8770febfb40cb906715822', '0784678956', 'user', '2024-08-11 07:31:27'),
(36, 'imasha sewwandi', 'imasha06@gmail.com', '01cfcd4f6b8770febfb40cb906715822', '0778790789', 'user', '2024-08-11 07:32:54'),
(37, 'dimiththri  sankalpana', 'dimiththri03@gmail.com', '099ebea48ea9666a7da2177267983138', '07856745456', 'user', '2024-08-11 07:34:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
