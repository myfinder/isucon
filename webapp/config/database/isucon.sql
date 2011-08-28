CREATE DATABASE IF NOT EXISTS isucon DEFAULT CHARACTER SET 'utf8';

CREATE USER 'isuconapp'@'%' IDENTIFIED BY 'isunageruna';
GRANT ALL ON isucon.* TO 'isuconapp'@'%';
CREATE USER 'isuconapp'@'localhost' IDENTIFIED BY 'isunageruna';
GRANT ALL ON isucon.* TO 'isuconapp'@'localhost';

FLUSH PRIVILEGES;

CREATE TABLE IF NOT EXISTS isucon.article (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128) NOT NULL,
  body  VARCHAR(4096) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  comment_created_at DATETIME DEFAULT NULL,
  KEY article_comment_idx (id,title,comment_created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE IF NOT EXISTS isucon.comment (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  article INT NOT NULL,
  name VARCHAR(64),
  body VARCHAR(1024) NOT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY article (article,id),
  KEY article_2 (article,created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

