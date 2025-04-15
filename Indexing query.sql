-- QUERY

-- all duration (ms) 
-- menampilkan title dan movie id yang memiliki genre id dan title id yang sama
SELECT title_genre.id, title.title FROM title
INNER JOIN title_genre ON title.id = title_genre.title_id
WHERE title_genre.title_id = title_genre.genre_id;
-- cek SEBELUM indexing duration = 3
-- cek SETELAH indexing duration = 2

-- menampilkan semua jenis genre yang ada dalam tabel movie dengan awalan H atau Comedy
SELECT DISTINCT genre.name FROM genre
INNER JOIN title_genre ON genre.id = title_genre.genre_id
WHERE genre.name LIKE 'H%' OR genre.name LIKE 'Comedy%'
ORDER BY genre.name;
-- cek SEBELUM indexing duration = 1
-- cek SETELAH indexing duration = 0

-- menampilkan title movie dengan genre id 789
SELECT title FROM title
INNER JOIN title_genre ON title.id = title_genre.title_id
WHERE title_genre.genre_id = 789;
-- cek SEBELUM indexing duration = 1
-- cek SETELAH indexing duration = 0 

-- menampilkan title movie yang memiliki awalan Space atau id '123'
SELECT title FROM title 
WHERE id = 100 OR title LIKE 'Space%';
-- cek SEBELUM indexing duration = 1
-- cek SETELAH indexing duration = 0

-- menampilkan title movie yang memiliki genre action
SELECT title_genre.id,title.title
FROM title_genre 
INNER JOIN title ON title_genre.title_id = title.id 
INNER JOIN genre ON title_genre.genre_id = genre.id
WHERE genre.name = 'Action';
-- cek SEBELUM indexing duration = 2
-- cek SETELAH indexing duration = 0

-- menampilkan title dan genre movie dengan id movie 1234 atau diatas 4500
SELECT title.title, genre.name
FROM title_genre 
INNER JOIN title ON title_genre.title_id = title.id 
INNER JOIN genre ON title_genre.genre_id = genre.id
WHERE title_genre.id > 4500 OR title_genre.id = 1234
ORDER BY title_genre.id;
-- cek SEBELUM indexing duration = 5
-- cek SETELAH indexing duration = 4

-- Cek banyak data
EXPLAIN
SELECT * FROM title_genre;
EXPLAIN
SELECT * FROM title;
EXPLAIN
SELECT * FROM genre;

SELECT * FROM title_genre;
SELECT * FROM title;
SELECT * FROM genre;

SELECT COUNT(*) FROM title_genre;
-- 5000 records
SELECT COUNT(*) FROM title;
-- 1000 records
SELECT COUNT(*) FROM genre;
-- 1000 records


-- SHOW INDEX
SHOW INDEXES FROM title_genre;
SHOW INDEXES FROM title;
SHOW INDEXES FROM genre;

-- INDEXING
CREATE INDEX idx_genre_name ON genre (name);
CREATE INDEX idx_title_title ON title (title);
CREATE INDEX idx_title_genre ON title_genre (title_id, genre_id);

DROP INDEX idx_title_genre ON title_genre;
DROP INDEX idx_title_title ON title ;
DROP INDEX idx_genre_name ON genre ;


