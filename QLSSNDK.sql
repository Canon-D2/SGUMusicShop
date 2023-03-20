CREATE DATABASE QLSSNDK
GO
USE QLSSNDK
GO
CREATE TABLE KhachHang
(
	IDCus INT IDENTITY(1,1),
	CodeCus	INT,
	HoTen NVARCHAR(50),
	Email VARCHAR(100) UNIQUE,
	DiaChiKH NVARCHAR(200),
	DienThoaiKH	VARCHAR(50),
	CONSTRAINT Pk_KhachHang	PRIMARY KEY(CodeCus)
)
GO
CREATE TABLE Parts
(
	MaParts	INT IDENTITY(1,1),
	TenParts NVARCHAR(50) NOT NULL,
	CONSTRAINT Pk_Parts PRIMARY KEY(MaParts)
)
GO
CREATE TABLE Brand
(
	MaBrand	INT IDENTITY(1,1),
	TenBrand NVARCHAR(50)	NOT NULL,
	XuatXu NVARCHAR(200),
	CONSTRAINT Pk_Brand PRIMARY KEY(MaBrand),
)
GO
CREATE TABLE SanPham
(
	MaSP INT IDENTITY(1,1),
	TenSP NVARCHAR(100) NOT NULL,
	GiaBan DECIMAL,
	NoiDung	NVARCHAR(MAX),
	AnhDD VARCHAR(50),
	SoLuongTon INT,
	MaParts INT,
	MaBrand INT,
	CONSTRAINT	Pk_SanPham PRIMARY KEY(MaSP),
	CONSTRAINT	Fk_Parts FOREIGN KEY(MaParts) REFERENCES Parts(MaParts),
	CONSTRAINT	Fk_Brand FOREIGN KEY(MaBrand) REFERENCES Brand(MaBrand)
)
GO
CREATE TABLE DonDatHang
(
	IDOrder INT IDENTITY(1,1),
	NgayDH DATETIME,
	DCGH VARCHAR(200),
	CodeCus INT,
	CONSTRAINT	Pk_DonDatHang PRIMARY KEY(IDOrder),
	CONSTRAINT	Fk_KhachHang FOREIGN KEY(CodeCus) REFERENCES KhachHang(CodeCus)
)
GO
CREATE TABLE ChiTietDatHang
(
	ID INT IDENTITY(1,1),
	IDOrder	INT,
	MaSP INT,
	SoLuong	INT,
	DonGia DECIMAL,
	CONSTRAINT	Pk_ChiTietDatHang PRIMARY KEY(IDOrder,MaSP),
	CONSTRAINT	Fk_DonHang FOREIGN KEY(IDOrder) REFERENCES DonDatHang(IDOrder),
	CONSTRAINT	Fk_SanPham FOREIGN KEY(MaSP) REFERENCES SanPham(MaSP)
)
GO
---- LOẠI SẢN PHẨM
	INSERT INTO Parts VALUES (N' Guitar')
	INSERT INTO Parts VALUES (N' Violin')
	INSERT INTO Parts VALUES (N' Piano')
	INSERT INTO Parts VALUES (N' Organ')
	INSERT INTO Parts VALUES (N' Hamonica')
	INSERT INTO Parts VALUES (N' Drum')
SELECT *FROM Parts
---- TÊN THƯƠNG HIỆU
	INSERT INTO Brand VALUES (N' YAMAHA',N' Nhật Bản')
	INSERT INTO Brand VALUES (N' ROLAND',N' Nhật Bản')
	INSERT INTO Brand VALUES (N' TAYLOR',N' Hoa Kỳ')
	INSERT INTO Brand VALUES (N' KAWAI',N' Nhật Bản')
	INSERT INTO Brand VALUES (N' KURTZMAN',N' Hoa Kỳ')
	INSERT INTO Brand VALUES (N' CORDOBA',N' Tây Ban Nha')
	INSERT INTO Brand VALUES (N' SUZUKI' ,N' Nhật Bản')
	INSERT INTO Brand VALUES (N' CASIO' ,N' Hoa Kỳ')
	INSERT INTO Brand VALUES (N' FENDER' ,N' Đức')
	INSERT INTO Brand VALUES (N' KAPOK',N' Trung Quốc')
	INSERT INTO Brand VALUES (N' OMEBO' ,N' Trung Quốc')
	INSERT INTO Brand VALUES (N' SHIFEN' ,N' Trung Quốc')
SELECT *FROM Brand
--- SẢN PHẨM
	--- LOẠI GUITAR
	INSERT INTO SanPham VALUES (N' Guitar Classic Yamaha C80',1450000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/guitar1.jpg',15,1,1)
	INSERT INTO SanPham VALUES (N' Guitar Yamaha Silent SLG200N',2250000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/guitar2.jpg',10,1,1)
	INSERT INTO SanPham VALUES (N' Guitar TAYLOR T5Z CLASSIC KOA',2600000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/guitar3.jpg',7,1,3)
	INSERT INTO SanPham VALUES (N' Guitar Classic Cordoba C5-SP',2450000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/guitar4.jpg',10,1,6)
	--- LOẠI VIOLIN
	INSERT INTO SanPham VALUES (N' Violin Omebo RV205',1450000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/violin1.jpg',20,2,11)
	INSERT INTO SanPham VALUES (N' Violin Silent Yamaha SV-150',1450000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/violin2.jpg',5,2,1)
	INSERT INTO SanPham VALUES (N' Violin Shifen SV',1490000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/violin3.jpg',7,2,12)
	INSERT INTO SanPham VALUES (N' Violin Kapok MV182',850000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/violin4.jpg',13,2,10)
	--- LOẠI PIANO
	INSERT INTO SanPham VALUES (N' Piano YAMAHA CFX',700000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/piano1.jpg',4,3,1)
	INSERT INTO SanPham VALUES (N' Piano Grand Piano Kawai SKEX',1400000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/piano2.jpg',11,3,4)
	INSERT INTO SanPham VALUES (N' Piano GRAND PIANO ĐIỆN ROLAND GP-609',1300000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/piano3.jpg',2,3,2)
	INSERT INTO SanPham VALUES (N' Piano Cơ Yamaha YUS5',700000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/piano4.jpg',11,3,1)
	--- LOẠI ORGAN
	INSERT INTO SanPham VALUES (N' Organ Yamaha Genos',400000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/organ1.jpg',9,4,1)
	INSERT INTO SanPham VALUES (N' Organ Roland AT 900C',450000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/organ2.jpg',5,4,2)
	INSERT INTO SanPham VALUES (N' Organ KURTZMAN K150',650000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/organ3.jpg',16,4,5)
	INSERT INTO SanPham VALUES (N' Organ CASIO CT-X700',450000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/organ4.jpg',4,4,8)
	--- LOẠI HAMONICA
	INSERT INTO SanPham VALUES (N' Harmonica Yamaha Chromatic SS-220',350000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/harmonica1.jpg',6,5,1)
	INSERT INTO SanPham VALUES (N' Harmonica Suzuki Mr 250c',450000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/harmonica2.jpg',9,5,7)
	INSERT INTO SanPham VALUES (N' Harmonica Fender Blues Deville',650000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/harmonica3.jpg',14,5,9)
	INSERT INTO SanPham VALUES (N' Harmonica Suzuki MR-200A',650000,N'Thông tin sản phẩm đang được cập nhật','/Asset/Images/harmonica4.jpg',5,5,7)
	--- LOẠI DRUM
	INSERT INTO SanPham VALUES (N' Drum Roland VAD706 V-Drums Acoustic Design',280000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/drum1.jpg',20,6,2)
	INSERT INTO SanPham VALUES (N' Drum Yamaha Recording Custom, Surf Green',220000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/drum2.jpg',7,6,1)
	INSERT INTO SanPham VALUES (N' Drum ROLAND SPD-30',110000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/drum3.jpg',11,6,2)
	INSERT INTO SanPham VALUES (N' Drum Casio LD-80 Touch-Sensitive Digital',220000,N' Thông tin sản phẩm đang được cập nhật','/Asset/Images/drum4.jpg',14,6,8)
SELECT *FROM SanPham
--- TÀI KHOẢN ADMIN
CREATE TABLE Admin
(
	UserAdmin VARCHAR(30) PRIMARY KEY,
	PassAdmin VARCHAR(30) NOT NULL,
	Hoten NVARCHAR(50)
)
INSERT INTO Admin VALUES('admin','123','Dang Chi Bao')
INSERT INTO Admin VALUES('boss','321','Mai Van Phuong Vu')
INSERT INTO Admin VALUES('factory','000','Dai Hoc Sai Gon')
SELECT *FROM Admin