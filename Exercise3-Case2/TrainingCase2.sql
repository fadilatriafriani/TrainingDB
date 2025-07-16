-- 1. Employee
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(50) NOT NULL,
    EmployeePosition VARCHAR(30)
);

-- 2. Instructor (Instruktur adalah karyawan, 1 karyawan hanya bisa jadi 1 instruktur)
CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeID INT NOT NULL UNIQUE,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- 3. TrainingCourse
CREATE TABLE TrainingCourse (
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    Title VARCHAR(50) NOT NULL,
    Description TEXT,
    DurationHours INT NOT NULL
);

-- 4. TrainingSession (dipimpin oleh 1 instruktur dan berkaitan dengan 1 kursus)
CREATE TABLE TrainingSession (
    SessionID INT PRIMARY KEY IDENTITY(1,1),
    CourseID INT NOT NULL,
    InstructorID INT NOT NULL,
    SessionDate DATE NOT NULL,
    FOREIGN KEY (CourseID) REFERENCES TrainingCourse(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor(InstructorID)
);

-- 5. ParticipationRecord (junction table: Employee ⇄ TrainingSession)
CREATE TABLE ParticipationRecord (
    RecordID INT PRIMARY KEY IDENTITY(1,1),
    SessionID INT NOT NULL,
    EmployeeID INT NOT NULL,
    AttendanceDate DATE NOT NULL,
    Passed BIT NOT NULL,
    FOREIGN KEY (SessionID) REFERENCES TrainingSession(SessionID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
