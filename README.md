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
    
## Импорт данных

Импорт данных на текущий момент предполагается в полуручном режиме: все предлагаемые команды можно запускать или вручную,
или добавить их в расписание планировщика задач (cron) для регулярного запуска.

Подробности -- в [data](data)




## Запуск REST API

