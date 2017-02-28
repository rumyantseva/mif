# mif



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
    
    
## 404 pages

    update books 
    set mif_id = 7394,
    category_id = 15,
    title = 'Технологии, которые изменят мир',
    authors = 'Мартин Форд',
    isbn = '978-5-91657-902-4'
    where url='http://www.mann-ivanov-ferber.ru/books/paperbook/the-lights-in-the-tunnel/'