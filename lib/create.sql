USE livrariaReal;
DROP TABLE IF EXISTS authors, publishers, books, authors_books, users, likes ;

CREATE TABLE authors ( 
	id INT NOT NULL AUTO_INCREMENT, 
	name VARCHAR(30), 
	birth_date DATE,
	PRIMARY KEY (id)
);

CREATE TABLE publishers ( 
	id INT NOT NULL AUTO_INCREMENT, 
	name VARCHAR(30),
	PRIMARY KEY (id)
);

CREATE TABLE books ( 
	id INT NOT NULL AUTO_INCREMENT, 
	name VARCHAR(45), 
	published TINYINT(1) DEFAULT 0,
	value FLOAT,
	id_publisher INT DEFAULT 1,
	PRIMARY KEY (id),
	FOREIGN KEY (id_publisher) REFERENCES publishers(id)
);

CREATE TABLE authors_books ( 
	id INT NOT NULL AUTO_INCREMENT, 
	book_id INT,
	author_id INT,
	PRIMARY KEY (id),
	FOREIGN KEY (book_id) REFERENCES books(id),
	FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE users ( 
	id INT NOT NULL AUTO_INCREMENT, 
	name VARCHAR(30) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE likes (
	id INT NOT NULL AUTO_INCREMENT, 
	user_id INT NOT NULL,
	ref_type VARCHAR(10) NOT NULL,
	ref_id INT NOT NULL,
	PRIMARY KEY (id)
);

# Protegendo a tabela de ligação 'authors_books' com index único no par (book_id ASC, author_id ASC)
CREATE UNIQUE INDEX idx_authors_books ON authors_books(book_id ASC, author_id ASC);

# Protegendo a tabela de ligação polimorfica 'likes'
CREATE UNIQUE INDEX idx_ref ON likes (user_id ASC, ref_id ASC, ref_type ASC);

# Cria os indexs de authors, books e publishers
CREATE INDEX idx_authors on authors(name);
CREATE INDEX idx_books on books(name);
CREATE INDEX idx_publishers on publishers(name);