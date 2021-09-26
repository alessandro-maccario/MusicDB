# DATABASE
DROP DATABASE IF EXISTS spotify;
CREATE DATABASE spotify;

USE spotify;

-- -----------------------------------------------------------------------------------------------------------

# TABLES
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

CREATE TABLE labels (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    id_artist INT UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    UNIQUE INDEX `name` (`name`),
    INDEX (`id_artist`),
    FOREIGN KEY (`id_artist`) REFERENCES `spotify`.`artists` (`id`) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------------------------------------------------------------
# INSERT DATA

# QUEEN
INSERT INTO artists (name) VALUES ('Queen');
SET @last_id_in_artists = LAST_INSERT_ID();

# QUEEN ALBUMS
INSERT INTO albums (title, id_artist, genre) VALUES ('The Game', @last_id_in_artists, 'Funk Rock');
# QUEEN SONGS
INSERT INTO songs (title, id_album, lenght) VALUES ('Play the Game', @last_id_in_artists, '0330');
INSERT INTO songs (title, id_album, lenght) VALUES ('Dragon Attack', @last_id_in_artists, '0419');
INSERT INTO songs (title, id_album, lenght) VALUES ('Another One Bites the Dust', @last_id_in_artists, '0334');
INSERT INTO songs (title, id_album, lenght) VALUES ('Need Your Loving Tonight ', @last_id_in_artists, '0249');
INSERT INTO songs (title, id_album, lenght) VALUES ('Crazy Little Thing Called Love', @last_id_in_artists, '0248');
INSERT INTO songs (title, id_album, lenght) VALUES ('Rock It', @last_id_in_artists, '0433');
INSERT INTO songs (title, id_album, lenght) VALUES ("Don't Try Suicide", @last_id_in_artists, '0352');
INSERT INTO songs (title, id_album, lenght) VALUES ("Sail Away Sweet Sister", @last_id_in_artists, '0333');
INSERT INTO songs (title, id_album, lenght) VALUES ("Coming Soon", @last_id_in_artists, '0251');
INSERT INTO songs (title, id_album, lenght) VALUES ("Save Me", @last_id_in_artists, '0349');
# QUEEN LABELS
INSERT INTO labels (name, id_artist) VALUES ('EMI/Elektra', @last_id_in_artists);

-- -----------------------------------------------------------------------------------------------------------
# AC/DC
INSERT INTO artists (name) VALUES ('AC/DC');
SET @last_id_in_artists = LAST_INSERT_ID();

# QUEEN ALBUMS
INSERT INTO albums (title, id_artist, genre) VALUES ('The Razors Edge', @last_id_in_artists, 'Hard Rock');
# AC/DC SONGS
INSERT INTO songs (title, id_album, lenght) VALUES ('Thunderstruck', @last_id_in_artists, '0452');

-- -----------------------------------------------------------------------------------------------------------
# KISS
INSERT INTO artists (name) VALUES ('Kiss');
SET @last_id_in_artists = LAST_INSERT_ID();

# QUEEN ALBUMS
INSERT INTO albums (title, id_artist, genre) VALUES ('Dinasty', @last_id_in_artists, 'Hard/Dance Rock');
# KISS SONGS
INSERT INTO songs (title, id_album, lenght) VALUES ("I Was Made for Lovin' You", @last_id_in_artists, '0401');

-- -----------------------------------------------------------------------------------------------------------
# DIRE STRAITS
INSERT INTO artists (name) VALUES ('DIRE STRAITS');
SET @last_id_in_artists = LAST_INSERT_ID();

# DIRE STRAITS ALBUMS
INSERT INTO albums (title, id_artist, genre) VALUES ('Brothers in Arms', @last_id_in_artists, 'Rock');
# DIRE STRAITS SONGS
INSERT INTO songs (title, id_album, lenght) VALUES ("Walk of Life", @last_id_in_artists, '0412');

-- -----------------------------------------------------------------------------------------------------------