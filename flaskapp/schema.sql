
-- Drop tables when creating schema for fresh start
DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS teacher;
DROP TABLE IF EXISTS student;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS unit;
DROP TABLE IF EXISTS criteria;
DROP TABLE IF EXISTS subcriteria;
DROP TABLE IF EXISTS teaching;
DROP TABLE IF EXISTS completion;
DROP TABLE IF EXISTS class;
DROP TABLE IF EXISTS enrollment;

CREATE TABLE user (
  user_id INTEGER PRIMARY KEY AUTOINCREMENT,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL, 
  firstName VARCHAR(255) NOT NULL, 
  secondName VARCHAR(255) NOT NULL 
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
  course_level VARCHAR(255) NOT NULL
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
  FOREIGN KEY (subcriteria_id) REFERENCES subcriteria(subcriteria_id)
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

-- ADD USERS

INSERT INTO user (email, password, firstName, secondName)
VALUES ('mousem@email.com', 'password123', 'Micky', 'Mouse'),
       ('bloggsjb@email.com', 'password123', 'Joe', 'Bloggs'),
       ('duckd@email.com', 'password123', 'Donald', 'Duck');

--  password123 is 'pbkdf2:sha256:260000$U8dK41YK03Sce8Dc$51cb16422ea176c81077ea24d1e3b1c0103cb875d8b8e62a4a78f554af988de3'
-- UPDATE user SET password='pbkdf2:sha256:260000$U8dK41YK03Sce8Dc$51cb16422ea176c81077ea24d1e3b1c0103cb875d8b8e62a4a78f554af988de3' WHERE user_id=1;


-- add teacher users
INSERT INTO teacher (user_id)
VALUES (1), (3);

-- add student users
INSERT INTO student (user_id)
VALUES (2);


-- #########################################
-- Add course data for a level and gcse computer science

INSERT INTO course (course_name, course_board, course_level)
VALUES ('Computer Science', 'OCR', 'A level'),
       ('Computer Science', 'OCR', 'GCSE');



-- #########################################
-- Add unit data for a level and gcse computer science

INSERT INTO unit (unit_number, unit_name, course_id)
VALUES ('Unit 1', 'Computer systems', 1),
       ('Unit 2', 'Algorithms and programming', 1),
       ('Unit 3', 'Programming project', 1),
       ('Unit 1', 'Computer systems', 2),
       ('Unit 2', 'Algorithms and programming', 2),
       ('Unit 3', 'Programming project', 2);

-- Add criteria data for a level computer science

INSERT INTO criteria (criteria_name, unit_id)
VALUES ('1.1.1 Structure and function of the processor', 1),
       ('1.1.2 Types of processor', 1),
       ('1.1.3 Input, output and storage', 1),
       ('1.2.1 Systems Software', 1),
       ('1.2.2 Applications Generation', 1),
       ('1.2.3 Software Development', 1),
       ('1.2.4 Types of Programming Language', 1),
       ('1.3.1 Compression, Encryption and Hashing', 1),
       ('1.3.2 Databases', 1),
       ('1.3.3 Networks', 1),
       ('1.3.4 Web Technologies', 1),
       ('1.4.1 Data Types', 1),
       ('1.4.2 Data Structures', 1),
       ('1.4.3 Boolean Algebra', 1),
       ('1.5.1 Computing related legislation', 1),
       ('1.5.2 Moral and ethical Issues', 1),
       ('2.1.1 Thinking abstractly', 2),
       ('2.1.2 Thinking ahead', 2),
       ('2.1.3 Thinking procedurally', 2),
       ('2.1.4 Thinking logically', 2),
       ('2.1.5 Thinking concurrently', 2),
       ('2.2.1 Programming techniques', 2),
       ('2.2.2 Computational methods', 2),
       ('2.3.1 Algorithms', 2);

-- subcriteria for A level computer sceince

INSERT INTO subcriteria (criteria_id, subcriteria_name) VALUES 
(1, '(a) The Arithmetic and Logic Unit: ALU'),
(1, '(a) Control Unit'),
(1, '(a) Registers (Program Counter; PC, Accumulator; ACC, Memory Address Register; MAR, Memory Data Register; MDR, Current Instruction Register; CIR). '),
(1, '(a) Buses: data, address and control'),
(1, '(a) how ALU, CU, Registers and busses relate to assembly language programs.'),
(1, '(b) The Fetch-Decode-Execute Cycle; including its effects on registers.'),
(1, '(c) The factors affecting the performance of the CPU: clock speed, number of cones, cache.'),
(1, '(d) The use of pipelining in a processor to improve efficiency.'),
(1, '(e) Von Neumann, Harvard and contemporary processor architecture.'),
(2, '(a) The differences between and uses of CISC and RISC processors'),
(2, '(b) GPUs and their uses (including those not related to graphics).'),
(2, '(c) Multicore and Parallel systems'),
(3, '(a) How different input, output and storage devices can be applied to the solution of different problems.'),
(3, '(b) The uses of magnetic, flash and optical storage devices.'),
(3, '(c) RAM and ROM'),
(3, '(d) Virtual storage.'),
(4, '(a) The need for, function and purpose of operating systems.'),
(4, '(b) Memory Management (paging, segmentation and virtual memory).'),
(4, '(c) Interrupts, the role of interrupts and Interrupt Service Routines (ISR), role within the Fetch-Decode-Execute Cycle.'),
(4, '(d) Scheduling: round robin, first come first served, multi-level feedback queues, shortest job first and shortest remaining time.'),
(4, '(e) Distributed, embedded, multi-tasking, multi-user and Real Time operating systems'),
(4, '(f) BIOS'),
(4, '(g) Device drivers'),
(4, '(h) Virtual machines, any instance where software is used to take on the function of a machine, including executing intermediate code or running an operating system within another.'),
(5, '(a) The nature of applications, justifying suitable applications for a specific purpose.'),
(5, '(b) Utilities.'),
(5, '(c) Open source vs closed source'),
(5, '(d) Translators:Interpreters, compilers and assemblers.'),
(5, '(e) Stages of compilation (lexical analysis, syntax analysis, code generation and optimisation).'),
(5, '(f) Linkers and loaders and use of libraries'),
(6, '(a) Understand the waterfall lifecycle, agile methodologies, extreme programming, the spiral model and rapid application development'),
(6, '(b) The relative merits and drawbacks of different methodologies and when they might be used.'),
(6, '(c) Writing and following algorithms.'),
(7, '(a) Need for and characteristics of a variety of programming paradigms.'),
(7, '(b) Procedural languages.'),
(7, '(c) Assembly language (including following and writing simple programs with the Little Man Computer instruction set). See appendix 5e,'),
(7, '(d) Modes of addressing memory (immediate, direct, indirect and indexed).'),
(7, '(e) Object-oriented languages (see appendix 5e for pseudocode style) with an understanding of classes, objects, methods, attributes, inheritance, encapsulation and polymorphism.'),
  (8, '(a) Lossy vs Lossless compression'),
  (8, '(b) Run length encoding and dictionary coding for lossless compression.'),
  (8, '(c) Symmetric and asymmetric encryption'),
  (8, '(d) Different uses of hashing.'),
  (9, '(a) Relational database, flat file, primary key, foreign key, secondary key, entity relationship modelling, normalisation and indexing. See appendix 5g'),
  (9, '(b) Methods of capturing, selecting, managing and exchanging data.'),
  (9, '(c) Normalisation to 3NF'),
  (9, '(d) SQL  Interpret and modify. See appendix 5e.'),
  (9, '(e) Referential integrity.'),
  (9, '(f) Transaction processing, ACID (Atomicity, Consistency, Isolation, Durability), record locking and redundancy.'),
  (10, '(a) Characteristics of networks and the importance of protocols and standards.'),
  (10, '(a) The internet structure:The TCP/IP Stack.'),
  (10, '(b) The internet structure: DNS'),
  (10, '(b) The internet structure:Protocol layering.'),
  (10, '(b) The internet structure:LANs and WANs.'),
  (10, '(b) The internet structure:Packet and circuit switching.'),
  (10, '(c) Network security and threats, use of firewalls, proxies and encryption.'),
  (10, '(d) Network hardware'),
  (10, '(e) Client-server and peer to peer.'),
  (11, '(a) HTML, CSS and JavaScript. See appendix 5e.'),
  (11, '(b) Search engine indexing'),
  (11, '(c) PageRank algorithm'),
  (11, '(d) Server and client side processing.'),
  (12, '(a) Primitive data types, integer, real/floating point, character, string and Boolean'),
  (12, '(b) Represent positive integers in binary'),
  (12, '(c) Use of sign and magnitude and two’s complement to represent negative numbers in binary.'),
  (12, '(d) Addition and subtraction of binary integers.'),
  (12, '(e) Represent positive integers in hexadecimal'),
  (12, '(f) Convert positive integers between binary hexadecimal and denary.'),
  (12, '(g) Representation and normalisation of floating point numbers in binary.'),
  (12, '(h) Floating point arithmetic, positive and negative numbers, addition and subtraction.'),
  (12, '(i) Bitwise manipulation and masks: shifts, combining with AND, OR, and XOR'),
  (12, '(j) How character sets (ASCII and UNICODE) are used to represent text.'),
  (13, '(a) Arrays (of up to 3 dimensions)'),
  (13, '(a) records'),
  (13, '(a) lists'),
  (13, '(a) tuples'),
  (13, '(b) The following structures to store data: linked-list'),
  (13, '(b) The following structures to store data: graph (directed and undirected)'),
  (13, '(b) The following structures to store data: stack'),
  (13, '(b) The following structures to store data: queue'),
  (13, '(b) The following structures to store data: tree'),
  (13, '(b) The following structures to store data: binary search tree'),
  (13, '(b) The following structures to store data: hash table.'),
  (13, '(c) How to create, traverse, add data to and remove data from linked-list - procedural array approach'),
  (13, '(c) How to create, traverse, add data to and remove data from graph (directed and undirected) - procedural array approach'),
  (13, '(c) How to create, traverse, add data to and remove data from stack - procedural array approach'),
  (13, '(c) How to create, traverse, add data to and remove data from queue - procedural array approach'),
  (13, '(c) How to create, traverse, add data to and remove data from tree - procedural array approach'),
  (13, '(c) How to create, traverse, add data to and remove data frombinary search tree - procedural array approach'),    (13, '(c) How to create, traverse, add data to and remove data from hash table. - procedural array approach'),
  (13, '(c) How to create, traverse, add data to and remove data from linked-list - OO approach'),
  (13, '(c) How to create, traverse, add data to and remove data from graph (directed and undirected) - OO approach'),
  (13, '(c) How to create, traverse, add data to and remove data from stack - OO approach'),
  (13, '(c) How to create, traverse, add data to and remove data from queue - OO approach'),
  (13, '(c) How to create, traverse, add data to and remove data from tree - OO approach'),
  (13, '(c) How to create, traverse, add data to and remove data frombinary search tree - OO approach'),
  (13, '(c) How to create, traverse, add data to and remove data from hash table. - OO approach'),
  (14, '(a) Define problems using Boolean logic. See appendix 5e'),
  (14, '(b) Manipulate Boolean expressions, including the use of Karnaugh maps to simplify Boolean expressions.'),
  (14, '(c) Use the following rules to derive or simplify statements in Boolean algebra: De Morgan’s Laws, distribution, association, commutation, double negation'),
  (14, '(d) Using logic gate diagrams and truth tables. See appendix 5e'),
  (14, '(e) The logic associated with D type flip flops, half and full adders'),
  (15, '(a) The Data Protection Act 1998.'),
  (15, '(b) The Computer Misuse Act 1990.'),
  (15, '(c) The Copyright Design and Patents Act 1988.'),
  (15, '(d) The Regulation of Investigatory Powers Act 2000.'),
  (16, 'The individual moral, social, ethical and cultural opportunities and risks of digital technology: Computers in the workforce.'),
  (16, 'The individual moral, social, ethical and cultural opportunities and risks of digital technology:Automated decision making.'),
  (16, 'The individual moral, social, ethical and cultural opportunities and risks of digital technology:Artificial intelligence.'),
  (16, 'The individual moral, social, ethical and cultural opportunities and risks of digital technology:Environmental effects.'),
  (16, 'The individual moral, social, ethical and cultural opportunities and risks of digital technology:Censorship and the Internet. Monitor behaviour.'),
  (16, 'The individual moral, social, ethical and cultural opportunities and risks of digital technology:Analyse personal information.'),
  (16, 'The individual moral, social, ethical and cultural opportunities and risks of digital technology: Piracy and offensive communications.'),
  (16, 'The individual moral, social, ethical and cultural opportunities and risks of digital technology: Layout, colour paradigms and character sets.'),
  (17, '(a) The nature of abstraction.'),
  (17, '(b) The need for abstraction.'),
  (17, '(c) The differences between an abstraction and reality.'),
(17, '(d) Devise an abstract model for a variety of situations.'),
(18, '(a) Identify the inputs and outputs for a given situation.'),
(18, '(b) Determine the preconditions for devising a solution to a problem'),
(18, '(c) The nature, benefits and drawbacks of caching.'),
(18, '(d) The need for reusable program components.'),
(19, '(a) Identify the components of a problem.'),
(19, '(b) Identify the components of a solution to a problem'),
(19, '(c) Determine the order of the steps needed to solve a problem.'),
(19, '(d) Identify sub-procedures necessary to solve a problem'),
(20, '(a) Identify the points in a solution where a decision has to be taken.'),
(20, '(b) Determine the logical conditions that affect the outcome of a decision.'),
(20, '(c) Determine how decisions affect flow through a program.'),
(21, '(a) Determine the parts of a problem that can be tackled at the same time'),
(21, '(b) Outline the benefits and trade offs that might result from concurrent processing in a particular situation.'),
(22, '(a) Programming constructs: sequence, iteration, branching.'),
(22, '(b) Recursion, how it can be used and compares to an iterative approach'),
(22, '(c) Global and local variables'),
(22, '(d) Modularity, functions and procedures, parameter passing by value and by reference.'),
(22, '(e) Use of an IDE to develop/debug a program'),
(22, '(f) Use of object oriented techniques.'),
(23, '(a) Features that make a problem solvable by computational methods.'),
(23, '(b) Problem recognition'),
(23, '(c) Problem decomposition.'),
(23, '(d) Use of divide and conquer.'),
(23, '(e) Use of abstraction.'),
(23, '(f) Learners should apply their knowledge of: backtracking'),
(23, '(f) Learners should apply their knowledge of:data mining'),
(23, '(f) Learners should apply their knowledge of: heuristics'),
(23, '(f) Learners should apply their knowledge of: performance modelling'),
(23, '(f) Learners should apply their knowledge of:pipelining'),
(23, '(f) Learners should apply their knowledge of: visualisation to solve problems'),
(24, '(a) Analysis and design of algorithms for a given situation.'),
(24, '(b) The suitability of different algorithms for a given task and data set, in terms of execution time and space.'),
(24, '(c) Measures and methods to determine the efficiency of different algorithms, Big O notation (constant, linear, polynomial, exponential and logarithmic complexity)'),
(24, '(d) Comparison of the complexity of algorithms.'),
(24, '(e) Algorithms for the main data structures stacks'),
(24, '(e) Algorithms for the main data structures queues'),
(24, '(e) Algorithms for the main data structures trees'),
(24, '(e) Algorithms for the main data structures linked lists'),
(24, '(e) Algorithms for the main data structures, depth-first (post-order)'),
(24, '(e) Algorithms for the main data structures breadth-first traversal of trees'),
(24, '(f) Standard algorithms bubble sort'),
(24, '(f) Standard algorithms insertion sort'),
(24, '(f) Standard algorithms merge sort'),
(24,'(f) Standard algorithms quick sort'),
(24,'(f) Standard algorithms Dijkstras shortest path algorithm'),
(24,'(f) Standard algorithms A* algorithm'),
(24,'(f) Standard algorithms  binary search');


-- A level teaching LL and LS

INSERT INTO teaching (teacher_id, subcriteria_id, dateTaught) 
VALUES 
  (1, 1, '2023-02-25'),
  (1, 2, '2023-02-25'),
  (1, 3, '2023-02-25'),
  (1, 4, '2023-02-25'),
  (1, 5, '2023-02-25'),
  (1, 6, '2023-02-25'),
  (1, 7, '2023-02-25'),
  (1, 8, '2023-02-25'),
  (1, 9, '2023-02-25'),
  (1, 10, '2023-02-25'),
  (1, 11, '2023-02-25'),
  (1, 12, '2023-02-25'),
  (1, 13, '2023-02-25'),
  (1, 14, '2023-02-25'),
  (1, 15, '2023-02-25'),
  (1, 16, '2023-02-25'),
  (1, 17, '2023-02-25'),
  (1, 18, '2023-02-25'),
  (1, 19, '2023-02-25'),
  (1, 20, '2023-02-25'),
  (1, 21, '2023-02-25'),
  (1, 22, '2023-02-25'),
  (1, 23, '2023-02-25'),
  (1, 24, '2023-02-25'),
  (1, 25, '2023-02-25'),
  (1, 26, '2023-02-25'),
  (1, 27, '2023-02-25'),
  (1, 28, '2023-02-25'),
  (1, 29, '2023-02-25'),
  (1, 30, '2023-02-25'),
  (1, 31, '2023-02-25'),
  (1, 32, '2023-02-25'),
  (1, 33, '2023-02-25'),
  (1, 34, '2023-02-25'),
  (1, 35, '2023-02-25'),
  (1, 36, '2023-02-25'),
  (1, 58, '2023-02-25'),
  (1, 59, '2023-02-25'),
  (1, 60, '2023-02-25'),
  (1, 61, '2023-02-25'),
  (1, 72, '2023-02-25'),
  (1, 73, '2023-02-25'),
  (1, 74, '2023-02-25'),
  (1, 75, '2023-02-25'),
  (1, 76, '2023-02-25'),
  (1, 77, '2023-02-25'),
  (1, 78, '2023-02-25'),
  (1, 79, '2023-02-25'),
(1, 80, '2023-02-25'),
(1, 81, '2023-02-25'),
(1, 82, '2023-02-25'),
(1, 83, '2023-02-25'),
(1, 84, '2023-02-25'),
(1, 85, '2023-02-25'),
(1, 86, '2023-02-25'),
(1, 87, '2023-02-25'),
(1, 88, '2023-02-25'),
(1, 89, '2023-02-25'),
(1, 90, '2023-02-25'),
(1, 91, '2023-02-25'),
(1, 92, '2023-02-25'),
(1, 93, '2023-02-25'),
(1, 94, '2023-02-25'),
(1, 95, '2023-02-25'),
(1, 96, '2023-02-25'),
(2, 97, '2023-02-25'),
(2, 98, '2023-02-25'),
(2, 99, '2023-02-25'),
(2, 100, '2023-02-25'),
(2, 101, '2023-02-25'),
(2, 102, '2023-02-25'),
(2, 103, '2023-02-25'),
(2, 104, '2023-02-25'),
(2, 105, '2023-02-25'),
(2, 106, '2023-02-25'),
(2, 107, '2023-02-25'),
(2, 108, '2023-02-25'),
(2, 109, '2023-02-25'),
(2, 110, '2023-02-25'),
(2, 111, '2023-02-25'),
(2, 112, '2023-02-25'),
(2, 113, '2023-02-25'),
(2, 114, '2023-02-25'),
(2, 115, '2023-02-25'),
(2, 116, '2023-02-25'),
(2, 117, '2023-02-25'),
(2, 118, '2023-02-25'),
(2, 119, '2023-02-25'),
(2, 120, '2023-02-25'),
(2, 121, '2023-02-25'),
(2, 122, '2023-02-25'),
(2, 123, '2023-02-25'),
(2, 124, '2023-02-25'),
(2, 125, '2023-02-25'),
(2, 126, '2023-02-25'),
(2, 127, '2023-02-25'),
(2, 128, '2023-02-25'),
(2, 129, '2023-02-25'),
(2, 130, '2023-02-25'),
(1, 131, '2023-02-25'),
(1, 132, '2023-02-25'),
(1, 133, '2023-02-25'),
(1, 134, '2023-02-25'),
(1, 135, '2023-02-25'),
(1, 136, '2023-02-25'),
(1, 137, '2023-02-25'),
(2, 138, '2023-02-25'),
(2, 139, '2023-02-25'),
(2, 140, '2023-02-25'),
(2, 141, '2023-02-25'),
(2, 142, '2023-02-25'),
(2, 143, '2023-02-25'),
(2, 144, '2023-02-25'),
(2, 145, '2023-02-25'),
(2, 146, '2023-02-25'),
(2, 147, '2023-02-25'),
(1, 148, '2023-02-25'),
(1, 149, '2023-02-25'),
(1, 150, '2023-02-25'),
(1, 151, '2023-02-25'),
(1, 152, '2023-02-25'),
(1, 153, '2023-02-25'),
(1, 154, '2023-02-25'),
(1, 155, '2023-02-25'),
(1, 156, '2023-02-25'),
(1, 157, '2023-02-25'),
(1, 158, '2023-02-25'),
(1, 159, '2023-02-25'),
(1, 160, '2023-02-25'),
(1, 161, '2023-02-25'),
(1, 162, '2023-02-25'),
(1, 163, '2023-02-25'),
(1, 164, '2023-02-25');

-- create classes
INSERT INTO class (class_name, course_completion_date) 
VALUES 
('13CM', '2023'),
('10DCM', '2024'),
('10ACM', '2024'),
('10BCM', '2024');