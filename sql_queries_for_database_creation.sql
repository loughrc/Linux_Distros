/* Linux Distros Database Creation

The data origin is https://distrowatch.com
This data is used to populate the Distros and Desktop_Environments tables
The Computers table is populated with data about my own computers,
and has two columns that are foreign keys referencing the primary keys of each of the other two tables.

*/

CREATE DATABASE linux_distros;


USE linux_distros;

-- Create tables

DROP TABLE IF EXISTS Desktop_Environments;
CREATE TABLE Desktop_Environments (
d_env_id INT,
d_env_name VARCHAR(20),
PRIMARY KEY(d_env_id)
);


DROP TABLE IF EXISTS Distros;
CREATE TABLE Distros (
distro_id INT,
distro_name VARCHAR(20),
based_on_id INT,
default_d_env INT,
origin VARCHAR(30),
dw_score INT,
dw_rating FLOAT,
num_reviews INT,
last_updated DATE,
PRIMARY KEY(distro_id),
FOREIGN KEY(default_d_env) REFERENCES Desktop_Environments(d_env_id) ON DELETE SET NULL
);


DROP TABLE IF EXISTS Computers;
CREATE TABLE Computers (
make VARCHAR(20),
model VARCHAR(30),
model_id INT,
architecture VARCHAR(10),
ram VARCHAR(10),
ram_type VARCHAR(15),
processor_type VARCHAR(20),
num_cores INT,
processor_speed VARCHAR(10),
ssd VARCHAR(5),
current_distro_id INT,
current_d_env_id INT,
PRIMARY KEY(model_id),
FOREIGN KEY(current_distro_id) REFERENCES Distros(distro_id) ON DELETE SET NULL,
FOREIGN KEY(current_d_env_id) REFERENCES Desktop_Environments(d_env_id) ON DELETE SET NULL
);

-- Populate tables

INSERT INTO Desktop_Environments VALUES(200, 'GNOME');
INSERT INTO Desktop_Environments VALUES(201, 'KDE Plasma');
INSERT INTO Desktop_Environments VALUES(202, 'Trinity');
INSERT INTO Desktop_Environments VALUES(203, 'XFCE');
INSERT INTO Desktop_Environments VALUES(204, 'LXDE');
INSERT INTO Desktop_Environments VALUES(205, 'LXQt');
INSERT INTO Desktop_Environments VALUES(206, 'Budgie');
INSERT INTO Desktop_Environments VALUES(207, 'Cinnamon');
INSERT INTO Desktop_Environments VALUES(208, 'ROX-Ice');
INSERT INTO Desktop_Environments VALUES(209, 'Pantheon');
INSERT INTO Desktop_Environments VALUES(210, 'MATE');
INSERT INTO Desktop_Environments VALUES(211, 'DDE');
INSERT INTO Desktop_Environments VALUES(212, 'JWM');



INSERT INTO Distros VALUES(100, 'Arch Linux', NULL, NULL, 'Canada', 612, 9.4, 309, '2021-07-14');
INSERT INTO Distros VALUES(101,	'Debian', NULL, 200, 'Global', 1218, 8.8, 547, '2021-07-14');
INSERT INTO Distros VALUES(102,	'Ubuntu', 101, 200, 'Isle of Man', 1318, 7.5, 465, '2021-07-14');
INSERT INTO Distros VALUES(103,	'ElementaryOS',	101, 209, 'USA', 1114, 7.2, 278, '2021-06-18');
INSERT INTO Distros VALUES(104, 'Q4OS', 101, 201, 'Germany', 365, 8.6, 180, '2021-06-29');
INSERT INTO Distros VALUES(105,	'Linux Mint', 102, 207, 'Ireland', 2062, 8.7, 1117, '2021-07-09');
INSERT INTO Distros VALUES(106,	'PopOS', 102, 200, 'USA', 1782, 8.4, 385, '2021-06-30');
INSERT INTO Distros VALUES(107,	'EndeavourOS', 100, 203, 'Netherlands', 1924, 8.9, 176, '2021-04-18');
INSERT INTO Distros VALUES(108,	'Fedora', NULL,	200, 'USA', 1002, 8.3, 427, '2021-07-14');
INSERT INTO Distros VALUES(109,	'AntiX', 101, 208, 'Greece', 539, 8.4, 193, '2021-06-11');
INSERT INTO Distros VALUES(110,	'MX Linux', 101, 203, 'Greece', 3167, 8.7, 1293, '2021-04-07');
INSERT INTO Distros VALUES(111,	'Kubuntu', 102,	201, 'Isle of Man', 310, 8.9, 228, '2021-04-23');
INSERT INTO Distros VALUES(112,	'Xubuntu', 102,	203, 'Isle of Man', 283, 8.5, 169, '2021-04-23');
INSERT INTO Distros VALUES(113,	'Lubuntu', 102,	205, 'France', 330, 8.2, 195, '2021-04-23');
INSERT INTO Distros VALUES(114,	'Linux Lite', 102, 203, 'New Zealand', 380, 8.8, 213, '2021-04-01');
INSERT INTO Distros VALUES(115,	'Solus', NULL, 206, 'Ireland', 700, 8.4, 466, '2021-07-14');
INSERT INTO Distros VALUES(116,	'Garuda Linux',	100, 201, 'India', 921, 8.5, 124, '2021-07-06');
INSERT INTO Distros VALUES(117,	'Peppermint OS', 113, 204, 'UK', 282, 9.1, 205, '2019-12-18');
INSERT INTO Distros VALUES(118,	'Manjaro',	100, 203, 'France', 2345, 8.4, 1050, '2021-07-14');
INSERT INTO Distros VALUES(119,	'Ubuntu Studio', 102, 201, 'USA', 165, 8.4, 23, '2021-04-22');
INSERT INTO Distros VALUES(120,	'Ubuntu MATE', 102,	210, 'UK', 224, 8.6, 189, '2021-04-23');
INSERT INTO Distros VALUES(121,	'Ubuntu Budgie', 102, 206, 'UK', 144, 8.2, 66, '2021-04-23');
INSERT INTO Distros VALUES(122,	'OpenSUSE', NULL, 201, 'Germany', 885, 9, 475, '2021-07-14');
INSERT INTO Distros VALUES(123,	'Deepin', 101, 211,	'China', 548, 8.7, 471, '2021-07-11');																
INSERT INTO Distros VALUES(124,	'KDE Neon',	102, 201, 'UK',	725, 8.9, 313, '2021-07-14');																
INSERT INTO Distros VALUES(125,	'Puppy Linux', NULL, 212, 'Australia', 478, 9, 156, '2020-09-22');					
INSERT INTO Distros VALUES(126,	'Mageia', NULL, 201, 'France', 456, 8.5, 182, '2021-07-14');	
INSERT INTO Distros VALUES(127,	'PCLinuxOS', NULL, 201,	'USA', 467, 8.6, 170, '2021-07-14');	
INSERT INTO Distros VALUES(128,	'Zorin OS',	102, 200, 'Ireland', 670, 8.5, 286, '2021-04-20');		


INSERT INTO Computers VALUES('Dell', 'Inspiron 5577', 300, 'x86-64','8GB', 'DDR4',	'Intel Core i7-7700HQ',	4, '2.80GHz', 'yes', 120, 210);
INSERT INTO Computers VALUES('Dell', 'Vostro 260', 301,	'x86-64', '6GB', 'DDR3', 'Intel Core i5-2400', 4, '3.40GHz', 'yes', 118, 201);
INSERT INTO Computers VALUES('HP', 'Pavilion g6', 302,	'x86-64', '4GB', 'DDR3', 'AMD E2-3000 APU', 2, '1.65GHz', 'yes', 117, 204);
INSERT INTO Computers VALUES('HP', '255 g2', 303,	'x86-64',	'4GB', 'DDR3', 'AMD A4-5000 APU', 4, '1.50GHz',	'no', 104, 202);
INSERT INTO Computers VALUES('Raspberry Pi', '4 Model B', 304, 'armv8', '4GB', 'Mobile DDR4', 'Cortex A72 (ARM v8)', 4, '1.50GHz', 'yes', 121, 206);
INSERT INTO Computers VALUES('Ultra Computers',	'Unknown', 305,	'i686', '0.75GB', 'DDR2', 'Intel Pentium 4', 1, '2.40GHz', 'no', 104, 202);