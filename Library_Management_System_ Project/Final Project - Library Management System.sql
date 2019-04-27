

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

CREATE TABLE tbl_book_copies (
	book_id INT NOT NULL,
	branch_id INT NOT NULL,
	number_of_copies INT NOT NULL
);

CREATE TABLE tbl_book_authors (
	book_id INT NOT NULL,
	author_name VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_publisher (
	publisher_name INT PRIMARY KEY NOT NULL IDENTITY (1001,1),
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

