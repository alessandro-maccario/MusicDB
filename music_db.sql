DROP DATABASE IF EXISTS spotify;
CREATE DATABASE spotify;

USE spotify;

CREATE TABLE artists (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
	PRIMARY KEY(id),
    UNIQUE INDEX `name` (`name`)
) ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

CREATE TABLE albums (
	id_album INT UNSIGNED NOT NULL AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    id_artist INT UNSIGNED NOT NULL,
    genre VARCHAR(50) NOT NULL,
	PRIMARY KEY (id_album),
    UNIQUE INDEX `title` (`title`),
    INDEX (`id_artist`),
    FOREIGN KEY (`id_artist`) REFERENCES `spotify`.`artists`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


INSERT INTO artists (name) VALUES ('Queen');
SET @last_id_in_artists = LAST_INSERT_ID();
INSERT INTO albums (title, id_artist, genre) VALUES ('The Game', @last_id_in_artists, 'Funk Rock');
INSERT INTO albums (title, id_artist, genre) VALUES ('TEST_1', @last_id_in_artists, 'Funk Rock');
INSERT INTO albums (title, id_artist, genre) VALUES ('TEST_2', @last_id_in_artists, 'Funk Rock');