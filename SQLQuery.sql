
/*

CREATE DATABASE [������ ��������]
GO

USE [������ ��������]
GO

DROP TABLE [�����_�����]
DROP TABLE [������_������]
DROP TABLE [����������� ������]
DROP TABLE [������� ������]
DROP TABLE [������ ������]
DROP TABLE [�������]
DROP TABLE [̳���]
DROP TABLE [�����]
GO

*/

CREATE TABLE [�����]
(
	[ID �����] INT IDENTITY(10000,1),
	[����� �����] NVARCHAR(30) UNIQUE NOT NULL,

	PRIMARY KEY ([ID �����])
)
GO

CREATE TABLE [̳���]
(
	[ID ����] INT IDENTITY(10000,1),
	[����� ����] NVARCHAR(30) UNIQUE NOT NULL,
	[ID �����] INT NOT NULL,

	PRIMARY KEY ([ID ����]),
	CONSTRAINT FK_̳���_To_����� FOREIGN KEY([ID �����])
			REFERENCES [�����] ([ID �����]) ON DELETE CASCADE
)
GO

CREATE TABLE [�������]
(
	[ID �������] INT IDENTITY(10000,1),
	[ϲ�] NVARCHAR(50) NOT NULL,
	[���� ����������] DATE NOT NULL,
	[Email] NVARCHAR(50) UNIQUE NOT NULL,
	[ID �����] INT NOT NULL,
	[ID ����] INT,
	
	PRIMARY KEY ([ID �������]),
	CONSTRAINT FK_�������_To_̳��� FOREIGN KEY([ID ����])
			REFERENCES [̳���] ([ID ����]) ON DELETE CASCADE,
	CONSTRAINT FK_�������_To_����� FOREIGN KEY([ID �����])
			REFERENCES [�����] ([ID �����]) ON DELETE NO ACTION
)
GO

CREATE TABLE [������ ������]
(
	[ID ������] INT IDENTITY(10000,1),
	[����� ������] NVARCHAR(50) UNIQUE NOT NULL,
	
	PRIMARY KEY ([ID ������])
)
GO

CREATE TABLE [������� ������]
(
	[ID �����] INT IDENTITY(10000,1),
	[����� ������] NVARCHAR(100) UNIQUE NOT NULL,
	[ID ������] INT NOT NULL,
	[���� �������] DATE NOT NULL,
	[���� ����] DATE NOT NULL,
	
	PRIMARY KEY ([ID �����])
)
GO

CREATE TABLE [����������� ������]
(
	[ID �������] INT NOT NULL,
	[ID ������] INT NOT NULL,
	
	PRIMARY KEY ([ID �������],[ID ������]),
	CONSTRAINT FK_�����������_������_To_������� FOREIGN KEY([ID �������])
			REFERENCES [�������] ([ID �������]) ON DELETE CASCADE,
	CONSTRAINT FK_�����������_������_To_������ FOREIGN KEY([ID ������])
			REFERENCES [������ ������] ([ID ������]) ON DELETE CASCADE,
)
GO

CREATE TABLE [������_������]
(
	[ID ������] INT NOT NULL,
	[ID �����] INT NOT NULL,
	
	PRIMARY KEY ([ID ������],[ID �����]),
	CONSTRAINT FK_������_������_To_������ FOREIGN KEY([ID ������])
			REFERENCES [������ ������] ([ID ������]) ON DELETE CASCADE,
	CONSTRAINT FK_������_������_To_������ FOREIGN KEY([ID �����])
			REFERENCES [������� ������] ([ID �����]) ON DELETE CASCADE,
)
GO

CREATE TABLE [�����_�����]
(
	[ID �����] INT NOT NULL,
	[ID �����] INT NOT NULL,
	
	PRIMARY KEY ([ID �����],[ID �����]),
	CONSTRAINT FK_�����_�����_To_����� FOREIGN KEY([ID �����])
			REFERENCES [�����] ([ID �����]) ON DELETE CASCADE,
	CONSTRAINT FK_�����_�����_To_����� FOREIGN KEY([ID �����])
			REFERENCES [������� ������] ([ID �����]) ON DELETE CASCADE,
)
GO

INSERT INTO [�����]
	VALUES	('������'),
			('������'),
			('�����'),
			('�����'),
			('�����'),
			('���'),
			('ͳ�������'),
			('�������'),
			('�������'),
			('������'),
			('����������'),
			('������'),
			('���������'),
			('�����'),
			('������'),
			('ϳ������ �����'),
			('����'),
			('�������'),
			('������'),
			('�������'),
			('�������'),
			('���� �������'),
			('��������'),
			('���������');
GO

INSERT INTO [̳���]
	VALUES	('ѳ����',			10022),
			('��������',		10022),
			('�������',			10022),
			('����',			10009),
			('���������',		10009),
			('˳��',			10009),
			('����',			10009),
			('�����',			10009),
			('�������',		10017),
			('г�-��-�������',	10017),
			('���-�����',		10017),
			('���-˳��',		10017),
			('����������',		10004),
			('�����',			10004),
			('�������',			10004),
			('�����',			10016),
			('����',			10016),
			('�������',			10016),
			('����`���',		10020),
			('���������',		10020),
			('�������������',	10020),
			('������',			10008),
			('���������',		10008),
			('�������',			10008),
			('����������',		10012),
			('������',			10012),
			('�������',			10012),
			('�������',			10011),
			('������',			10011),
			('��������',		10011),
			('����',			10013),
			('������',			10013),
			('�������',			10013),
			('����',			10002),
			('���쳺��',		10002),
			('�������',			10002),
			('³�����',			10003),
			('������',			10003),
			('��������',		10003),
			('�����',			10006),
			('�������',			10006),
			('³�������������',	10006),
			('������',			10021),
			('��������',		10021),
			('�������',			10021),
			('����',			10019),
			('������',			10019),
			('������',			10019),
			('����',			10015),
			('�����',			10015),
			('�����',			10015),
			('�������',			10001),
			('������',			10001),
			('�����',			10001),
			('˳������',		10023),
			('�����',			10023),
			('����',			10023),
			('����������',		10010),
			('������',			10010),
			('�������',			10010),
			('���-����',		10005),
			('���-���������',	10005),
			('���-��������',	10005),
			('���',			10000),
			('������',			10000),
			('������',			10000),
			('�������',			10007),
			('˳��',			10007),
			('������',			10007),
			('���������',		10018),
			('���������',		10018),
			('����',			10018),
			('����',			10014),
			('ʳ���',			10014),
			('ճ������',		10014);
GO

INSERT INTO [�������]
	VALUES	('�������� ������� ��������',		'04.04.2000','exempl1@gmail.com',10023,10056),
			('����� ������ �������������',		'22.12.1968','exempl2@gmail.com',10022,10002),
			('������ ���������� �������',		'08.11.2000','exempl3@gmail.com',10021,10044),
			('������ ³���� ³��������',		'13.04.2001','exempl4@gmail.com',10020,10018),
			('������� �������� ������������',	'04.04.1955','exempl5@gmail.com',10019,10046),
			('����������� ����� ���������',	'24.10.1988','exempl6@gmail.com',10018,10071),
			('������� ����� ��������',			'29.10.1975','exempl7@gmail.com',10017,10008),
			('����� ������ �����������',		'18.12.2003','exempl8@gmail.com',10016,10016),
			('��������� ���� �����䳿���',		'25.03.1987','exempl9@gmail.com',10015,10050),
			('��������� ���� ������������',	'19.06.2002','exempl10@gmail.com',10014,10074),
			('������ �������� �������������',	'28.04.1981','exempl11@gmail.com',10013,10031),
			('����� ����� ����������',			'03.10.2000','exempl12@gmail.com',10012,10026),
			('ͺ���� ����� ���������',			'18.11.1972','exempl13@gmail.com',10011,10029),
			('������ ������ ��������',			'24.11.1998','exempl14@gmail.com',10010,10059),
			('���� ������� �����������',		'25.08.1966','exempl15@gmail.com',10009,10006),
			('������ ������ ����������',		'07.08.2001','exempl16@gmail.com',10008,10023),
			('����`�� ³����� ���������',		'24.04.1983','exempl17@gmail.com',10007,10066),
			('�������� ������ ����������',		'16.10.2002','exempl18@gmail.com',10006,10039),
			('������ ³����� ������������',	'12.09.1955','exempl19@gmail.com',10005,10061),
			('������� ���� ³��������',		'08.07.2003','exempl20@gmail.com',10004,10013),
			('�������� ����� �����������',		'23.06.1988','exempl21@gmail.com',10003,10037),
			('��������� ������ ������������',	'17.11.1994','exempl22@gmail.com',10002,10034),
			('������ ³���� �������',			'13.11.1998','exempl23@gmail.com',10001,10051),
			('������� ������ ���������',		'06.02.1961','exempl24@gmail.com',10000,10065),
			('��������� ���� ������������',	'01.01.2001','exempl25@gmail.com',10015,10048);
GO

INSERT INTO [������ ������]
	VALUES	('�������� �� ����`�����'),
			('���������, �� � �����������'),
			('������ ��� �������'),
			('������ ��� ����'),
			('����������� �� ����������'),
			('���������� �� ������'),
			('����, ��� � �����'),
			('����� � ����������'),
			('����, ������ �� ��������'),
			('����� �� ������`�'),
			('������ ������'),
			('���������'),
			('����, �����, �����'),
			('���������� ���� �� ��������'),
			('������ ��� ������ �� �������');
GO

INSERT INTO [������� ������]
	VALUES	('������� Acer Aspire 7 A715-42G-R8BL (NH.QDLEU.008) Charcoal Black',			10000,'04.01.2022','24.01.2022'),
			('������� ASUS TUF Gaming F15 FX506LH-HN236 (90NR03U2-M006F0) Bonfire Black',	10000,'16.10.2022','30.11.2022'),
			('������� Lenovo IdeaPad 3 15ALC6 (82KU01C4RA) Arctic Grey',					10000,'22.03.2022','30.04.2022'),
			('�������� ������� Samsung Galaxy M32 6/128 GB Light Blue (SM-M325FLBGSEK)',	10001,'27.06.2022','25.02.2022'),
			('�������� Samsung UE50AU7100UXUA',											10001,'19.01.2022','01.08.2022'),
			('��������� Defunc True Music TWS Black (D4271M)',								10001,'14.12.2022','15.01.2023'),
			('������ ��������� PS5 PlayStation 5 (PS5/RAT/SACK)',							10002,'08.06.2022','30.07.2022'),
			('��������� ������� Hator Starfall Outemu Red (HTK-608)',						10002,'24.11.2022','15.12.2022'),
			('����������� ������� PlayStation Dualshock 4 v2 Black ��� PS4',				10002,'24.10.2022','14.11.2022'),
			('��������� RZTK CVT 2520HP',													10003,'06.06.2022','13.07.2022'),
			('����������� BOSCH KGN39VL316',												10003,'02.06.2022','28.08.2022'),
			('̳����������� �� Candy CMW20TNMB',											10003,'18.08.2022','01.09.2022'),
			('���� �� ����-���� �����-�� ����� ���䳺�� 400�260 ѳ��� (ROZ6400068415)',	10004,'14.10.2022','24.12.2022'),
			('��������� Tefal Simply Clean 12 �� (B5670053)',								10004,'28.11.2022','17.12.2022'),
			('������������� ArtiFlame Colorado HC-23 �`���� ����� (COLORADO HC-23 WB)',	10004,'05.09.2022','05.10.2022'),
			('³������������ Aspiring MAXI 4 SPEEDCAM, WIFI, GPS, 4K (MA1050WSPC)',		10005,'11.07.2022','30.07.2022'),
			('������������ ���������� Bosch 60Ah �� (-/+) S4005 (540EN) (0 092 S40 050)',	10005,'10.11.2022','10.12.2022'),
			('������� ����� Mobil 1 ESP 5W-30 4 �',											10005,'04.05.2022','04.06.2022'),
			('����� �������� CERSANIT VIRGO 170',											10006,'17.08.2022','17.09.2022'),
			('������� �������� STEINBERG Serie 199 1991600',								10006,'09.11.2022','29.11.2022'),
			('������� �������� Roda 22 R 500 x 1000 �����',								10006,'03.07.2022','13.07.2022'),
			('����������� RZTK BL 600E',													10007,'27.02.2022','27.04.2022'),
			('����������� ������������� RZTK 16A',											10007,'15.10.2022','10.11.2022'),
			('����� Verto ����� ������� 20 � 3/4" (15G823)',								10007,'12.10.2022','05.11.2022'),
			('�������������� Segway Ninebot F40E Black (AA.00.0010.78)',					10008,'28.11.2022','07.12.2022'),
			('��������� CORRADO Piemont DB 26" 21" 2019 ����-����� (0307-�-21)',			10008,'15.08.2022','30.08.2022'),
			('������ ������ EnergyFIT EF-JC',												10008,'18.05.2022','18.08.2022'),
			('������� Under Armour UA CGI Down Jkt 1375442-100 L ����� (195253568114)',		10009,'03.12.2022','30.12.2022'),
			('�������� Prime Shoes 16-659-30110 45 29.5 �� ����� (2000000164830)',			10009,'16.12.2022','30.12.2022'),
			('�������� ����������� Rough Radical Rock S ������ �� ����� ����',				10009,'23.11.2022','23.12.2022'),
			('���� ��� ������� Doliva (Olivenol) �������� Light 50 �� (4016369527696)',		10010,'18.03.2022','28.03.2022'),
			('��������� ���� Enough Collagen Moisture Foundation SPF 15 #21 100 ��',		10010,'15.07.2022','15.08.2022'),
			('�������� ���� ��� ���� Dolce & Gabbana L`Imperatrice 100 ��',				10010,'08.01.2022','08.03.2022'),
			('������ Barbie Cutie Reveal ����� ������ (HHG19)',								10011,'20.05.2022','20.07.2022'),
			('����������� LEGO DOTS �������� �������� DOTS � ������ 4 105 �������',		10011,'15.11.2022','15.12.2022'),
			('��� �������� Hasbro �������� ������ ��� �������� - ��������� �����',		10011,'13.10.2022','13.11.2022'),
			('����� ���� ��� ���� Purina Pro Plan Original Adult 1+ � ������ 1.5 ��',		10012,'18.07.2022','18.09.2022'),
			('����� ���� ��� ����� Purina Pro Plan Dog Large Adult Robust � ������ 14 ��',	10012,'05.04.2022','05.06.2022'),
			('���� ��� �������� ����� Versele-Laga Prestige Cockatiels ������� ���� 1 ��',	10012,'12.12.2022','30.12.2022'),
			('������ ��������� Kite ��� ������� 35x26x13.5 �� 12 � Studio Pets',			10013,'28.11.2022','28.12.2022'),
			('������� ��� ������ ��������� ��� Kite 48 �������',							10013,'26.08.2022','26.09.2022'),
			('����������� ����������� ���-������ Edding Industry Paint 8750 2-4 �� �����',	10013,'20.02.2022','20.04.2022'),
			('³�� Bushmills Original 6 ���� �������� 1 � 40%',							10014,'05.03.2022','05.07.2022'),
			('���� Hommage Et Memoire ������� ���� 0.75 � 13%',								10014,'22.11.2022','22.12.2022'),
			('�������� ���� Corona Extra ����� ����������� 4.5% 0.355 � x 6 ��.',			10014,'02.12.2022','12.12.2022');
GO

INSERT INTO [����������� ������]
	VALUES	(10000,10004),
			(10000,10011),
			(10000,10008),
			(10001,10014),
			(10001,10011),
			(10001,10013),
			(10002,10001),
			(10002,10000),
			(10002,10008),
			(10003,10009),
			(10003,10005),
			(10003,10011),
			(10004,10013),
			(10004,10010),
			(10004,10009),
			(10005,10004),
			(10005,10013),
			(10005,10010),
			(10006,10003),
			(10006,10009),
			(10006,10004),
			(10007,10014),
			(10007,10011),
			(10007,10013),
			(10008,10014),
			(10008,10008),
			(10008,10011),
			(10009,10009),
			(10009,10010),
			(10009,10007),
			(10010,10009),
			(10010,10006),
			(10010,10002),
			(10011,10008),
			(10011,10007),
			(10011,10010),
			(10012,10005),
			(10012,10010),
			(10012,10012),
			(10013,10007),
			(10013,10009),
			(10013,10010),
			(10014,10012),
			(10014,10007),
			(10014,10009),
			(10015,10004),
			(10015,10000),
			(10015,10009),
			(10016,10011),
			(10016,10008),
			(10016,10007),
			(10017,10014),
			(10017,10008),
			(10017,10000),
			(10018,10003),
			(10018,10004),
			(10018,10014),
			(10019,10008),
			(10019,10000),
			(10019,10001),
			(10020,10008),
			(10020,10010),
			(10020,10011),
			(10021,10007),
			(10021,10008),
			(10021,10001),
			(10022,10000),
			(10022,10010),
			(10022,10011),
			(10023,10007),
			(10023,10009),
			(10023,10004),
			(10024,10003),
			(10024,10008),
			(10024,10004);
GO

INSERT INTO [������_������]
	VALUES	(10000,10044),
			(10000,10043),
			(10000,10042),
			(10000,10041),
			(10000,10040),
			(10001,10039),
			(10001,10038),
			(10001,10037),
			(10001,10036),
			(10001,10035),
			(10002,10034),
			(10002,10033),
			(10002,10032),
			(10002,10031),
			(10002,10030),
			(10003,10029),
			(10003,10028),
			(10003,10027),
			(10003,10026),
			(10003,10025),
			(10004,10024),
			(10004,10023),
			(10004,10022),
			(10004,10021),
			(10004,10020),
			(10005,10019),
			(10005,10018),
			(10005,10017),
			(10005,10016),
			(10005,10015),
			(10006,10014),
			(10006,10013),
			(10006,10012),
			(10006,10011),
			(10006,10010),
			(10007,10009),
			(10007,10008),
			(10007,10007),
			(10007,10006),
			(10007,10005),
			(10008,10004),
			(10008,10003),
			(10008,10002),
			(10008,10001),
			(10008,10000),
			(10009,10001),
			(10009,10002),
			(10009,10003),
			(10009,10004),
			(10009,10005),
			(10010,10006),
			(10010,10007),
			(10010,10008),
			(10010,10009),
			(10010,10010),
			(10011,10011),
			(10011,10012),
			(10011,10013),
			(10011,10014),
			(10011,10015),
			(10012,10016),
			(10012,10017),
			(10012,10018),
			(10012,10019),
			(10012,10020),
			(10013,10021),
			(10013,10022),
			(10013,10023),
			(10013,10024),
			(10013,10025),
			(10014,10026),
			(10014,10027),
			(10014,10028),
			(10014,10029),
			(10014,10030);
GO

INSERT INTO [�����_�����]
	VALUES	(10023,10044),
			(10023,10043),
			(10023,10042),
			(10022,10041),
			(10022,10040),
			(10022,10039),
			(10021,10038),
			(10021,10037),
			(10021,10036),
			(10020,10035),
			(10020,10034),
			(10020,10033),
			(10019,10032),
			(10019,10031),
			(10019,10030),
			(10018,10029),
			(10018,10028),
			(10018,10027),
			(10017,10026),
			(10017,10025),
			(10017,10024),
			(10016,10023),
			(10016,10022),
			(10016,10021),
			(10015,10020),
			(10015,10019),
			(10015,10018),
			(10014,10017),
			(10014,10016),
			(10014,10015),
			(10013,10014),
			(10013,10013),
			(10013,10012),
			(10012,10011),
			(10012,10010),
			(10012,10009),
			(10011,10008),
			(10011,10007),
			(10011,10006),
			(10010,10005),
			(10010,10004),
			(10010,10003),
			(10009,10002),
			(10009,10001),
			(10009,10000),
			(10008,10001),
			(10008,10002),
			(10008,10003),
			(10007,10004),
			(10007,10005),
			(10007,10006),
			(10006,10007),
			(10006,10008),
			(10006,10009),
			(10005,10010),
			(10005,10011),
			(10005,10012),
			(10004,10013),
			(10004,10014),
			(10004,10015),
			(10003,10016),
			(10003,10017),
			(10003,10018),
			(10002,10019),
			(10002,10020),
			(10002,10021),
			(10001,10022),
			(10001,10023),
			(10001,10024),
			(10000,10025),
			(10000,10026),
			(10000,10027);
GO


SELECT	MAX([ID �����]) AS [�����]
FROM [�����]

SELECT	MAX([ID ����]) AS [̳���]
FROM [̳���]

SELECT	MAX([ID �������]) AS [�������]
FROM [�������]

SELECT	MAX([ID ������]) AS [������ ������]
FROM [������ ������]

SELECT	MAX([ID �����]) AS [������� ������]
FROM [������� ������]


SELECT	B.[ID �������] AS ID_Buyer,
		B.[ϲ�] AS Name,
		B.[���� ����������] AS Birthday,
		B.[Email] AS Email,
		B.[ID �����] AS ID_Country,
		B.[ID ����] AS ID_City
FROM [�������] B,[̳���] C
WHERE B.[ID ����] = C.[ID ����] AND C.[����� ����] = '�������'

GO
--³��������� ������� ������� ��� �� ��� ������
CREATE PROCEDURE AVGCountCityInAllCountry
@A INT OUTPUT,
@B INT OUTPUT
AS
	BEGIN
		SELECT @A = COUNT([̳���].[ID ����]) FROM [̳���]
		SELECT @B = COUNT([�����].[ID �����]) FROM [�����]
	END
GO

--³��������� �� ������, � ���� �����������
SELECT A.[ID ������] AS ID_Section, A.[����� ������] AS NameSection
FROM [������ ������] A,[����������� ������] B
WHERE A.[ID ������] = B.[ID ������]
GROUP BY A.[����� ������], A.[ID ������]

--³��������� ����������� ������� ��������� �����
SELECT A.[ID �������], A.ϲ�, A.[���� ����������], A.Email, A.[ID �����], A.[ID ����]
FROM [�������] A, [�����] B
WHERE A.[ID �����] = B.[ID �����] AND A.ϲ� LIKE '%����%' AND B.[����� �����] = '�������'



