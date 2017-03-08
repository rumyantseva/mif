## Импорт данных

Загружаем данные о книгах издательства МИФ из публичных источников.

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