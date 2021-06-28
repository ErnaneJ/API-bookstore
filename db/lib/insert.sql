USE livrariaReal;

# insere os authors
INSERT INTO authors (name, birth_date) 
	VALUES
		( 'Jose da silva', '1994-03-28'),
		( 'Ernane Ferreira', '1991-04-22'),
		( 'Fernando Rodrigues', '1988-05-29'),
		( 'Jose guedes', '1974-05-24'),
		( 'Silvino Motta', '1978-07-27'),
		( 'Ricardo Chaves', '1998-06-21'),
		( 'Chapolim colorado', '1953-05-18'),
		( 'Tom Rodrigues', '1963-07-27');

# insere as publishers
INSERT INTO publishers (name) 
	VALUES 
		('-'),
		('Pearson'),
		('Grupo Planeta'),
		('ThomsonReuters'),
		('Wolters Kluwer');

# insere os books PUBLICADOS
INSERT INTO books (name, published, publisher_id, value) 
	VALUES
		('A volta dos que nao foram',1,2,10.57),
		('Em Busca do Tempo Perdido ',1,3,78.65),
		('Cem Anos de Solidão',1,3,48.93),
		('Moby Dick',1,4,45.87),
		('Guerra e Paz',1,5,47.83),
		('Lolita',1,2,32.78),
		('O Campo de Centeio ',1,4,84.72),
		('Odisseia',1,5,65.74),
		('Os Irmãos Karamazov',1,2,98.47),
		('Crime e Castigo',1,3,63.41),
		('As Aventuras de Finn',1,2,39.84),
		('Alice no País das Maravilhas',1,3,36.75);
	
# insere os books NAO PUBLICADOS		
INSERT INTO books (name, value) 
	VALUES	
		('Ulysses',48.52),
		('Dom Quixote',48.99),
		('O Grande Gatsby',28.54),
		('Hamlet',69.24),
		('Madame Bovary',96.77),
		('Divina Comédia',62.41),
		('Orgulho e Preconceito',81.99),
		('O Morro dos Ventos Uivantes',78.52);
	
# Interliga os books com os authores
	INSERT INTO authors_books (book_id, author_id) 
	VALUES
		(1,8),
		(2,7),
		(3,6),
		(4,5),
		(5,4),
		(6,3),
		(7,2),
		(8,4),
		(9,8),
		(10,7),
		(11,6),
		(12,5),
		(13,4),
		(14,3),
		(15,2),
		(16,1),
		(17,8),
		(18,7),
		(19,6),
		(20,5);
	
# Insere users
	INSERT INTO users (name)
	VALUES 
		('Wendell Rodrigues'),
		('Marielly Rocha'),
		('Martha Giovanna'),
		('Jose Algusto'),
		('Otavio Ferreira'),
		('Andre Silva'),
		('Lucas Guedes'),
		('Fernando Lucas');

# Likes
INSERT INTO likes (user_id, ref_type, ref_id)
	VALUES 
		(1,'book',1),
		(2,'book',2),
		(3,'book',3),
		(4,'book',4),
		(5,'book',5),
		(6,'book',6),
		(7,'book',7),
		(8,'book',8),
		(1,'book',9),
		(2,'book',10),
		(3,'book',11),
		(4,'book',12),
		(5,'book',13),
		(6,'book',14),
		(7,'book',15),
		(8,'book',16),
		(1,'book',17),
		(2,'book',18),
		(3,'book',19),
		(4,'book',20),
		(8,'book',1),
		(7,'book',2),
		(6,'book',3),
		(5,'book',4),
		(4,'book',5),
		(3,'book',6),
		
		
		(1, 'author',1),
		(2, 'author',2),
		(3, 'author',3),
		(4, 'author',4),
		(5, 'author',5),
		(6, 'author',6),
		(7, 'author',7),
		(8, 'author',8),
		(8, 'author',7),
		(7, 'author',6),
		(6, 'author',5),
		(5, 'author',4),
		(4, 'author',3),
		
		
		(1, 'publisher',2),
		(2, 'publisher',3),
		(3, 'publisher',4),
		(4, 'publisher',2),
		(5, 'publisher',4),
		(6, 'publisher',3),
		(7, 'publisher',2),
		(8, 'publisher',3),
		(1, 'publisher',4),
		(2, 'publisher',2),
	
		(1, 'user',1),
		(2, 'user',2),
		(3, 'user',3),
		(4, 'user',4),
		(5, 'user',5),
		(6, 'user',6),
		(7, 'user',7),
		(8, 'user',8),
		(8, 'user',7),
		(7, 'user',6),
		(6, 'user',5),
		(5, 'user',4),
		(4, 'user',3);