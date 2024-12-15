-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema 001216363
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `001216363` ;

-- -----------------------------------------------------
-- Schema 001216363
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `001216363` ;
USE `001216363` ;

-- -----------------------------------------------------
-- Table `001216363`.`school`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `001216363`.`school` ;

CREATE TABLE IF NOT EXISTS `001216363`.`school` (
  `SchoolName` VARCHAR(45) NOT NULL,
  `Address` VARCHAR(80) NOT NULL,
  `PhoneNumber` VARCHAR(14) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`SchoolName`))
ENGINE = InnoDB;

INSERT INTO school (SchoolName, Address, PhoneNumber, Email)
VALUES ('Violet College', '14 Meyer Road Vine Vale', '08 5550 5320', 'Violet.Collage@schools.sa.edu.au');

SELECT * FROM  school;

-- -----------------------------------------------------
-- Table `001216363`.`student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `001216363`.`student` ;

CREATE TABLE IF NOT EXISTS `001216363`.`student` (
  `StudentID` CHAR(8) NOT NULL,
  `FirstName` VARCHAR(35) NOT NULL,
  `MiddleNameInitials` VARCHAR(4) NOT NULL,
  `LastName` VARCHAR(35) NOT NULL,
  `PhoneNumber` VARCHAR(14) NOT NULL,
  `ResidentialAddress` VARCHAR(80) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `DateOfBirth` DATE NOT NULL,
  `DateOfEnrolmentAtSchool` DATE NOT NULL,
  `GovernmentSubsidised` ENUM('Y', 'N') NOT NULL,
  `School_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`StudentID`),
  INDEX `fk_student_information_school_information_idx` (`School_Name` ASC) VISIBLE,
  CONSTRAINT `fk_student_information_school_information`
    FOREIGN KEY (`School_Name`)
    REFERENCES `001216363`.`school` (`SchoolName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO student (StudentID, FirstName, MiddleNameInitials, LastName, PhoneNumber, ResidentialAddress, Email, DateOfBirth, DateOfEnrolmentAtSchool, GovernmentSubsidised, School_Name)
Values 
('44002233', 'John', 'E', 'Smith', '08 7010 6452', '124 Gloucester Avenue North Adeliade', 'John.Smith@schools.sa.edu.au', '2001/09/06', '2023/01/09', 'Y', 'Violet College'),
('41216363', 'Travis', 'W', 'Griggs', '08 8263 2721', '7 Peony Court Morphett Vale', 'Travis.Griggs@schools.sa.edu.au', '2001//02/27', '2023/01/09', 'Y', 'Violet College'),
('46936182', 'Jack', 'F', 'Stewart', '08 2631 2856', '35 Peterho Boulevard Surrey Downs', 'Jack.Stewart@schools.sa.edu.au',	'2000/05/12', '2023/01/09', 'N', 'Violet College'),
('48262382', 'Ethan', 'H', 'Gavalette', '08 9579 9465', '65 Sinclair Street Jericho', 'Ethan.Gavalette@schools.sa.edu.au', '2000/10/30', '2023/01/09', 'Y', 'Violet College'),
('46254825', 'Alana', 'B', 'Blight', '08 3648 6194', '30 Kaesler Road Mount Gambier', 'Alana.Blight@schools.sa.edu.au',	'2000/06/27', '2023/01/09',	'Y', 'Violet College');

SELECT * FROM student;

-- -----------------------------------------------------
-- Table `001216363`.`teacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `001216363`.`teacher` ;

CREATE TABLE IF NOT EXISTS `001216363`.`teacher` (
  `TeacherID` CHAR(8) NOT NULL,
  `FirstName` VARCHAR(35) NOT NULL,
  `MiddleNameInitials` VARCHAR(4) NOT NULL,
  `LastName` VARCHAR(35) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `PhoneNumber` VARCHAR(14) NOT NULL,
  `School_Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`TeacherID`),
  INDEX `fk_teacher_information_school_information1_idx` (`School_Name` ASC) VISIBLE,
  CONSTRAINT `fk_teacher_information_school_information1`
    FOREIGN KEY (`School_Name`)
    REFERENCES `001216363`.`school` (`SchoolName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO teacher (TeacherID, FirstName, MiddleNameInitials, LastName, Email, PhoneNumber, School_Name)
Values 
('11006677', 'Marcos', 'T', 'Bass',	'Marcos.Bass@schools.sa.edu.au', '08 6492 2735', 'Violet College'),
('17326286', 'Arline', 'O', 'Woods', 'Arline.Woods@schools.sa.edu.au', '08 6284 5293', 'Violet College'),
('16530789', 'Bettye', 'J', 'Joyce', 'Bettye.Joyce@schools.sa.edu.au', '08 7254 8291', 'Violet College'),
('14295625', 'Tracy', 'C', 'Ritter', 'Tracy.Ritter@schools.sa.edu.au', '08 1923 4294', 'Violet College'),
('18262823', 'Lacy', 'K', 'Harris', 'Lacy.Harris@schools.sa.edu.au', '08 7235 2825', 'Violet College');

SELECT * FROM teacher;
-- -----------------------------------------------------
-- Table `001216363`.`subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `001216363`.`subject` ;

CREATE TABLE IF NOT EXISTS `001216363`.`subject` (
  `SubjectName` VARCHAR(10) NOT NULL,
  `SubjectDescription` VARCHAR(150) NOT NULL,
  `CostOfSubject` DECIMAL(6,2) NOT NULL,
  `DurationInHours` INT NOT NULL,
  `NumberOfAssessmentItems` INT NOT NULL,
  `Subject_CoordinatorID` CHAR(8) NOT NULL,
  PRIMARY KEY (`SubjectName`),
  INDEX `fk_subject_information_teacher_information1_idx` (`Subject_CoordinatorID` ASC) VISIBLE,
  CONSTRAINT `fk_subject_information_teacher_information1`
    FOREIGN KEY (`Subject_CoordinatorID`)
    REFERENCES `001216363`.`teacher` (`TeacherID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO subject (SubjectName, SubjectDescription, CostOfSubject, DurationInHours, NumberOfAssessmentItems, Subject_CoordinatorID)
Values 
('MATH1101', 'Introduction to algebra and calculus', '200', '60', '4',	'11006677'),
('ENGL1101', 'Classic and contemporary literature','180', '40', '3', '16530789'),
('BIOL1002', 'Study of living organisms', '250', '60',	'5', '14295625'),
('HIST1108', 'World history from ancient to modern', '220', '40', '2', '17326286');

SELECT * FROM subject;

-- -----------------------------------------------------
-- Table `001216363`.`enrolment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `001216363`.`enrolment` ;

CREATE TABLE IF NOT EXISTS `001216363`.`enrolment` (
  `Subject_Name` VARCHAR(10) NOT NULL,
  `StudentID` CHAR(8) NOT NULL,
  `DateOfEnrolment` DATE NULL,
  `DateOfResult` DATE NULL,
  `GradeAchived` ENUM('P', 'C', 'D', 'F') NULL,
  `NumericResult` INT NULL,
  PRIMARY KEY (`Subject_Name`, `StudentID`),
  INDEX `fk_subject_information_has_student_information_student_info_idx` (`StudentID` ASC) VISIBLE,
  INDEX `fk_subject_information_has_student_information_subject_info_idx` (`Subject_Name` ASC) VISIBLE,
  CONSTRAINT `fk_subject_information_has_student_information_subject_inform1`
    FOREIGN KEY (`Subject_Name`)
    REFERENCES `001216363`.`subject` (`SubjectName`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_subject_information_has_student_information_student_inform1`
    FOREIGN KEY (`StudentID`)
    REFERENCES `001216363`.`student` (`StudentID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

INSERT INTO enrolment (Subject_Name, StudentID, DateOfEnrolment, DateOfResult, GradeAchived, NumericResult)
Values
('MATH1101', '44002233', '2023/01/09', '2023/07/12', 'C', '72'),
('MATH1101', '41216363', '2023/01/09', '2023/07/12', 'D', '100'),
('MATH1101','48262382', '2023/01/09', '2023/07/12', 'P', '58'),
('MATH1101', '46254825', '2023/01/09', '2023/07/12', 'C', '67'),
('ENGL1101', '44002233', '2023/01/09', '2023/07/05', 'D', '88'),
('ENGL1101', '41216363', '2023/01/09', '2023/07/05', 'D', '95'),
('ENGL1101', '46936182', '2023/01/09', '2023/07/05', 'C', '74'),
('ENGL1101', '48262382', '2023/01/09', '2023/07/05', 'P', '61'),
('BIOL1002', '41216363', '2023/01/09', '2023/07/09', 'D', '96'),
('BIOL1002', '46936182', '2023/01/09', '2023/07/09', 'P', '52'),
('BIOL1002', '48262382', '2023/01/09', '2023/07/09', 'P', '56'),
('BIOL1002', '46254825', '2023/01/09', '2023/07/09', 'C', '79'),
('HIST1108', '44002233', '2023/01/09', '2023/07/14', 'D', '84'),
('HIST1108', '41216363', '2023/01/09', '2023/07/14', 'D', '93'),
('HIST1108', '46936182', '2023/01/09', '2023/07/14', 'C', '71'),
('HIST1108', '46254825', '2023/01/09', '2023/07/14', 'P', '50');

SELECT * From enrolment;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Queries & Testing
-- -----------------------------------------------------

-- -----------------------------------------------------
-- TEST 1 Name & Phone
-- -----------------------------------------------------
SELECT CONCAT(FirstName, ' ', LastName) AS 'FullName', PhoneNumber FROM student;

-- -----------------------------------------------------
-- TEST 2 Aggregate Functions
-- -----------------------------------------------------

-- Expected Count 5
SELECT COUNT(StudentID) AS 'Students' FROM student;

-- Expected Counts BIOL:4, ENGL:4, HIST:4, MATH:4
SELECT Subject_Name, COUNT(StudentID) AS 'EnrolledStudents' FROM enrolment GROUP BY Subject_Name;

-- Expected Max Results BIOL:96, ENGL:95, HIST:93, MATH:100
SELECT Subject_Name, MAX(NumericResult) AS 'HighestGrade' FROM enrolment GROUP BY Subject_Name;

-- Expected Min Results BIOL:52, ENGL:61, HIST:50, MATH:58
SELECT Subject_Name, MIN(NumericResult) AS 'LowestGrade' FROM enrolment GROUP BY Subject_Name;

-- -----------------------------------------------------
-- Joining Tables
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Test 3 Results of a Student
-- -----------------------------------------------------
-- This query retrieves a student's full name (by concatenation) along with the results, description, and class code of each subject. 
-- It matches the StudentID between the student and enrollment tables, and the subject name between the subject and enrollment tables, to extract each student's numeric result and grade.
SELECT 
	CONCAT(FirstName, ' ', LastName) AS 'FullName',
    SubjectName,
	SubjectDescription,
    GradeAchived,
    NumericResult
From student, subject, enrolment
Where subject.SubjectName=enrolment.Subject_Name AND student.StudentID=enrolment.StudentID AND student.StudentID='41216363';
-- Note: to alter the above query for another student one must change the student ID provided at the end of the code for student.StudentID= ' ' 
-- to the student they wish to find the results for. 

-- -----------------------------------------------------
-- TEST 4 Grades In A Subject
-- -----------------------------------------------------
-- The enrolment.Subject_Name command allows the user to select the subject of interest using its subject code
SELECT 
	Subject_Name,
    CONCAT(FirstName, ' ', LastName) AS 'FullName',    
	GradeAchived,
    NumericResult
From student, enrolment
Where student.StudentID=enrolment.StudentID AND enrolment.Subject_Name='HIST1108';
-- Note: to alter the above query for another subject one must change the subject name provided at the end of the code 
-- (enrolment.Subject_Name= ' ') to the subject they wish to find the student's results for. 

-- -----------------------------------------------------
-- Alter Tables and Update
-- -----------------------------------------------------

-- -----------------------------------------------------
-- TEST 5 Alter the Table Strcuture
-- -----------------------------------------------------

ALTER TABLE student
Add `HomeLanguage` varchar(30) NOT NULL;

UPDATE student
SET HomeLanguage = 'English'
WHERE StudentID IN ('44002233','41216363','48262382','46254825','46936182');

SELECT * FROM student;

-- -----------------------------------------------------
-- TEST 6 Change A Subject Coordinator
-- -----------------------------------------------------

SELECT * FROM subject;

-- Original subject co-ordinator for MATH1101: Marcas Bass id:11006677 
UPDATE subject
SET Subject_CoordinatorID='18262823'
Where SubjectName='MATH1101';

-- New subject co-ordinator for MATH1101: Lacy Harris  id:18262823
SELECT * FROM subject;

-- -----------------------------------------------------
-- TEST 7 Delete a teacher
-- -----------------------------------------------------

SELECT * FROM teacher;

-- Delated teahcer is Marcas Bass id:11006677 
DELETE FROM teacher Where TeacherID='11006677';

SELECT * FROM teacher;