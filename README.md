# mif

Неофициальное REST API для книг издательства [МИФ](http://mann-ivanov-ferber.ru).


## БД

Используется БД PostgreSQL.


    createdb  mifbooks --encoding='utf-8' --locale=en_US.utf8 --template=template0;
    
    
    CREATE TABLE IF NOT EXISTS categories (
      id SERIAL PRIMARY KEY,
      title VARCHAR(256) NOT NULL,
      created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
      updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
    );
    
    CREATE TABLE IF NOT EXISTS books (
      id SERIAL PRIMARY KEY,
      mif_id INTEGER,
      category_id INTEGER,
      title VARCHAR(512),
      isbn VARCHAR(64),
      authors VARCHAR(512),
      url VARCHAR(512) NOT NULL,
      created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
      updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
    );
    
    CREATE TABLE IF NOT EXISTS volumes (
      id SERIAL PRIMARY KEY,
      book_id INTEGER NOT NULL,
      type VARCHAR(32) NOT NULL,
      created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
      updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
    );
    
## 404 pages

    update books 
    set mif_id = 7394,
    category_id = 15,
    title = 'Технологии, которые изменят мир',
    authors = 'Мартин Форд',
    isbn = '978-5-91657-902-4'
    where url='http://www.mann-ivanov-ferber.ru/books/paperbook/the-lights-in-the-tunnel/'

## Импорт данных

Импорт данных на текущий момент предполагается в полуручном режиме: все предлагаемые команды можно запускать или вручную,
или добавить их в расписание планировщика задач (cron) для регулярного запуска.

### Шаг 1. Импорт из Яндекс.Маркета

__Директория:__ `import`.

__Команда:__ `go run import.go`

__Что делает:__ загружает каталог МИФ для Яндекс.Маркета и парсит информацию из него в файлы `import/categories.csv` и `import/books.csv`
с категориями и данными о продаваемых книгах. 

В директории `import` также есть файл `mif-catalog.xml`, он нужен 
только для примера того, в каком формате отдаются данные из каталога.


### Шаг 2. Поиск ссылок на сайте МИФ

__Директория:__ `link-list`.

__Команда:__ `go run parse.go`.

__Что делает:__ запрашивает каталог на сайте МИФа в поисках ссылок на книги. 
Сохраняет в файле `link-list/links.txt` список найденных ссылок.

В директории `link-list` также есть файл `links_white.txt`, он содержит список ссылок на первые книги из "Белой серии" МИФа.

### Шаг 3. Сохраняем категории

__Директория:__ `save`.

__Команда:__ `go run categories.go`

__Что делает:__ берет из файла `import/categories.csv` категории и сохраняет их в БД.
Если категория с таким ID уже существует, она будет обновлена в БД

### Шаг 4. Сохраняем книги из маркета

__Директория:__ `save`.

__Команда:__ `go run books.go`

__Что делает:__ берет из файла `import/books.csv` книги и сохраняет их в БД.
Если книга с таким URL уже существует, она будет обновлена в БД

### Шаг 5. Сохраняем URL'ы, которые насобирали


### Шаг 6. Загружаем книги для собранных URL'ов


### Шаг 7. Загружаем информацию о форматах книг

Сохраняем информацию о том, в каких форматах (бумага, электронный, аудио) представлена книга.

Директория: `update`.

Команда: `go run volumes.go`

### Шаг 8. Загружаем дополнительную информацию о книгах

Сохраняем ISBN, дату выхода и количество страниц.



## Запуск REST API

