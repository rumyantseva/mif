[![Go Report Card](https://goreportcard.com/badge/github.com/rumyantseva/mif)](https://goreportcard.com/report/github.com/rumyantseva/mif)
[![Build Status](https://travis-ci.org/rumyantseva/mif.svg?branch=master)](https://travis-ci.org/rumyantseva/mif)
[![Contributions Welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/rumyantseva/mif/issues)

**Важно! Этот проект находится в архивном состоянии и не следует некоторым лучшим практикам, которые имеет смысл рассматривать при разаботке сервисов на Go.** Если вы хотите узнать побольше о лучших практиках написания сервисов на Go, пожалуйста, ознакомьтесь с докладом [Best Practices for Cloud Native Go Services](https://youtu.be/rRSkbOMTHLw) или другими подходящими источниками.

***

Этот репозиторий представляет собой реализацию неофициального REST API для книг издательства [«МИФ»](http://mann-ivanov-ferber.ru).

Всё написано на [Go](https://golang.org).

Текущая версия является пробной и нестабильной, в будущем возможны изменения, не являющиеся обратно совместимыми.
Если вы хотите застраховать себя от таких изменений, пожалуйста, используйте фиксированные [теги](https://github.com/rumyantseva/mif/releases).

Вклад в проект посредством создания issues и pull requests приветствуется 🤓

Документация:

- [Структура БД](#БД)
- [Импорт данных](#Импорт-данных)
- [Запуск сервера REST API](#Запуск-сервера)
- [Формат REST API](#Документация-по-методам)


# БД

Используется БД PostgreSQL.

При сборе данных выяснилось, что часть данных является неконситентной 
(например, некоторые книги относятся к несуществующим категориям). 
Поэтому некоторые внешние и уникальные ключи между таблицами на текущий момент не предполагаются.
При желании можно восстановить целостность данных и добавить внешние ключи.

## Структура данных

Можно воспользоваться готовым дампом из [db](db) или задать структуру базы данных, используя нижеследующее описание. В случае развертывания сервиса из Docker-образов (см. [инструкцию ниже](#Запуск-сервера)), дамп базы накатывается автоматически.

### База данных

    CREATE DATABASE mifbooks WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';
    
### Необходимые таблицы

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
      url VARCHAR(512) UNIQUE NOT NULL,
      created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
      updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
      is_visible BOOLEAN DEFAULT NULL
    );

    CREATE TABLE IF NOT EXISTS books_broken (
      id SERIAL PRIMARY KEY,
      url VARCHAR(512) UNIQUE NOT NULL,
      created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
      updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
    );
    
    CREATE TYPE volume_type AS ENUM ('paperbook', 'ebook', 'audiobook');
    CREATE TABLE IF NOT EXISTS volumes (
      id SERIAL PRIMARY KEY,
      book_id INTEGER NOT NULL REFERENCES books(id),
      type volume_type NOT NULL,
      created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
      updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
      
      UNIQUE (book_id, type)
    );
    
     CREATE TABLE IF NOT EXISTS users (
      id SERIAL PRIMARY KEY,
      email VARCHAR(128) UNIQUE NOT NULL,
      token VARCHAR(128) UNIQUE NOT NULL,
      created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
      updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL
     );
     
     CREATE TABLE IF NOT EXISTS library (
       id SERIAL PRIMARY KEY,
       user_id INTEGER NOT NULL REFERENCES users(id),
       volume_id INTEGER NOT NULL REFERENCES volumes(id),
       created_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       updated_at TIMESTAMP WITHOUT TIME ZONE NOT NULL,
       
       UNIQUE (user_id, volume_id)
     );
    
# Импорт данных

Импорт данных на текущий момент предполагается в полуручном режиме: все предлагаемые команды можно запускать или вручную,
или добавить их в расписание планировщика задач (cron) для регулярного запуска.

Подробности - в [data](data)

# Запуск сервера

## Пример запуска с помощью Docker'а

Самый простой способ поднять сервер с API.
В этом случае из [DockerHub](https://hub.docker.com/u/webdeva/)'а будут подтянуты уже существующие образы с БД и приложением. 

    docker-compose up
    
Запуск сервера занимает ~10-15 секунд (время раската дампа БД). После этого сразу можно делать запросы к API.
По умолчанию сервер слушает порт 80. Для проверки работоспособности можно попробовать запрос http://127.0.0.1/api/v1/books. Альтернативную конфигурацию можно задать в файле [docker-compose.yml](docker-compose.yml).

Для сборки и отправки образов используется скрипт [make.sh](make.sh), при желании его можно кастомизировать в своих целях. 

## Пример "сырого" запуска сервера API

В этом случае будет произведен запуск приложения с использованием `go run` (полезно для отладки).

    env HOST=127.0.0.1 PORT=80 \
    DB_HOST=localhost DB_PORT=5432 DB_USER=postgres DB_PASS=mysecretpassword DB=mifbooks \
    go run mif.go --debug
    
    
Параметры `host` и `port` отвечают за то, по какому адресу и порту слушать запросы.
Параметры с префиксом `db_` задают конфигурацию доступа к БД PostgreSQL: 
хост, порт, пользователь, пароль, название БД.

# Документация по методам

- [Книги издательства](#Все-книги-издательства)
  - [Список книг](#Список-книг)
  - [Конкретная книга](#Информация-о-книге)
- [Личная библиотека](#Личная-библиотека)
  - [Список книг](#Список-книг)
  - [Добавить книгу](#Добавить-книгу-в-свою-библиотеку)
  - [Удалить книгу](#Удалить-книгу-из-своей-библиотеки)

## Все книги издательства
### Список книг

`GET /api/v1/books` - получить список книг издательства.
В выдаче книги будут отсортированы по `id` в обратном порядке: от более новых к более старым.

__Опциональные параметры запроса:__

- `search` - поиск книги по части названия
- `author` - поиск книги по автору
- `mif_id` - поиск книги по идентификатору в МИФ
- `type` - тип "носителя" книги: `paperbook`, `ebook`, `audiobook`

- `limit` - "пагинация": кол-во записей на странице (по умолчанию 10)
- `offset` - "пагинация": сдвиг записей (по умолчанию 0)

__Пример запроса:__ 

    curl -X GET http://mif.grahovac.me/api/v1/books?search=маркетинг&limit=50


### Информация о книге 

`GET /api/v1/books/:id` - получить конкретную книгу по ее идентификатору в БД

__Пример запроса:__ 

    curl -X GET http://mif.grahovac.me/api/v1/books/33
   
## Личная библиотека

Запросы к личной библиотеке подразумевают аутентификацию пользователя.
Для аутентификации используется секретный токен, передаваемый через параметр запроса `token`.

В случае, если запрос предполагает наличие тела запроса, оно передается в формате JSON.

### Список книг

`GET /api/v1/library` - получить список книг, имеющихся в собственной библиотеке.
В выдаче книги будут отсортированы по `id` в обратном порядке: добавленные последними будут в начале выдачи.

__Обязательные параметры запроса:__

- `token` - уникальный токен пользователя для аутентификации

__Опциональные параметры запроса:__

- `limit` - "пагинация": кол-во записей на странице (по умолчанию 10)
- `offset` - "пагинация": сдвиг записей (по умолчанию 0)

__Пример запроса:__ 

    curl -X GET http://mif.grahovac.me/api/v1/library?token=6f9c1a78-36c7-4703-adb7-e0101e480c64&limit=50


### Добавить книгу в свою библиотеку

`POST /api/v1/library`

__Обязательные параметры запроса:__

- `token` - уникальный токен пользователя для аутентификации

__Обязательные параметры тела запроса:__

- `book_id` - идентификатор добавляемой книги
- `type` - "носитель" добавляемой книги: `paperbook`, `ebook`, `audiobook`

__Пример запроса:__ 

    curl -X POST http://mif.grahovac.me/api/v1/library?token=6f9c1a78-36c7-4703-adb7-e0101e480c64 \
    -H 'Content-Type: application/json' \
    -d '{"book_id": 33, "type": "paperbook"}'

### Удалить книгу из своей библиотеки

`DELETE /api/v1/library`

__Обязательные параметры запроса:__

- `token` - уникальный токен пользователя для аутентификации

__Обязательные параметры тела запроса:__

- `book_id` - идентификатор добавляемой книги
- `type` - "носитель" добавляемой книги: `paperbook`, `ebook`, `audiobook`.

__Пример запроса:__ 

    curl -X DELETE http://mif.grahovac.me/api/v1/library?token=6f9c1a78-36c7-4703-adb7-e0101e480c64 \
    -H 'Content-Type: application/json' \
    -d '{"book_id": 33, "type": "paperbook"}'


# Road map

- Тесты!
- Добавить клиента для API и консольное приложение для работы с ним
- Добавить swagger-документацию для API
- Рефакторинг кишков middleware (запросы к БД)
- Актуализировать Makefile набором полезных команд
- Поддержка HTTPS
- Запуск импорта данных по расписанию
- Утилита для управления пользователями
