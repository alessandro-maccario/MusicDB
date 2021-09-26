![james-barker-v3-zcCWMjgM-unsplash](https://images.unsplash.com/photo-1511389290465-d11bafd4c1df?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1470&q=80)
Photo by Liana Mikah on Unsplash

# Music Database

This is an experiment to improve my knowledge of MySQL by creating a Music Database from scratch.
The *music_db.sql* contains all the code to create the database, all the tables and to insert all the rows.
The database contains (WIP) the following tables:
- Artists
- Albums
- Songs
- Labels

## Example query
Get all the artists that are included into a specific genre with the word *Hard* (like *Hard Rock*):

1.
```
SELECT artists.name, albums.genre
FROM albums
JOIN artists ON artists.id = albums.id_artist
WHERE genre LIKE '%Hard%';
```

2.
```
SELECT T1.title AS Album_name, T3.name AS Band, T2.title AS Song_title
FROM albums AS T1
INNER JOIN songs AS T2 ON T1.id = T2.id_album
INNER JOIN artists AS T3 ON T1.id_artist = T3.id
WHERE T3.name = 'Queen';
```

