USE LibraryManagementSystem

/***********************************************************
	The creation of each of table
 ************************************************************/

CREATE TABLE tbl_library_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	branch_name VARCHAR(100) NOT NULL,
	branch_address VARCHAR(100) NOT NULL
);



CREATE TABLE tbl_publisher (
	publisher_name VARCHAR(100) PRIMARY KEY NOT NULL,
	publisher_address VARCHAR(100) NOT NULL,
	publisher_phone VARCHAR(100) NOT NULL 
);

CREATE TABLE tbl_books (
	book_id INT PRIMARY KEY NOT NULL IDENTITY (101,1),
	book_title VARCHAR(100) NOT NULL,
	publisher_name VARCHAR(100) NOT NULL CONSTRAINT fk_publisher_name FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_book_copies (
	book_id INT NOT NULL CONSTRAINT fk_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	number_of_copies INT NOT NULL
);

/* 
	In order to create the table below I had to rename the constraint for the 'book_id' column from 'fk_book_id' to 'fk_author_book_id' 
	or else throws an error sayying "There is already an object named 'fk_book_id' in the database"
*/
CREATE TABLE tbl_book_authors (
	book_id INT NOT NULL CONSTRAINT fk_author_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	author_name VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_borrower (
	card_number INT PRIMARY KEY NOT NULL IDENTITY (500001,1),
	borrower_name VARCHAR(100) NOT NULL,
	borrower_address VARCHAR(100) NOT NULL,
	borrower_phone VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_book_loans (
	book_id INT NOT NULL CONSTRAINT fk_loans_book_id FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL CONSTRAINT fk_loans_branch_id FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_number INT NOT NULL CONSTRAINT fk_card_number FOREIGN KEY REFERENCES tbl_borrower(card_number) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out DATE NOT NULL,
	date_due DATE NOT NULL
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
	('Chatham Square', '33 East Broadway, NYC'),
	('Sharpstown', '1 Main St. Portland, OR'),
	('Central', 'Alberta St. Portland,OR')
;

SELECT * FROM tbl_library_branch;

INSERT INTO tbl_publisher
	(publisher_name, publisher_address, publisher_phone)
	VALUES
	('Scholastic', '557 Broadway, New York City, New York, U.S. 10012', '800-724-6527'),
	('HarperCollins', '195 Broadway, New York, NY 10007', '212-207-7000'),
	('Modem Library', 'New York, New York', 'N/A'),
	('Little, Brown and Company', '3 Center Plz Ste 100 Boston, MA 02108', '617-227-0730'),
	('Alfred A. Knopf', '1745 Broadway New York, NY 10019', 'N/A'),
	('NAL', 'New York, New York', 'N/A'),
	('Ballantine Books', 'New York, New York', 'N/A'),
	('Warner Books', 'New York, New York', 'N/A'),
	('Dutton Books', 'New York, New York', 'N/A'),
	('Del Rey', 'New York, New York', 'N/A'),
	('Norton', '500 5th Ave # 6, New York, NY 10110', '212-354-5500'),
	('Anchor', '1745 Broadway New York, NY 10019', '212-782-9000'),
	('Penguin Random House', 'New York, New York', 'N/A'),
	('Signet Classics', 'New York, New York', 'N/A'),
	('Carpet Bombing Culture', 'United Kingdom', 'N/A'),
	('Viking Press', 'New York, New York', 'N/A'),
	('Doubleday', '1745 Broadway New York, NY 10019', 'N/A')
;

SELECT * FROM tbl_publisher;

INSERT INTO tbl_books
	(book_title, publisher_name)
	VALUES
	('The Hunger Games', 'Scholastic'),
	('Harry Potter and the Order of the Phoenix', 'Scholastic'),
	('To Kill a Mockingbird', 'HarperCollins'),
	('Pride and Prejudice', 'Modem Library'),
	('Twilight', 'Little, Brown and Company'),
	('The Book Thief', 'Alfred A. Knopf'),
	('The Chronicles of Narnia', 'HarperCollins'),
	('Animal Farm', 'NAL'),
	('The Hobbit and The Lord of the Rings', 'HarperCollins'),
	('Gone with the Wind', 'Warner Books'),
	('The Fault in Our Stars', 'Dutton Books'),
	('The Giving Tree', 'HarperCollins'),
	('The Hitchhiker''s Guide to the Galaxy', 'Del Rey'),
	('Wuthering Heights', 'Norton'),
	('The Da Vinci Code', 'Anchor'),
	('Memoirs of a Geisha', 'Penguin Random House'),
	('Alice''s Adventures in Wonderland & Through the Looking-Glass', 'Penguin Random House'),
	('The Picture of Dorian Gray', 'Modem Library'),
	('Les Misérables', 'Signet Classics'),
	('Jane Eyre', 'Penguin Random House'),
	('The Lost Tribe', 'Carpet Bombing Culture'),
	('Divergent', 'HarperCollins'),
	('It', 'Viking Press'),
	('Pet Sematary', 'Doubleday')
;

SELECT * FROM tbl_books;


INSERT INTO tbl_book_authors
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
	(113, 'Douglas Adams'),
	(114, 'Emily Brontë,  Richard J. Dunn '),
	(115, 'Dan Brown'),
	(116, 'Arthur Golden'),
	(117, 'Lewis Carroll'),
	(118, 'Oscar Wilde'),
	(119, 'Victor Hugo'),
	(120, 'Charlotte Brontë'),
	(121, 'Mark W. Lee'),
	(122, 'Veronica Roth'),
	(123, 'Stephen King'),
	(124, 'Stephen King')
;

SELECT * FROM tbl_book_authors;

INSERT INTO tbl_book_copies
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
	(111, 6, 9),
	(112, 6, 6),
	(113, 1, 10),
	(114, 1, 2),
	(115, 2, 5),
	(116, 2, 7),
	(117, 3, 1),
	(118, 3, 3),
	(119, 4, 9),
	(120, 4, 11),
	(121, 5, 5),
	(122, 5, 3),
	(123, 6, 8),
	(124, 6, 10)
;

SELECT * FROM tbl_book_copies;



INSERT INTO tbl_borrower
	(borrower_name, borrower_address, borrower_phone)
	VALUES
	('Saul Spinney', '7435 S. Canal St. Allison Park, PA 15101', '(588) 882-3277'),
	('Millicent Mick', '7039 Edgefield St. Hudsonville, MI 49426', '(230) 984-3111'),
	('Trula Teran', '7277 Bayberry St. Perth Amboy, NJ 08861', '(910) 279-8493'),
	('Jeremiah Joiner', '401 Glen Ridge Road East Elmhurst, NY 11369', '(372) 927-2436'),
	('Bradley Blosser', '30 John St. Detroit, MI 48205', '(235) 929-3914'),
	('Tracie Torbert', '4 Leatherwood St. Birmingham, AL 35209', '(257) 695-8692'),
	('Shanon Southern', '120 Country Club St. East Northport, NY 11731', '(475) 878-8234'),
	('Wesley Waldner', '953 Heather Drive State College, PA 16801', '(867) 426-0774'),
	('Elisha Erion', '9828 Hilldale St. Warner Robins, GA 31088', '(251) 924-3099'),
	('Samara Sweeten', '842 Sussex Street Augusta, GA 30906', '(894) 552-6270')
;

SELECT * FROM tbl_borrower;


INSERT INTO tbl_book_loans
	(book_id, branch_id, card_number, date_out, date_due)
	VALUES
	(, , , , ),
	(, , , , ),
	(, , , , ),
	(, , , , ),
	(, , , , ),
	(, , , , ),
;