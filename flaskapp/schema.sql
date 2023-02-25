CREATE TABLE user (
  user_id INTEGER PRIMARY KEY AUTOINCREMENT,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL
);

CREATE TABLE teacher (
  teacher_id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE student (
  student_id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);

CREATE TABLE course (
  course_id INTEGER PRIMARY KEY AUTOINCREMENT,
  course_name VARCHAR(255) NOT NULL, 
  course_board VARCHAR(255) NOT NULL, 
  course_level VARCHAR(255) NOT NULL, 

);

CREATE TABLE unit (
  unit_id INTEGER PRIMARY KEY AUTOINCREMENT,
  unit_number VARCHAR(255) NOT NULL,
  unit_name VARCHAR(255) NOT NULL,
  course_id INT NOT NULL,
  FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE criteria (
  criteria_id INTEGER PRIMARY KEY AUTOINCREMENT,
  criteria_name VARCHAR(255) NOT NULL,
  unit_id INT NOT NULL,
  FOREIGN KEY (unit_id) REFERENCES unit(unit_id)
);

CREATE TABLE subcriteria (
  subcriteria_id INTEGER PRIMARY KEY AUTOINCREMENT,
  subcriteria_name VARCHAR(255) NOT NULL,
  criteria_id INT NOT NULL,
  FOREIGN KEY (criteria_id) REFERENCES criteria(criteria_id)
);

--   student_id INT NOT NULL, (if want to break this down by student then need to add)
--   FOREIGN KEY (student_id) REFERENCES student(student_id)
CREATE TABLE teaching (
  teaching_id INTEGER PRIMARY KEY AUTOINCREMENT,
  teacher_id INT NOT NULL,
  subcriteria_id INT NOT NULL,
  dateTaught DATE,
  FOREIGN KEY (teacher_id) REFERENCES teacher(teacher_id),
  FOREIGN KEY (subcriteria_id) REFERENCES subcriteria(subcriteria_id),
);

CREATE TABLE completion (
  completion_id INTEGER PRIMARY KEY AUTOINCREMENT,
  student_id INT NOT NULL,
  subcriteria_id INT NOT NULL,
  completion_status VARCHAR(20) NOT NULL,
  FOREIGN KEY (student_id) REFERENCES student(student_id),
  FOREIGN KEY (subcriteria_id) REFERENCES subcriteria(subcriteria_id)
);

CREATE TABLE class (
  class_id INTEGER PRIMARY KEY AUTOINCREMENT,
  class_name VARCHAR(255) NOT NULL, 
  course_completion_date DATE
);

CREATE TABLE enrollment (
  enrollment_id INTEGER PRIMARY KEY AUTOINCREMENT,
  class_id INT NOT NULL,
  student_id INT NOT NULL,
  FOREIGN KEY (class_id) REFERENCES class(class_id),
  FOREIGN KEY (student_id) REFERENCES student(student_id)
);

-- ADD TEST DATA TO DATABASE

-- -- Add two users
-- INSERT INTO user (email, password) VALUES ('stevensl@centralfoundationboys.co.uk', 'password123');
-- INSERT INTO user (email, password) VALUES ('griffithsb@centralfoundationboys.co.uk
-- ', 'password123')

-- -- add one teacher
-- INSERT INTO teacher (teacher_id, user_id) VALUES ('1', '1');
-- -- add on student
-- INSERT INTO student (student_id, user_id) VALUES ('2', '2');

-- -- add two courses
-- INSERT INTO course (course_name, course_board, course_level) VALUES ('Computer Science', 'OCR','A level');
-- INSERT INTO course (course_name, course_board, course_level) VALUES ('Computer Science', 'OCR','GCSE');

-- -- add course units
-- INSERT INTO unit (unit_name, unit_number, course_id) VALUES ('Computer
-- systems', 'Unit 1', '1');
-- INSERT INTO unit (unit_name, course_id) VALUES ('Algorithms and
-- programming', 'Unit 2', '1');



