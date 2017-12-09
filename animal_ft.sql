#フォルダごとC直下に配置した上で、下の命令を実行
#\. c:\animal_db\animal_ft.sql
DROP DATABASE animal_ft;
CREATE DATABASE animal_ft;
USE animal_ft;
CREATE TABLE details(
	60id INT,
	sex CHAR(1),
	detail TEXT,
	lover_12id INT,
	lover_detail TEXT,
	friend_12id INT,
	friend_detail TEXT,
	work_12id INT,
	work_detail text
);
CREATE TABLE 60animals(
	60id INT PRIMARY KEY,
	name VARCHAR(30),
	12id int
);
CREATE TABLE 12animals(
	12id INT PRIMARY KEY,
	name char(10),
	picture char(20)
);
#テーブルへのデータインポート（details）
LOAD DATA INFILE 'C:\\animal_db\\details.csv'
	INTO TABLE details
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\r\n'
;
#テーブルへのデータインポート（60animals）
LOAD DATA INFILE 'C:\\animal_db\\60animals.csv'
	INTO TABLE 60animals
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\r\n'
;
#テーブルへのデータインポート（12animals）
LOAD DATA INFILE 'C:\\animal_db\\12animals.csv'
	INTO TABLE 12animals
	FIELDS TERMINATED BY ','
	LINES TERMINATED BY '\r\n'
;



