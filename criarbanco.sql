DROP IF EXISTS TABLE pedidos_detalhe;
DROP IF EXISTS TABLE livros;
DROP IF EXISTS TABLE generos;
DROP IF EXISTS TABLE usuarios;
DROP IF EXISTS TABLE pedidos;

CREATE TABLE generos
(
	GENERO_ID	SMALLINT		NOT NULL,
	DESCRICAO	VARCHAR(30)	NOT NULL,
	PRIMARY KEY (GENERO_ID)
);

INSERT INTO generos VALUES (1, 'Tecnologia Java');
INSERT INTO generos VALUES (2, 'Redes de Computadores - Geral');
INSERT INTO generos VALUES (3, 'Redes TCP/IP');
INSERT INTO generos VALUES (4, 'Sistemas Operacionais');
INSERT INTO generos VALUES (5, 'Hardware');
INSERT INTO generos VALUES (6, 'Orienta��o a Objetos e UML');
INSERT INTO generos VALUES (7, 'Bancos de Dados');


CREATE TABLE livros 
(
  LIVRO_ID	SMALLINT 	NOT NULL,
  TITULO		VARCHAR(50) NOT NULL,
  AUTOR		VARCHAR(80) NOT NULL,
  EDITORA	VARCHAR(30),
  ANO			SMALLINT		NOT NULL,
  GENERO_ID	SMALLINT		NOT NULL REFERENCES generos(GENERO_ID) ON DELETE RESTRICT,
  DESCRICAO	VARCHAR(200),
  PRECO		NUMERIC(15,2) NOT NULL,
  ESTOQUE	SMALLINT		NOT NULL,
  RESERVA	SMALLINT		NOT NULL,
  CAPA		BLOB,
 PRIMARY KEY (LIVRO_ID)
);

INSERT INTO livros VALUES (1, 'Core Servlets and JavaServer Pages', 'Marty Hall', 'Prentice Hall', 2000, 1,'Como criar servlets e JSPs utilizando boas praticas de programacao.', 27.50, 25, 0, null);
INSERT INTO livros VALUES (2, 'Core Java 2: Volume I - Fundamentals', 'Cay Horstmann e Gary Cornell', 'Prentice Hall', 2001, 1,'Conceitos basicos da linguagem Java.', 28.50, 20, 0, null);
INSERT INTO livros VALUES (3, 'Core Java 2: Volume II - Advanced Features', 'Cay Horstmann', 'Prentice Hall', 2001, 1,'Topicos avancados da linguagem Java, como JDBC, streams, RMI e outros.', 31.50, 20, 0, null);
INSERT INTO livros VALUES (4, 'Java and XML - 2nd ed', 'Brett McLaughlin', 'O Reilly & Associates', 2001, 1,'Utilizacao de XML com a linguagem Java e seus utilitarios.', 27.50, 10, 0, null);
INSERT INTO livros VALUES (5, 'Enterprise JavaBeans, 3rd ed', 'Richard Monson-Haefel', 'O Reilly & Associates', 2001, 1,'O ponto principal da Enterprise Edition de Java.', 27.50, 25, 0, null);
INSERT INTO livros VALUES (6, 'More Servlets and JavaServer Pages', 'Marty Hall', 'Prentice Hall', 2001, 1,'Nova versao aumentada do classico Core Servlets.', 31.50, 30, 0, null);
INSERT INTO livros VALUES (7, 'Java Cookbook', 'Ian Darwin', 'O Reilly and Associates', 2001, 1,'Topicos especificos sobre diferentes aspectos da tecnologia.', 27.50, 8, 0, null);
INSERT INTO livros VALUES (8, 'Complete Java 2 Certification Study Guide', 'Roberts, Heller e Michael', 'Sybex', 2000, 1,'Revisao de assuntos e questoes de exemplo visando o teste de certificacao Java.', 28.25, 10, 0, null);
INSERT INTO livros VALUES (9, 'Oracle9i Web Development', 'Brown', 'Oracle Press', 2001, 7,'Desenvolvimento para HTML e XML usando a nova versao do Oracle Server.', 36.95, 10, 0, null);
INSERT INTO livros VALUES (10, 'OCA/OCP: Introduction to Oracle9i SQL Study Guide', 'Chip Dawes, Biju Thomas', 'Sybex', 2002, 7,'Auxilio para os testes de certificacao Oracle.', 28.25, 15, 0, null);
INSERT INTO livros VALUES (11, 'Practical PostgreSQL', 'John Worsley e Joshua Drake', 'O Reilly & Associates', 2002, 7,'Informacoes sobre um dos bancos de dados open-source mais usados.', 27.50, 15, 0, null);
INSERT INTO livros VALUES (12, 'Internetworking with TCP/IP', 'Douglas Comer', 'Prentice Hall', 2000, 3,'Classico sobre TCP/IP revisado e aumentado.', 58.95, 10, 0, null);
INSERT INTO livros VALUES (13, 'TCP/IP Illustrated, Volume 1: The Protocols', 'W. Richard Stevens', 'Addison-Wesley', 1994, 3,'Definicoes sobre os protocolos da pilha TCP/IP com exercicios praticos.', 51.95, 10, 0, null);
INSERT INTO livros VALUES (14, 'Computer Networks', 'Andrew S. Tanenbaum', 'Prentice Hall', 1996, 2,'Classico sobre Redes de Computadores.', 78.50, 10, 0, null);
INSERT INTO livros VALUES (15, 'Modern Operating Systems 2nd ed', 'Andrew S. Tanenbaum', 'Prentice Hall', 2001, 4,'Topicos sobre Sistemas Operacionais. Nova edicao revisada.', 77.50, 10, 0, null);
INSERT INTO livros VALUES (16, 'Applied Operating Systems Concepts', 'Avi Silberschatz', 'John Wiley', 1999, 4,'Topicos sobre Sistemas Operacionais.', 87.75, 10, 0, null);


CREATE TABLE usuarios
(
	USUARIO_ID	SMALLINT NOT NULL,
	NOME			VARCHAR(40)	NOT NULL,
	ENDERECO		VARCHAR(40),
	BAIRRO		VARCHAR(30),
	CIDADE		VARCHAR(30),
	UF				CHAR(2),
	CEP			CHAR(8),
	FONE			VARCHAR(20) NOT NULL,
	LOGIN			VARCHAR(20)	NOT NULL,
	SENHA			VARCHAR(20)	NOT NULL,
  PRIMARY KEY (USUARIO_ID)
);

INSERT INTO usuarios VALUES (1, 'usuario1', 'endereco 1', 'bairro 1', 'cidade 1', 'PR', '00000000', '0000-0000', 'usuario1', 'senha1');
INSERT INTO usuarios VALUES (2, 'usuario2', 'endereco 2', 'bairro 2', 'cidade 2', 'PR', '00000000', '0000-0000', 'usuario2', 'senha2');

CREATE TABLE pedidos
(
	PEDIDO_ID	SERIAL,
	USUARIO_ID	SMALLINT NOT NULL,
	DATA_PEDIDO	DATE 		NOT NULL,
	TIPO_PAG		SMALLINT NOT NULL,
	PRIMARY KEY (PEDIDO_ID)
);

CREATE TABLE pedidos_detalhe
(
	DETALHE_ID	SERIAL,
	PEDIDO_ID 	SMALLINT NOT NULL,
	LIVRO_ID	SMALLINT NOT NULL,
	QTD			SMALLINT NOT NULL,
  PRIMARY KEY (DETALHE_ID)
);
