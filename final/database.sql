-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: employee_training
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course_details`
--

DROP TABLE IF EXISTS `course_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_details` (
  `Department` text,
  `Designation` text,
  `Course1` text,
  `Course2` text,
  `Course3` text,
  `Course4` text,
  `Course5` text,
  `Course6` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_details`
--

LOCK TABLES `course_details` WRITE;
/*!40000 ALTER TABLE `course_details` DISABLE KEYS */;
INSERT INTO `course_details` VALUES ('Development','Full Stack Developer Analyst','HTML Basics','CSS3','JavaScript ES6','ReactJS','Python Basics','SQL Fundamentals'),('Development','Full Stack Developer Associate','Advanced React','NodeJS','MongoDB','REST APIs','Docker','Git & CI/CD'),('Development','Full Stack Developer Senior Associate','System Design','Kubernetes','GraphQL','AWS Fundamentals','Microservices','CI/CD Pipelines'),('Testing','QA Analyst','Manual Testing','JIRA Basics','Postman API Testing','SQL Basics','Selenium Basics','Agile Fundamentals'),('Testing','QA Associate','Automation Testing','Selenium Advanced','Cucumber','API Automation','Performance Testing','Git'),('Testing','QA Lead','Test Strategy','Agile Leadership','JMeter','CI/CD Testing','Cloud Testing','Security Testing'),('DevOps','DevOps Engineer','Linux Basics','Docker','Kubernetes','AWS EC2','Terraform','CI/CD Jenkins'),('DevOps','DevOps Associate','Bash Scripting','Ansible','AWS S3','Kubernetes Basics','Docker Compose','Monitoring Tools'),('DevOps','DevOps Specialist','Cloud Architecture','Advanced Kubernetes','CI/CD Advanced','Security Hardening','Load Balancing','Prometheus'),('Support','IT Support Associate','ITIL Basics','Ticketing Systems','Networking Fundamentals','Windows Admin','Linux Basics','Customer Handling'),('Support','IT Support Analyst','Incident Management','Cloud Basics','SQL Basics','Automation Scripts','Active Directory','IT Security'),('Support','IT Support Specialist','Advanced Networking','Firewall Management','Cloud Infrastructure','Disaster Recovery','Scripting Advanced','Monitoring Tools');
/*!40000 ALTER TABLE `course_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credentials`
--

DROP TABLE IF EXISTS `credentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credentials` (
  `Emp_Code` text,
  `Password` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credentials`
--

LOCK TABLES `credentials` WRITE;
/*!40000 ALTER TABLE `credentials` DISABLE KEYS */;
INSERT INTO `credentials` VALUES ('01','0101'),('02','0202'),('03','0303'),('04','0404'),('05','0505'),('06','0606'),('07','0707'),('08','0808'),('09','0909'),('10','1010'),('11','1111'),('12','1212'),('13','1313'),('14','1414'),('15','1515'),('16','1616'),('17','1717'),('18','1818'),('19','1919'),('20','2020'),('21','2121'),('22','2222'),('23','2323'),('24','2424'),('25','2525'),('26','2626'),('27','2727'),('28','2828'),('29','2929'),('30','3030'),('31','3131'),('32','3232'),('33','3333'),('34','3434'),('35','3535'),('36','3636'),('37','3737'),('38','3838'),('39','3939'),('40','4040'),('41','4141'),('42','4242'),('43','4343'),('44','4444'),('45','4545'),('46','4646'),('47','4747'),('48','4848'),('admin','admin');
/*!40000 ALTER TABLE `credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_details`
--

DROP TABLE IF EXISTS `employee_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_details` (
  `Emp_Code` text,
  `Emp_Name` text,
  `Department` text,
  `Designation` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_details`
--

LOCK TABLES `employee_details` WRITE;
/*!40000 ALTER TABLE `employee_details` DISABLE KEYS */;
INSERT INTO `employee_details` VALUES ('01','Ritik Sharma','Development','Full Stack Developer Analyst'),('02','Yash Pillai','Development','Full Stack Developer Analyst'),('03','Kavya Iyer','Development','Full Stack Developer Analyst'),('04','Ananya Khan','Development','Full Stack Developer Analyst'),('05','Priya Gupta','Development','Full Stack Developer Associate'),('06','Manav Reddy','Development','Full Stack Developer Analyst'),('07','Ishan Patel','Development','Full Stack Developer Associate'),('08','Sneha Khan','Development','Full Stack Developer Analyst'),('09','Arjun Mehta','Development','Full Stack Developer Senior Associate'),('10','Priya Nair','Development','Full Stack Developer Analyst'),('11','Ananya Mehta','Development','Full Stack Developer Senior Associate'),('12','Aniket Patel','Development','Full Stack Developer Senior Associate'),('13','Ritik Khan','Testing','QA Analyst'),('14','Dev Patel','Testing','QA Associate'),('15','Neha Mehta','Testing','QA Associate'),('16','Tanvi Gupta','Testing','QA Analyst'),('17','Neha Patel','Testing','QA Lead'),('18','Aditi Sharma','Testing','QA Analyst'),('19','Meera Khan','Testing','QA Associate'),('20','Akash Pillai','Testing','QA Associate'),('21','Kavya Pillai','Testing','QA Lead'),('22','Raj Pillai','Testing','QA Lead'),('23','Riya Gupta','Testing','QA Associate'),('24','Arjun Patel','Testing','QA Lead'),('25','Sakshi Sharma','DevOps','DevOps Engineer'),('26','Riya Patel','DevOps','DevOps Specialist'),('27','Aditi Khan','DevOps','DevOps Associate'),('28','Ishan Khan','DevOps','DevOps Specialist'),('29','Ishan Gupta','DevOps','DevOps Associate'),('30','Ritik Mehta','DevOps','DevOps Specialist'),('31','Aniket Das','DevOps','DevOps Associate'),('32','Sneha Pillai','DevOps','DevOps Associate'),('33','Rohan Sharma','DevOps','DevOps Engineer'),('34','Aarohi Sharma','DevOps','DevOps Specialist'),('35','Tanvi Reddy','DevOps','DevOps Engineer'),('36','Priya Das','DevOps','DevOps Engineer'),('37','Rohan Sharma','Support','IT Support Specialist'),('38','Aditi Mehta','Support','IT Support Specialist'),('39','Priya Das','Support','IT Support Analyst'),('40','Raj Nair','Support','IT Support Specialist'),('41','Simran Gupta','Support','IT Support Associate'),('42','Sneha Khan','Support','IT Support Analyst'),('43','Rekha Mehta','Support','IT Support Associate'),('44','Aniket Sharma','Support','IT Support Specialist'),('45','Kavya Sharma','Support','IT Support Analyst'),('46','Vihaan Sharma','Support','IT Support Associate'),('47','Sanya Khan','Support','IT Support Associate'),('48','Vihaan Pillai','Support','IT Support Specialist');
/*!40000 ALTER TABLE `employee_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee_training_datasets`
--

DROP TABLE IF EXISTS `employee_training_datasets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_training_datasets` (
  `Emp_Code` text,
  `Emp_Name` text,
  `Department` text,
  `Designation` text,
  `Course1` text,
  `Course2` text,
  `Course3` text,
  `Course4` text,
  `Course5` text,
  `Course6` text,
  `Calibrated_for_Designation` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_training_datasets`
--

LOCK TABLES `employee_training_datasets` WRITE;
/*!40000 ALTER TABLE `employee_training_datasets` DISABLE KEYS */;
INSERT INTO `employee_training_datasets` VALUES ('01','Ritik Sharma','Development','Full Stack Developer Analyst','[Not Started]','[First Attempt (80) Completed]','[First Attempt (80) Completed]','[First Attempt (80) Completed]','[First Attempt (80) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','80.0%'),('02','Yash Pillai','Development','Full Stack Developer Analyst','[Not Started]','[First Attempt (80) Completed]','[Not Started]','[Not Started]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (80) Completed]','46.67%'),('03','Kavya Iyer','Development','Full Stack Developer Analyst','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (80) Completed]','[Not Started]','[Not Started]','[Not Started]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','43.33%'),('04','Ananya Khan','Development','Full Stack Developer Analyst','[First Attempt (80) Completed]','[In Progress - Assessment Not Yet Taken]','[Not Started]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[Not Started]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','51.67%'),('05','Priya Gupta','Development','Full Stack Developer Associate','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[In Progress - Assessment Not Yet Taken]','[First Attempt (80) Completed]','[First Attempt (80) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (80) Completed]','85.0%'),('06','Manav Reddy','Development','Full Stack Developer Analyst','[In Progress - Assessment Not Yet Taken]','[First Attempt (80) Completed]','[In Progress - Assessment Not Yet Taken]','[First Attempt (80) Completed]','[First Attempt (80) Completed]','[In Progress - Assessment Not Yet Taken]','75.0%'),('07','Ishan Patel','Development','Full Stack Developer Associate','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (80) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[Not Started]','70.0%'),('08','Sneha Khan','Development','Full Stack Developer Analyst','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[In Progress - Assessment Not Yet Taken]','[First Attempt (80) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','78.33%'),('09','Arjun Mehta','Development','Full Stack Developer Senior Associate','[In Progress - Assessment Not Yet Taken]','[Not Started]','[First Attempt (80) Completed]','[In Progress - Assessment Not Yet Taken]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','60.0%'),('10','Priya Nair','Development','Full Stack Developer Analyst','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[Not Started]','[Not Started]','[First Attempt (80) Completed]','[Not Started]','[In Progress - Assessment Not Yet Taken]','38.33%'),('11','Ananya Mehta','Development','Full Stack Developer Senior Associate','[First Attempt (80) Completed]','[Not Started]','[First Attempt (80) Completed]','[Not Started]','[In Progress - Assessment Not Yet Taken]','[Not Started]','41.67%'),('12','Aniket Patel','Development','Full Stack Developer Senior Associate','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (80) Completed]','[Not Started]','[Not Started]','[In Progress - Assessment Not Yet Taken]','[First Attempt (80) Completed]','55.0%'),('13','Ritik Khan','Testing','QA Analyst','[Not Started]','[Not Started]','[Not Started]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (80) Completed]','[Not Started]','30.0%'),('14','Dev Patel','Testing','QA Associate','[Not Started]','[In Progress - Assessment Not Yet Taken]','[In Progress - Assessment Not Yet Taken]','[Not Started]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[In Progress - Assessment Not Yet Taken]','38.33%'),('15','Neha Mehta','Testing','QA Associate','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (80) Completed]','[Not Started]','[Not Started]','[Not Started]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','43.33%'),('16','Tanvi Gupta','Testing','QA Analyst','[completed]','[completed]','[completed]','[completed]','[completed]','[completed]','100%'),('17','Neha Patel','Testing','QA Lead','[Not Started]','[In Progress - Assessment Not Yet Taken]','[In Progress - Assessment Not Yet Taken]','[In Progress - Assessment Not Yet Taken]','[In Progress - Assessment Not Yet Taken]','[In Progress - Assessment Not Yet Taken]','41.67%'),('18','Aditi Sharma','Testing','QA Analyst','[In Progress - Assessment Not Yet Taken]','[First Attempt (80) Completed]','[Not Started]','[First Attempt (80) Completed]','[First Attempt (80) Completed]','[First Attempt (80) Completed]','75.0%'),('19','Meera Khan','Testing','QA Associate','[First Attempt (80) Completed]','[First Attempt (80) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[In Progress - Assessment Not Yet Taken]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[In Progress - Assessment Not Yet Taken]','76.67%'),('20','Akash Pillai','Testing','QA Associate','[In Progress - Assessment Not Yet Taken]','[First Attempt (80) Completed]','[Not Started]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[Not Started]','[In Progress - Assessment Not Yet Taken]','46.67%'),('21','Kavya Pillai','Testing','QA Lead','[In Progress - Assessment Not Yet Taken]','[Not Started]','[First Attempt (80) Completed]','[Not Started]','[Not Started]','[In Progress - Assessment Not Yet Taken]','33.33%'),('22','Raj Pillai','Testing','QA Lead','[In Progress - Assessment Not Yet Taken]','[Not Started]','[In Progress - Assessment Not Yet Taken]','[First Attempt (80) Completed]','[First Attempt (80) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','63.33%'),('23','Riya Gupta','Testing','QA Associate','[In Progress - Assessment Not Yet Taken]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[In Progress - Assessment Not Yet Taken]','[Not Started]','[In Progress - Assessment Not Yet Taken]','[Not Started]','38.33%'),('24','Arjun Patel','Testing','QA Lead','[First Attempt (80) Completed]','[First Attempt (80) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (80) Completed]','[In Progress - Assessment Not Yet Taken]','[In Progress - Assessment Not Yet Taken]','80.0%'),('25','Sakshi Sharma','DevOps','DevOps Engineer','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (80) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[In Progress - Assessment Not Yet Taken]','[In Progress - Assessment Not Yet Taken]','[Not Started]','60.0%'),('26','Riya Patel','DevOps','DevOps Specialist','[First Attempt (80) Completed]','[First Attempt (80) Completed]','[In Progress - Assessment Not Yet Taken]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (80) Completed]','[In Progress - Assessment Not Yet Taken]','80.0%'),('27','Aditi Khan','DevOps','DevOps Associate','[Not Started]','[First Attempt (80) Completed]','[Not Started]','[First Attempt (80) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','60.0%'),('28','Ishan Khan','DevOps','DevOps Specialist','[In Progress - Assessment Not Yet Taken]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[Not Started]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[In Progress - Assessment Not Yet Taken]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','56.67%'),('29','Ishan Gupta','DevOps','DevOps Associate','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[In Progress - Assessment Not Yet Taken]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[Not Started]','[Not Started]','48.33%'),('30','Ritik Mehta','DevOps','DevOps Specialist','[Not Started]','[In Progress - Assessment Not Yet Taken]','[In Progress - Assessment Not Yet Taken]','[In Progress - Assessment Not Yet Taken]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[In Progress - Assessment Not Yet Taken]','46.67%'),('31','Aniket Das','DevOps','DevOps Associate','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[Not Started]','[Not Started]','[First Attempt (80) Completed]','56.67%'),('32','Sneha Pillai','DevOps','DevOps Associate','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (80) Completed]','[First Attempt (80) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','86.67%'),('33','Rohan Sharma','DevOps','DevOps Engineer','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[Not Started]','[Not Started]','[Not Started]','[In Progress - Assessment Not Yet Taken]','35.0%'),('34','Aarohi Sharma','DevOps','DevOps Specialist','[Not Started]','[First Attempt (80) Completed]','[In Progress - Assessment Not Yet Taken]','[First Attempt (80) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[In Progress - Assessment Not Yet Taken]','63.33%'),('35','Tanvi Reddy','DevOps','DevOps Engineer','[Not Started]','[In Progress - Assessment Not Yet Taken]','[In Progress - Assessment Not Yet Taken]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[Not Started]','[First Attempt (80) Completed]','46.67%'),('36','Priya Das','DevOps','DevOps Engineer','[In Progress - Assessment Not Yet Taken]','[First Attempt (80) Completed]','[In Progress - Assessment Not Yet Taken]','[In Progress - Assessment Not Yet Taken]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','68.33%'),('37','Rohan Sharma','Support','IT Support Specialist','[In Progress - Assessment Not Yet Taken]','[In Progress - Assessment Not Yet Taken]','[First Attempt (80) Completed]','[First Attempt (80) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[In Progress - Assessment Not Yet Taken]','71.67%'),('38','Aditi Mehta','Support','IT Support Specialist','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (80) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[Not Started]','[Not Started]','[Not Started]','43.33%'),('39','Priya Das','Support','IT Support Analyst','[First Attempt (80) Completed]','[Not Started]','[In Progress - Assessment Not Yet Taken]','[In Progress - Assessment Not Yet Taken]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[Not Started]','46.67%'),('40','Raj Nair','Support','IT Support Specialist','[First Attempt (80) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (80) Completed]','[In Progress - Assessment Not Yet Taken]','[In Progress - Assessment Not Yet Taken]','[In Progress - Assessment Not Yet Taken]','71.67%'),('41','Simran Gupta','Support','IT Support Associate','[In Progress - Assessment Not Yet Taken]','[In Progress - Assessment Not Yet Taken]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (80) Completed]','[In Progress - Assessment Not Yet Taken]','[Not Started]','55.0%'),('42','Sneha Khan','Support','IT Support Analyst','[First Attempt (80) Completed]','[In Progress - Assessment Not Yet Taken]','[Not Started]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[In Progress - Assessment Not Yet Taken]','60.0%'),('43','Rekha Mehta','Support','IT Support Associate','[In Progress - Assessment Not Yet Taken]','[Not Started]','[Not Started]','[Not Started]','[Not Started]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','21.67%'),('44','Aniket Sharma','Support','IT Support Specialist','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[Not Started]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[First Attempt (80) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[Not Started]','56.67%'),('45','Kavya Sharma','Support','IT Support Analyst','[In Progress - Assessment Not Yet Taken]','[In Progress - Assessment Not Yet Taken]','[In Progress - Assessment Not Yet Taken]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[Not Started]','[In Progress - Assessment Not Yet Taken]','46.67%'),('46','Vihaan Sharma','Support','IT Support Associate','[First Attempt (80) Completed]','[First Attempt (80) Completed]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[Not Started]','[Not Started]','[First Attempt (80) Completed]','63.33%'),('47','Sanya Khan','Support','IT Support Associate','[In Progress - Assessment Not Yet Taken]','[Not Started]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[Not Started]','[First Attempt (80) Completed]','[First Attempt (80) Completed]','55.0%'),('48','Vihaan Pillai','Support','IT Support Specialist','[Not Started]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[Not Started]','[In Progress - Assessment Not Yet Taken]','[First Attempt (60) Failed] [Second Attempt (83) Completed]','[Not Started]','35.0%');
/*!40000 ALTER TABLE `employee_training_datasets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-29 12:54:14
