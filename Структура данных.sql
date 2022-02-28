/**
  Таблица книг
 */
CREATE TABLE books
(
    id           serial  NOT NULL PRIMARY KEY,
    book_title   varchar NOT NULL,
    edition_date int     NOT NULL
);
comment on column books.edition_date is 'Дата издания в Unix Time Stamp.';

/**
  Таблица авторов
 */
CREATE TABLE authors
(
    id          serial   NOT NULL PRIMARY KEY,
    author_name varchar  NOT NULL,
    gender      smallint not null,
    birth_date  int      NOT NULL
);
comment on column authors.gender is '0 – пол не указан, 1 - юноша, 2 - девушка.';
comment on column authors.gender is 'День рождения в Unix Time Stamp.';

/**
  Таблица продавцов
 */
CREATE TABLE customers
(
    id            serial   NOT NULL PRIMARY KEY,
    customer_name varchar  NOT NULL,
    gender        smallint not null,
    birth_date    int      NOT NULL
);

comment on column customers.gender is '0 – пол не указан, 1 - юноша, 2 - девушка.';
comment on column customers.birth_date is 'День рождения в Unix Time Stamp.';


/**
  Таблица связей 'Авторы-книги'
 */
CREATE TABLE authors_books
(
    id        serial NOT NULL PRIMARY KEY,
    author_id int    NOT NULL,
    book_id   int    NOT NULL,
    CONSTRAINT fk_author
        FOREIGN KEY (author_id)
            REFERENCES authors (id)
            ON DELETE CASCADE,
    CONSTRAINT fk_book
        FOREIGN KEY (book_id)
            REFERENCES books (id)
            ON DELETE CASCADE
);

/**
  Таблица связей 'Продавцы-книги'
 */
CREATE TABLE customers_books
(
    id          serial NOT NULL PRIMARY KEY,
    customer_id int    NOT NULL,
    book_id     int    NOT NULL,
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
            REFERENCES customers (id)
            ON DELETE CASCADE,
    CONSTRAINT fk_book
        FOREIGN KEY (book_id)
            REFERENCES books (id)
            ON DELETE CASCADE
);

insert into books(book_title, edition_date)
values ('Программирование в Postgresql', 1646051727);
insert into books(book_title, edition_date)
values ('MySql', 1646051830);

insert into authors(author_name, gender, birth_date)
values ('Петр Иванович', 1, 478427830);
insert into authors(author_name, gender, birth_date)
values ('Анастасия Юрьевна', 2, 478427850);

insert into customers(customer_name, gender, birth_date)
values ('Апрель Илларионович', 1, 478427830);
insert into customers(customer_name, gender, birth_date)
values ('Года Ивановна', 2, 478427850);

insert into customers(customer_name, gender, birth_date)
values ('Апрель Илларионович', 1, 478427830);
insert into customers(customer_name, gender, birth_date)
values ('Года Ивановна', 2, 478427850);

insert into authors_books(author_id, book_id)
values (1,2);
insert into authors_books(author_id, book_id)
values (2,2);
insert into authors_books(author_id, book_id)
values (2,1);
insert into customers_books(customer_id, book_id)
values (1,2);
insert into customers_books(customer_id, book_id)
values (2,2);
insert into customers_books(customer_id, book_id)
values (2,1);