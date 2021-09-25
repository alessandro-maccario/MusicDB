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
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_artist INT UNSIGNED NOT NULL,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50) NOT NULL,
	PRIMARY KEY (id),
    UNIQUE INDEX `title` (`title`),
    INDEX (`id_artist`),
    FOREIGN KEY (`id_artist`) REFERENCES `spotify`.`artists`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

CREATE TABLE songs (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_album INT UNSIGNED NOT NULL,
    title VARCHAR(100) NOT NULL,
    lenght TIME(0) NOT NULL,
	PRIMARY KEY (id),
    UNIQUE INDEX `title` (`title`),
    INDEX (`id_album`),
    FOREIGN KEY (`id_album`) REFERENCES `spotify`.`albums`(`id`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

# INSERT DATA
-- -----------------------------------------------------------------------------------------------------------
# QUEEN
INSERT INTO artists (name) VALUES ('Queen');
SET @last_id_in_artists = LAST_INSERT_ID();
INSERT INTO albums (title, id_artist, genre) VALUES ('The Game', @last_id_in_artists, 'Funk Rock');
# QUEEN SONGS
INSERT INTO songs (title, id_album, lenght) VALUES ('Another One Bites the Dust', @last_id_in_artists, '0334');
-- -----------------------------------------------------------------------------------------------------------
# AC/DC
INSERT INTO artists (name) VALUES ('AC/DC');
SET @last_id_in_artists = LAST_INSERT_ID();
INSERT INTO albums (title, id_artist, genre) VALUES ('The Razors Edge', @last_id_in_artists, 'Hard Rock');
# AC/DC SONGS
INSERT INTO songs (title, id_album, lenght) VALUES ('Thunderstruck', @last_id_in_artists, '0452');

-- -----------------------------------------------------------------------------------------------------------