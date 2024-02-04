course('Semester3-2', 'Mathematics', 'Dr. Sabbir Alam', 'MATH101').
course('Semester3-2', 'Physics', 'Dr. Golam Moazzam', 'PHYS101').
course('Semester3-2', 'C programming', 'Dr. Liton Jude Rozario', 'CSE351').
course('Semester3-2', 'Graphics', 'Dr. Morium Akter', 'CSE352').
course('Semester3-2', 'DIP', 'Dr. Mohammad Shorif Uddin', 'CSE354').

course('Semester4-1', 'Wireless Network', 'Dr. Imdadul Islam', 'CSE401').
course('Semester4-1', 'TOC', 'Amena khatun', 'CSE403').
course('Semester4-1', 'Software', 'Dr. Humayun Kabir', 'CSE405').
course('Semester4-1', 'Computer Architechture', 'Ms. Sabrina Sharmin', 'CSE406').

course('Semester4-2', 'Networking', 'Dr. Imdadul Islam', 'CSE451').
course('Semester4-2', 'Data Mining', 'Dr. Humayun Kabir', 'CSE453').
course('Semester4-2', 'AI', 'Dr. Morium Akter', 'CSE454').
course('Semester4-2', 'ML', 'Ms. Sarnali Basak', 'CSE456').

student('Sumaita', 'Semester3-2').
student('Sumaita', 'Semester4-1').
student('Sanzida', 'Semester3-2').
student('Sanzida', 'Semester3-2').
student('Ella', 'Semester4-2').
student('Ella', 'Semester4-2').

% Queries
% Find courses taken by a specific student
courses_taken_by_student(Student, Courses) :-
    student(Student, Semester),
    findall((Course, Teacher, Code), (course(Semester, Course, Teacher, Code)), Courses).

% Find students enrolled in a specific course
students_in_course(Course, Students) :-
    course(Semester, Course, _, _),
    findall(Student, (student(Student, Semester)), Students).
