

/***********************************************************
	The creation of each of table
 ************************************************************/

CREATE TABLE tbl_library_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branch_name VARCHAR(50) NOT NULL,
	branch_address VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_books (
	book_id INT PRIMARY KEY NOT NULL IDENTITY (101,1),
	book_title VARCHAR(50) NOT NULL,
	publisher_name VARCHAR(50) NOT NULL 
);

CREATE TABLE tbl_book_authors (
	book_id INT NOT NULL,
	author_name VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_book_copies (
	book_id INT NOT NULL,
	branch_id INT NOT NULL,
	number_of_copies INT NOT NULL
);

CREATE TABLE tbl_publisher (
	publisher_name VARCHAR PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(50) NOT NULL,
	publisher_phone VARCHAR(50) NOT NULL 
);

CREATE TABLE tbl_borrower (
	card_number INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	borrower_name VARCHAR(50) NOT NULL,
	borrower_address VARCHAR(50) NOT NULL,
	borrower_phone VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_book_loans (
	book_id INT NOT NULL,
	branch_id INT NOT NULL,
	card_number INT NOT NULL,
	date_out DATE NOT NULL,
	date_due_ DATE NOT NULL
);

/***********************************************************
	The creation of each of table
 ************************************************************/

 INSERT INTO tbl_library_branch
	(branch_name, branch_address)
	VALUES
	('Agular', '174 East 110th Street, NYC'),
	('Battery Park City', '175 North End Avenue, NYC'),
	('Bloomingdale', '150 West 100th Street, NYC'),
	('Chatham Square', '33 East Broadway, NYC')
	('Sharpstown', '1 Main St. Portland, OR')
;

INSERT INTO tbl_books
	(book_title, publisher_name)
	VALUES
	('The Hunger Games', 'Scholastic'),
	('Harry Potter and the Order of the Phoenix', 'Scholastic'),
	('To Kill a Mockingbird', 'HarperCollins'),
	('Pride and Prejudice', 'Modern Library'),
	('Twilight', 'Little, Brown and Company'),
	('The Book Thief', 'Alfred A. Knopf'),
	('The Chronicles of Narnia', 'HarperCollins'),
	('Animal Farm', 'NAL'),
	('The Hobbit and The Lord of the Rings', ''),
	('Gone with the Wind', 'Warner Books'),
	('The Fault in Our Stars', 'Dutton Books'),
	('The Giving Tree', 'HarperCollins'),
	('The Hitchhiker''s Guide to the Galaxy', ''),
	('', ''),
	('', ''),
	('', ''),
	('', ''),
	('', ''),
	('', ''),
	('', ''),
	('', ''),
;

INSERT INTO tbl_authors
	(book_id, author_name)
	VALUES
	(101, 'Suzanne Collins'),
	(102, 'J.K. Rowling'),
	(103, 'Harper Lee'),
	(104, 'Jane Austen'),
	(105, 'Stephenie Meyer'),
	(106, 'Markus Zusak'),
	(107, 'C.S. Lewis'),
	(108, 'George Orwell'),
	(109, 'Ballantine Books'),
	(110, 'Margaret Mitchell'),
	(111, 'John Green'),
	(112, 'Shel Silverstein'),
	(, ''),
	(, ''),
	(, ''),
	(, ''),
	(, ''),
	(, ''),
	(, ''),
	(, ''),
	(, ''),
	(, ''),
;

INSERT INTO tbl_book_authors
	(book_id, branch_id, number_of_copies)
	VALUES
	(101, 1, 2),
	(102, 1, 5),
	(103, 2, 6),
	(104, 2, 9),
	(105, 3, 10),
	(106, 3, 8),
	(107, 4, 9),
	(108, 4, 3),
	(109, 5, 8),
	(110, 5, 4),
	(111, 1, 9),
	(112, 1, 6),
	(, , ),
	(, , ),
	(, , ),
;

INSERT INTO tbl_publisher
	(publisher_name, publisher_address, publisher_phone)
	VALUES
	('Scholastic', '557 Broadway, New York City, New York, U.S. 10012', '800-724-6527'),
	('HarperCollins', '195 Broadway, New York, NY 10007', '212-207-7000'),
	('Modern Library', 'New York, New York', 'N/A'),
	('Little, Brown and Company', '3 Center Plz Ste 100 Boston, MA 02108', '617-227-0730'),
	('Alfred A. Knopf', '1745 Broadway New York, NY 10019', 'N/A'),
	('NAL', 'New York, New York', 'N/A'),
	('Ballantine Books', 'New York, New York', 'N/A'),
	('Warner Books', 'New York, New York', 'N/A'),
	('Dutton Books', 'New York, New York', 'N/A'),
	('', '', ''),
	('', '', ''),
	('', '', ''),
	('', '', ''),
	('', '', ''),
	('', '', ''),
	('', '', ''),
	('', '', ''),
	('', '', ''),
	('', '', ''),
	('', '', ''),
	('', '', ''),
	('', '', ''),
	('', '', ''),
	('', '', ''),
	('', '', ''),
