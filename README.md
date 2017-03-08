# mif

Неофициальное REST API для книг издательства [МИФ](http://mann-ivanov-ferber.ru).


## БД

Используется БД PostgreSQL.


При сборе данных выяснилось, что часть данных является неконситентной 
(например, некоторые книги относятся к несуществующим категориям). 
Поэтому некоторые внешние и уникальные ключи между таблицами на текущий момент не предполагаются.
При желании можно восстановить целостность данных и добавить внешние ключи.

### Структура данных

#### База данных

    createdb  mifbooks --encoding='utf-8' --locale=en_US.utf8 --template=template0;
    
#### Необходимые таблицы

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
    
## Импорт данных

Импорт данных на текущий момент предполагается в полуручном режиме: все предлагаемые команды можно запускать или вручную,
или добавить их в расписание планировщика задач (cron) для регулярного запуска.

Подробности -- в [data](data)




## Запуск REST API

