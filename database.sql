USE [master]
GO
/****** Object:  Database [CNWeb_Pharmacy]    Script Date: 6/10/2020 5:35:47 PM ******/
CREATE DATABASE [CNWeb_Pharmacy]
GO
USE [CNWeb_Pharmacy]
GO
/****** Object:  Table [dbo].[THUOC]    Script Date: 6/10/2020 5:35:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THUOC](
	[MaThuoc] [char](20) NOT NULL,
	[TenThuoc] [nvarchar](max) NOT NULL,
	[CongDung] [nvarchar](max) NOT NULL,
	[ThanhPhan] [nvarchar](max) NOT NULL,
	[SoLuongTon] [int] NOT NULL,
	[DangThuoc] [nvarchar](20) NOT NULL,
	[MaLoaiThuoc] [char](15) NOT NULL,
	[DonGia] [int] NULL,
	[MaHangSX] [char](15) NULL,
	[MaNhaCungCap] [char](15) NULL,
	[UrlImage] [char](50) NULL,
	[Tien] [varchar](9) NULL,
	[TimKiem] [varchar](max) NULL,
 CONSTRAINT [PK_THUOC] PRIMARY KEY CLUSTERED 
(
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[TimKiemThuoc]    Script Date: 6/10/2020 5:35:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[TimKiemThuoc] (@searchstr nvarchar(50))
returns table as return (
SELECT * FROM THUOC
WHERE TenThuoc LIKE @searchstr
OR CongDung LIKE @searchstr
OR ThanhPhan LIKE @searchstr)
GO
/****** Object:  Table [dbo].[CHITIETHOADON]    Script Date: 6/10/2020 5:35:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHITIETHOADON](
	[MaHoaDon] [int] NOT NULL,
	[MaThuoc] [char](20) NOT NULL,
	[DonGia] [int] NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_CHITIETHOADON] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC,
	[MaThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GIAOHANG]    Script Date: 6/10/2020 5:35:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIAOHANG](
	[HinhThucGiaoHang] [nchar](1) NULL,
	[TenHinhThuc] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GIOHANG]    Script Date: 6/10/2020 5:35:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GIOHANG](
	[MaGH] [int] IDENTITY(1,1) NOT NULL,
	[MaThuoc] [char](20) NOT NULL,
	[MaKhachHang] [char](35) NULL,
	[SoLuong] [int] NOT NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[MaGH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HANGSANXUAT]    Script Date: 6/10/2020 5:35:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HANGSANXUAT](
	[MaHangSX] [char](15) NOT NULL,
	[TenHangSX] [nvarchar](50) NULL,
	[QuocGia] [nvarchar](30) NULL,
 CONSTRAINT [PK_HANGSANXUAT] PRIMARY KEY CLUSTERED 
(
	[MaHangSX] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 6/10/2020 5:35:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOADON](
	[MaHoaDon] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[SoDienThoai] [nchar](15) NULL,
	[Email] [nchar](50) NULL,
	[GhiChu] [nvarchar](max) NULL,
	[MaKhuyenMai] [nchar](15) NULL,
	[HinhThucGiaoHang] [nchar](1) NULL,
 CONSTRAINT [PK_HOADON] PRIMARY KEY CLUSTERED 
(
	[MaHoaDon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 6/10/2020 5:35:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHACHHANG](
	[MaKhachHang] [char](35) NOT NULL,
	[TenKhachHang] [nvarchar](40) NOT NULL,
	[Email] [char](50) NOT NULL,
	[MatKhau] [char](90) NOT NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KHUYENMAI]    Script Date: 6/10/2020 5:35:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KHUYENMAI](
	[MaKM] [nchar](10) NOT NULL,
	[TienKM] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOAITHUOC]    Script Date: 6/10/2020 5:35:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOAITHUOC](
	[MaLoaiThuoc] [char](15) NOT NULL,
	[TenLoaiThuoc] [nvarchar](30) NULL,
	[ParentID] [char](10) NULL,
 CONSTRAINT [PK_LOAITHUOC] PRIMARY KEY CLUSTERED 
(
	[MaLoaiThuoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NHACUNGCAP]    Script Date: 6/10/2020 5:35:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NHACUNGCAP](
	[MaNhaCungCap] [char](15) NOT NULL,
	[TenNhaCungCap] [nvarchar](30) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[ThongTinDaiDien] [nvarchar](50) NULL,
 CONSTRAINT [PK_NHACUNGCAP] PRIMARY KEY CLUSTERED 
(
	[MaNhaCungCap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CHITIETHOADON] ([MaHoaDon], [MaThuoc], [DonGia], [SoLuong]) VALUES (18, N'AT670218            ', 23000, 1)
INSERT [dbo].[CHITIETHOADON] ([MaHoaDon], [MaThuoc], [DonGia], [SoLuong]) VALUES (18, N'P01239C_1_l         ', 5150, 3)
INSERT [dbo].[CHITIETHOADON] ([MaHoaDon], [MaThuoc], [DonGia], [SoLuong]) VALUES (19, N'AT670218            ', 23000, 1)
INSERT [dbo].[GIAOHANG] ([HinhThucGiaoHang], [TenHinhThuc]) VALUES (N'0', N'Thanh toán bằng tiền mặt')
INSERT [dbo].[GIAOHANG] ([HinhThucGiaoHang], [TenHinhThuc]) VALUES (N'1', N'Thanh toán qua thẻ ngân hàng')
SET IDENTITY_INSERT [dbo].[GIOHANG] ON 

INSERT [dbo].[GIOHANG] ([MaGH], [MaThuoc], [MaKhachHang], [SoLuong]) VALUES (7, N'P00741C_2_l         ', N'611c9e5a5cc42eeb1c7bb493c57a7f27   ', 5)
INSERT [dbo].[GIOHANG] ([MaGH], [MaThuoc], [MaKhachHang], [SoLuong]) VALUES (8, N'BG5T0519            ', N'611c9e5a5cc42eeb1c7bb493c57a7f27   ', 6)
INSERT [dbo].[GIOHANG] ([MaGH], [MaThuoc], [MaKhachHang], [SoLuong]) VALUES (10, N'DPDC0818            ', NULL, 1)
SET IDENTITY_INSERT [dbo].[GIOHANG] OFF
INSERT [dbo].[HANGSANXUAT] ([MaHangSX], [TenHangSX], [QuocGia]) VALUES (N'AT67           ', N'Công ty DP Armephaco', N'Việt Nam')
INSERT [dbo].[HANGSANXUAT] ([MaHangSX], [TenHangSX], [QuocGia]) VALUES (N'BG5T           ', N'Công ty DP Traphaco', N'Việt Nam')
INSERT [dbo].[HANGSANXUAT] ([MaHangSX], [TenHangSX], [QuocGia]) VALUES (N'BTP            ', N'Bắc Thiên Phú', N'Vi?t Nam')
INSERT [dbo].[HANGSANXUAT] ([MaHangSX], [TenHangSX], [QuocGia]) VALUES (N'DPDC           ', N'Công ty DP Davinci', N'Pháp')
INSERT [dbo].[HANGSANXUAT] ([MaHangSX], [TenHangSX], [QuocGia]) VALUES (N'DPHL           ', N'Công ty DP Hoa Linh', N'Việt Nam')
INSERT [dbo].[HANGSANXUAT] ([MaHangSX], [TenHangSX], [QuocGia]) VALUES (N'DPPM           ', N'Công ty DP Pharmedic', N'Việt Nam')
INSERT [dbo].[HANGSANXUAT] ([MaHangSX], [TenHangSX], [QuocGia]) VALUES (N'DPSD           ', N'Công ty DP Shinpoong Daewoo', N'Hàn Quốc')
INSERT [dbo].[HANGSANXUAT] ([MaHangSX], [TenHangSX], [QuocGia]) VALUES (N'MTV            ', N'Một thành viên', N'Việt Nam')
INSERT [dbo].[HANGSANXUAT] ([MaHangSX], [TenHangSX], [QuocGia]) VALUES (N'NTP            ', N'Nam Thiên Phú', N'Việt Nam')
SET IDENTITY_INSERT [dbo].[HOADON] ON 

INSERT [dbo].[HOADON] ([MaHoaDon], [TenKhachHang], [DiaChi], [SoDienThoai], [Email], [GhiChu], [MaKhuyenMai], [HinhThucGiaoHang]) VALUES (18, N'Hoàng Việt', N'số 54 đường Hoàng Sâm, Cầu Giấy', N'0359999574     ', N'hoangviet.mta.hp@gmail.com                        ', N'', N'KM1            ', NULL)
INSERT [dbo].[HOADON] ([MaHoaDon], [TenKhachHang], [DiaChi], [SoDienThoai], [Email], [GhiChu], [MaKhuyenMai], [HinhThucGiaoHang]) VALUES (19, N'Hoàng Việt', N'số 54 đường Hoàng Sâm, Cầu Giấy', N'0359999574     ', N'hoangviet.mta.hp@gmail.com                        ', N'', N'               ', N'0')
SET IDENTITY_INSERT [dbo].[HOADON] OFF
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [TenKhachHang], [Email], [MatKhau]) VALUES (N'0310566549870356879565             ', N'Nguyễn Văn Dũng', N'0356879565                                        ', N'031056654987                                                                              ')
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [TenKhachHang], [Email], [MatKhau]) VALUES (N'0310990054320359999574             ', N'Hoàng Văn Việt', N'0359999574                                        ', N'031099005432                                                                              ')
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [TenKhachHang], [Email], [MatKhau]) VALUES (N'0310990054380368733032             ', N'Phan Thanh Tùng', N'0368733032                                        ', N'031099005438                                                                              ')
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [TenKhachHang], [Email], [MatKhau]) VALUES (N'0310990054830368732033             ', N'Lỗ Trung Hiếu', N'0368732033                                        ', N'031099005483                                                                              ')
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [TenKhachHang], [Email], [MatKhau]) VALUES (N'0312347659870345454543             ', N'Nguyễn Thị Chi', N'0345454543                                        ', N'031234765987                                                                              ')
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [TenKhachHang], [Email], [MatKhau]) VALUES (N'0433433443031456433434             ', N'Nguyễn Tiến Mạnh', N'0433433443                                        ', N'031456433434                                                                              ')
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [TenKhachHang], [Email], [MatKhau]) VALUES (N'611c9e5a5cc42eeb1c7bb493c57a7f27   ', N'Hoàng Văn Việt', N'hoangviet.mta.hp@gmail.com                        ', N'6a71ef6044f2d3ef7471b2dc5c47a176                                                          ')
INSERT [dbo].[KHACHHANG] ([MaKhachHang], [TenKhachHang], [Email], [MatKhau]) VALUES (N'C17424ED0BC29D1BFF2AE5B9FB25E1B4   ', N'Hoàng Việt', N'mai.hoang@boot.ai                                 ', N'Truongthpt21                                                                              ')
INSERT [dbo].[KHUYENMAI] ([MaKM], [TienKM]) VALUES (N'KM1       ', 10000)
INSERT [dbo].[KHUYENMAI] ([MaKM], [TienKM]) VALUES (N'KM2       ', 5000)
INSERT [dbo].[LOAITHUOC] ([MaLoaiThuoc], [TenLoaiThuoc], [ParentID]) VALUES (N'5              ', N'5', N'5         ')
INSERT [dbo].[LOAITHUOC] ([MaLoaiThuoc], [TenLoaiThuoc], [ParentID]) VALUES (N'CSCT           ', N'Chăm sóc cơ thể', N'TPCN      ')
INSERT [dbo].[LOAITHUOC] ([MaLoaiThuoc], [TenLoaiThuoc], [ParentID]) VALUES (N'CSRM           ', N'Chăm sóc răng miệng', N'TPCN      ')
INSERT [dbo].[LOAITHUOC] ([MaLoaiThuoc], [TenLoaiThuoc], [ParentID]) VALUES (N'CSSD           ', N'Chăm sóc sắc đẹp', N'TPCN      ')
INSERT [dbo].[LOAITHUOC] ([MaLoaiThuoc], [TenLoaiThuoc], [ParentID]) VALUES (N'DCSC           ', N'Dụng cụ sơ cứu', N'TTGD      ')
INSERT [dbo].[LOAITHUOC] ([MaLoaiThuoc], [TenLoaiThuoc], [ParentID]) VALUES (N'DCYT           ', N'Dụng cụ y tế', N'TTGD      ')
INSERT [dbo].[LOAITHUOC] ([MaLoaiThuoc], [TenLoaiThuoc], [ParentID]) VALUES (N'TDY            ', N'Thuốc Đông Y', N'0         ')
INSERT [dbo].[LOAITHUOC] ([MaLoaiThuoc], [TenLoaiThuoc], [ParentID]) VALUES (N'TPCN           ', N'Thực Phẩm Chức Năng', N'0         ')
INSERT [dbo].[LOAITHUOC] ([MaLoaiThuoc], [TenLoaiThuoc], [ParentID]) VALUES (N'TTGD           ', N'Tủ thuốc gia đình', N'0         ')
INSERT [dbo].[LOAITHUOC] ([MaLoaiThuoc], [TenLoaiThuoc], [ParentID]) VALUES (N'TTY            ', N'Thuốc Tây Y', N'0         ')
INSERT [dbo].[NHACUNGCAP] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [ThongTinDaiDien]) VALUES (N'NCC1           ', N'CTY PP Ngô Phong', N'Hoàng Mai - Hà Nội', N'Ngô Hồng Phong')
INSERT [dbo].[NHACUNGCAP] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [ThongTinDaiDien]) VALUES (N'NCC2           ', N'CTY TNHH Downstair', N'Hai Bà Trưng - Hà Nội', N'Nguyễn Kiều Anh')
INSERT [dbo].[NHACUNGCAP] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [ThongTinDaiDien]) VALUES (N'NCC3           ', N'CTY PP Duy Anh', N'Chí Linh - Hải Dương', N'Phạm Công Anh')
INSERT [dbo].[NHACUNGCAP] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [ThongTinDaiDien]) VALUES (N'NCC4           ', N'CTY TNHH Hải Lam', N'Hưng Hà - Thái Bình', N'Nguyễn Văn Công')
INSERT [dbo].[NHACUNGCAP] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [ThongTinDaiDien]) VALUES (N'NCC5           ', N'CTY PP Wefor', N'Hoàn Kiếm - Hà Nội', N'Đào Duy Anh')
INSERT [dbo].[NHACUNGCAP] ([MaNhaCungCap], [TenNhaCungCap], [DiaChi], [ThongTinDaiDien]) VALUES (N'NCC6           ', N'CTY PP Gamma', N'Hai Bà Trưng - Hà Nội', N'Vũ Trọng Luận')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'AT670218            ', N'D-Contresin 500', N'Chống đau lưng, vẹo cổ', N'Mephenesin', 1297, N'Viên nén', N'TTY            ', 23000, N'AT67           ', N'NCC1           ', N'P00623H_1_l.jpeg                                  ', N'23.000', NULL)
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'BG5T0519            ', N'Casoran', N'Thuốc hạ huyết áp', N'Cao hoa hòe, Cao dừa cạn, Cao tâm sen, Cao cúc hoa', 1296, N'Thuốc cốm', N'TDY            ', 3000, N'BG5T           ', N'NCC1           ', N'P00791H_4_l.jpeg                                  ', N'3.000', NULL)
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'Coq1234             ', N'Coq10 Mỹ', N'Co-enzim Q10 được sản xuất tại Mỹ có tác dụng hàng đầu trong việc bồi bổ sức khỏe cho trái tim. Vì giữ cho trái tim của bạn mạnh mẽ là một phần quan trọng của việc có một sức khỏe tốt.', N'Co enzim', 500, N'Hộp 30 viên', N'TPCN           ', 50000, N'NTP            ', N'NCC2           ', N'coq.jpg                                           ', N'50.000', NULL)
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'DPDC0818            ', N'PTU Thepharm', N'ức chế tổng hợp hormon tuyến giáp', N'Propylthiouracil', 1299, N'Viên nén', N'TTY            ', 5000, N'DPDC           ', N'NCC1           ', N'P00941C_3_l.jpeg                                  ', N'5.000', N'ptu thepharm')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'DPHL1118            ', N'Abicin 250', N'Tác dụng kháng sinh', N'Amikacin', 1599, N'Bột pha tiêm', N'TTY            ', 55000, N'DPPM           ', N'NCC1           ', N'P00791H_4_l.jpeg                                  ', N'55.000', N'abicin 250')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'DPPM0120            ', N'PARACETAMOL 500 mg', N'Hạ sốt', N'Paracetamol', 1299, N'Viên nén', N'TTY            ', 65000, N'MTV            ', N'NCC3           ', N'P00909H_3_l.jpeg                                  ', N'65.000', N'paracetamol')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'DPSD0220            ', N'ACM Control 1', N'Dùng trong bệnh tim', N'Acenocoumarol', 720, N'Viên nén', N'TTY            ', 45000, N'NTP            ', N'NCC2           ', N'P00200H_3_l.jpeg                                  ', N'45.000', N'acm control')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'duong1234           ', N'Đường ăn kiêng Sweet''n Low', N'Đường ăn kiêng Sweet''n Low chiết xuất từ thiên nhiên, không chứa calorie nhưng có độ ngọt cao gấp 10 lần đường thông thường. Mỗi gói được phân lường có độ ngọt tương đương 2 muỗng cà phê đường. ', N'Dextrose dinh dưỡng, canxi sacarin , kem Tartar và calcium silicate (chất chống đông cứng).', 20, N'Hộp 100 gói', N'TPCN           ', 50600, N'NTP            ', N'NCC2           ', N'duongankieng.jpeg                                 ', N'50.600', N'duong an kieng sweet')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'Gluc1234            ', N'Sữa bột dành cho người tiểu đường Glucerna 850 g', N'Glucerna là sản phẩm dinh dưỡng đầy đủ và cân đối cho người đái tháo đường và tiền đái tháo đường với công thức tiên tiến và hệ dưỡng chất đặc chế Triple Care được chứng minh lâm sàng giúp kiểm soát tốt đường huyết, tăng cường sức khỏe tim mạch.

Hệ bột đường tiên tiến, với chỉ số đường huyết thấp và được tiêu hóa từ từ giúp bình ổn đường huyết.', N'Năng lượng INT, Chất đạm(Protein),Chất béo (Fat), Chất bột đường (Carbohydrate) , Chất xơ (Total dietary fiber), FOS, Polyols, Taurin, Carnitin, Inositol, Vitamin A (palmitat), Vitamin D3, Vitamin E, Vitamin K1, Vitamin C, Acid Folic, Vitamin B1, Vitamin B2, Vitamin B6, Vitamin B12, Niacin (tương đương), Acid Pantothenic, Biotin, Cholin, Natri, Kali, Clorid, Canxi, Phostpho,...', 50, N'Hộp 850g', N'TPCN           ', 804440, N'NTP            ', N'NCC2           ', N'Glucerna.jpeg                                     ', N'804.440', N'sua bot tieu duong glucerna')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'lic1234             ', N'Viên uống giảm cân LIC', N'LIC giúp kiểm soát cân nặng và giảm cân hiệu quả, an toàn (*).

Cải thiện số đo các vùng eo, bụng, đùi trong thời gian sớm nhất.

Phòng ngừa các bệnh mãn tính do béo phì: tim mạch, tiểu đường, rối loạn nội tiết, hô hấp, xương khớp, ung thư…

(*) Sản phẩm đã qua thử nghiệm lâm sàng về hiệu quả. LIC giúp giảm cân an toàn, không mất nước và mệt mỏi.', N'Hoạt chất chính: Belaunja extract 300mg, Mangastin extract 100mg, Psilio husk powder 200mg.', 50, N'Hộp 60 viên', N'TPCN           ', 675000, N'NTP            ', N'NCC2           ', N'lic.jpeg                                          ', N'675.000', N'vien giam can lic')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'Mass1234            ', N'Sữa Protein tăng cân Elite Labs Mass Muscle Gainer', N'Sữa tăng cân Mass Muscle Gainer vị chocolate dành riêng cho người muốn tăng cân tăng cơ nhanh', N'Protein, carb, calo và chất béo.', 50, N'Bịch 2,3kg', N'TPCN           ', 1605000, N'NTP            ', N'NCC2           ', N'mass.jpeg                                         ', N'1.605.000', N'sua tang can elite')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'Momega1234          ', N'Momega For Men Dao Nordic Health', N'Hỗ Trợ Tim Mạch Nam Giới', N'Demafort', 30, N'Hộp 90 viên', N'TPCN           ', 150000, N'NTP            ', N'NCC2           ', N'momega.jpg                                        ', N'150.000', N'thuoc ho tro tim mach momega')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P00077G_1_l         ', N'Khăn tẩy trang sạch nhờn Bioré Rich Smooth', N'Tẩy trang', N'Water, Cetyl Ethylhexanoate, Isostearyl Palmitate, Pentaerythrityl Tetraethylhexanoate, Isononyl Isononanoate, Cyclopentasiloxane, Hexylene Glycol, PEG-4 Laurate, PEG-6 Caprylic/Capric Glycerides,…', 20, N'Gói 10 miếng', N'CSSD           ', 26400, N'BTP            ', N'NCC3           ', N'P00077G_1_l.jpeg                                  ', N'26.400', N'khan tay trang sach nhon')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P00078G_1_l         ', N'Khăn giấy tẩy trang dưỡng ẩm Bioré Rich Moisture', N'Tẩy trang', N'Water, glycerol, alcohol, PEG-7 glyceryl cocoate, PEG-6 caprylic/capric glycerides, PEG 400, sodium stearoyl glutamate, sodium citrate, tocopheryl acetate, EDTA-2NA,…', 10, N'Chai 100ml', N'CSSD           ', 23100, N'BTP            ', N'NCC3           ', N'P00078G_1_l.jpeg                                  ', N'23.100', N'khan tay trang duong am')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P00200H_3_l         ', N'
Viên đặt giảm đau- hạ sốt Efferalgan Suppo. 150mg', N'Thuốc dùng điều trị các chứng đau và/hoặc sốt như đau đầu, tình trạng như cúm, đau răng, nhức mỏi cơ. Dạng trình bày dành cho trẻ em cân nặng từ 8 đến 12 kg (khoảng 6 đến 24 tháng tuổi). (còn có pararacetamol ở các dạng bào chế khác dành cho trẻ em có cân nặng khác nhau. Xin hỏi ý kiến thầy thuốc hoặc dược sĩ của bạn.)', N' Paracetamol 150mg', 50, N'Hộp 10 viên', N'TTGD           ', 31500, N'NTP            ', NULL, N'P00200H_3_l.jpeg                                  ', N'31.500', N'vien ha sot efferalgan')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P00262H_2_l         ', N'Thuốc giảm đau hạ sốt cho trẻ Hapacol 150mg', N'Hạ sốt, giảm đau cho trẻ trong các trường hợp: cảm, cúm, sốt xuất huyết, nhiễm khuẩn, nhiễm siêu vi, mọc răng, sau khi tiêm chủng, sau phẫu thuật,…
Thuốc dạng viên sủi với hương cam dịu nhẹ giúp trẻ dễ uống.', N'Paracetamol 150 mg', 50, N'Hộp 50 gói', N'TTGD           ', 50000, N'NTP            ', NULL, N'P00262H_2_l.jpeg                                  ', N'50.000', N'thuoc ha sot tre em')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P00264H_3_l         ', N'Thuốc giảm đau, hạ sốt Hapacol 325mg', N'Điều trị các triệu chứng đau trong các trường hợp: đau đầu, đau nửa đầu, đau răng, đau nhức do cảm cúm, đau họng, đau nhức cơ xương, đau do viêm khớp, đau sau khi tiêm ngừa hay nhổ răng.', N'Thành phần: Paracetamol 325mg, tá dược.', 10, N'Hộp 100 viên', N'TTGD           ', 32200, N'NTP            ', N'NCC2           ', N'P00264H_3_l.jpeg                                  ', N'32.200', N'thuoc ha sot hapacol')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P00267H_2_I         ', N'Thuốc giảm đau hạ sốt cho trẻ Hapacol 80mg', N'Hạ sốt, giảm đau cho trẻ trong các trường hợp: cảm, cúm, sốt xuất huyết, nhiễm khuẩn, nhiễm siêu vi, mọc răng, sau khi tiêm chủng, sau phẫu thuật,…', N'Paracetamol 80 mg', 4, N'Hộp 24 gói', N'TTGD           ', 26750, N'NTP            ', N'NCC2           ', N'P00267H_2_l.jpeg                                  ', N'26.750', N'thuoc ha sot tre em')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P00513C_3_l         ', N'Siro giảm đau- hạ sốt cho trẻ em Tylenol 60ml', N'Thuốc Giảm Đau- Hạ Sốt Siro Tylenol Children''S Susp. 60Ml có tác dụng: Hạ sốt, giảm đau nhức thông thường & khó chịu trong các trường hợp cảm lạnh, cúm, mọc răng, đau răng, đau đầu, đau tai, đau sau tiêm chủng, viêm họng.', N'Acetaminophen 80mg.', 50, N'Chai 60ml', N'TTGD           ', 28000, N'NTP            ', NULL, N'P00513C_3_l.jpeg                                  ', N'28.000', N'siro ha sot tre em tylenol')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P00621H_3_l         ', N'Thuốc giảm đau- hạ sốt Effer-Paralmax 150', N'Thuốc giảm đau- hạ sốt Effer-Paralmax 150 điều trị các triệu chứng đau và/hoặc sốt từ nhẹ đến vừa ở trẻ em trong các trường hợp: Đau đầu, đau răng, đau họng, nhức mỏi cơ, cảm cúm, mọc răng, nhức răng...', N'Paracetamol 150 mg.', 4, N'Hộp 30 gói', N'TTGD           ', 27330, N'NTP            ', NULL, N'P00621H_3_l.jpeg                                  ', N'27.330', N'thuoc ha sot effer-paralmax')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P00623H_1_l         ', N'Thuốc giảm đau- hạ sốt Effer-Paralmax extra', N'Thuốc giảm đau- hạ sốt Effer-Paralmax extra được dùng để điều trị nhiều bệnh như đau đầu, đau cơ, viêm khớp, đau lưng, đau răng, cảm lạnh và sốt. Nó làm giảm đau trong viêm khớp nhẹ nhưng không có tác dụng trên các nền tảng và viêm sưng khớp.', N' Paracetamol 650 mg.', 50, N'Hộp 20 viên', N'TTGD           ', 32000, N'NTP            ', NULL, N'P00623H_1_l.jpeg                                  ', N'32.000', N'thuoc ha sot effer-paralmax')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P00663H_3_l         ', N'Thuốc Giảm đau- hạ sốt dạng bột sủi Efferalgan 80mg', N'Thuốc Giảm đau- hạ sốt Efferalgan 80mg dùng điều trị các chứng đau và/hoặc sốt như đau đầu, tình trạng như cúm, đau răng, nhức mỏi cơ.', N'Paracetamol 80mg.', 50, N'Hộp 60 gói', N'TTGD           ', 26000, N'NTP            ', NULL, N'P00663H_3_l.jpeg                                  ', N'26.000', N'thuoc ha sot dang sui')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P00741C_2_l         ', N'Băng thun 3 móc Minh Quang', N'Sử dụng trong khoa chấn thương chỉnh hình, phẫu thuật tạo hình thẩm mỹ và băng rốn cho trẻ sơ sinh.', N'Sợi Cotton se tròn, sợi cao su tự nhiên.', 100, N'Cuộn', N'DCSC           ', 14870, N'NTP            ', NULL, N'P00741C_2_l.jpeg                                  ', N'24.870', N'bang thun minh quang')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P00791H_4_l         ', N'Kem đánh răng dược liệu Ngọc Châu', N'Kem đánh răng dược liệu Ngọc Châu chứa các dược liệu có tác dụng làm bền thành mạch, hoạt huyết, tăng cường nuôi dưỡng răng, lợi, góp phần chống tụt lợi, chảy máu chân răng, chống ê buốt, bảo vệ lợi giúp răng chắc khỏe từ gốc, thanh nhiệt, tiêu viêm, làm dịu niêm mạc miệng, ngăn ngừa viêm lợi, nhiệt miệng....', N'Hoạt chất chính: Hoa hòe, keo ong, cam thảo, bạc hà, đinh hương, tinh chất rễ cây Ratany, vỏ quả cau, muối tinh khiết.

', 12, N'Hộp 1 tuýp', N'CSRM           ', 31160, N'NTP            ', NULL, N'P00791H_4_l.jpeg                                  ', N'31.160', N'kem danh rang ngoc chau')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P00874T_3_l         ', N'Kem nghệ dưỡng da trị thâm Thái Dương', N'Tái tạo tế bào da mới, hồi phục da bị tổn thương, …', N'Centella Asiatica, Vitamin E, D-panthenol (Vitamin B5), Chlorhexindine', 20, N'Hộp 11g', N'CSSD           ', 19800, N'BTP            ', N'NCC3           ', N'P00874T_3_l.jpeg                                  ', N'19.800', N'kem nghe thai duong')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P00909H_3_l         ', N'Máy đo huyết áp Omron HEM-7120', N'Đo huyết áp', N'Bảo hành máy 5 năm', 17, N'Hộp 1 máy', N'DCYT           ', 738890, N'BTP            ', N'NCC4           ', N'P00909H_3_l.jpeg                                  ', N'738.890', N'may do huyet ap omron')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P00934C_3_l         ', N'Sữa rửa mặt cho da khô và nhạy cảm Physiogel Dermo Cleanser 150ml', N'Sữa rửa mặt', N'Aqua, PEG-75, Cetearyl Alcohol, Disodium Phosphate, Sodium Cocoyl Isethionate, Methylparaben, Citric Acid, Butylparaben, Propylparaben, Parfum.', 50, N'Chai 150ml', N'CSCT           ', 154450, N'BTP            ', N'NCC5           ', N'P00934C_3_l.jpeg                                  ', N'154.450', N'sua rua mat physiogel')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P00941C_3_l         ', N'Bàn chải Jordan Trẻ Em Buddy 5-10 tuổi', N'Bàn chải đánh răng cho bé từ 5-10 tuổi Jordan Buddy giúp bé vệ sinh răng miệng sạch sẽ, chải sạch mọi mảng bám và vụn thức ăn mà không gây tổn thương đến nướu. Kết hợp với loại kem đánh răng không gây kích ứng, an toàn, cha mẹ hoàn toàn yên tâm vệ sinh răng miệng cho bé.', N'Đầu lông bàn chải mềm, thân làm bằng nhựa.', 50, N'1 cái', N'CSRM           ', 20000, N'NTP            ', NULL, N'P00941C_3_l.jpeg                                  ', N'20.000', N'ban chai jordan')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P00946C_1_l         ', N'Bàn chải Jordan Trẻ Em 6-9 Tuổi Step 3', N'Bàn chải có cấu trúc đặc biệt, phù hợp với răng miệng trẻ 6 - 8 tuổi, giúp quét sạch những mảng bám trên răng, khử mùi khó chịu và ngăn ngừa sâu răng cho trẻ hiệu quả mà không làm tổn hại đến răng nướu trẻ.

Phần lông bàn chải siêu mềm giúp chăm sóc nhẹ nhàng và chải sạch vùng răng và nướu nhạy cảm của bé ở gia đoạn bé đã thành thạo việc đánh răng

', N'Đầu lông bàn chải mềm, thân làm bằng nhựa.', 12, N'1 cái', N'CSRM           ', 23000, N'NTP            ', NULL, N'P00946C_1_l.jpeg                                  ', N'23.000', N'ban chai jordan')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P00995T_1_l         ', N'Tuýp dưỡng ẩm Vaseline Pure OPC', N'Phòng chống nứt môi, khô moi, nứt bàn chân, …', N'Pure Petroleum Jelly Original', 10, N'Tuýp 10g', N'CSSD           ', 9900, N'BTP            ', N'NCC3           ', N'P00995T_1_l.jpeg                                  ', N'9.900', N'tuyp duong am vaseline')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01028H_1_l         ', N'Sữa tắm dành cho nam Old Spice Denali Fresher Collection 473ml', N'Sửa tắm', N'Water, Sodium Lauroamphoacetate, Styrene/Acrylates Copolymer, Citric Acid, Sodium Benzoate, Polyquaternium-10, Disodium EDTA, Dimenthiconol...', 15, N'Chai 473ml', N'CSCT           ', 108900, N'BTP            ', N'NCC5           ', N'P01028H_1_l.jpeg                                  ', N'108.900', N'sua tam nam denali')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01092T_3_l         ', N'Kem trị nứt gót chân Gót Sen Thái Dương', N'Dùng cho các trường hợp khô nứt da do thời tiết hoặc tiếp xúc với chất tẩy rửa và môi trường lao động ô nhiễm', N'Curcuma Longa Extract, Propylen Glycol, GMS, PEG - 75 Lanolin, Glycerin, Cetostearyl Alcol, Acid Stearic, Nipagin, Nipasol.', 15, N'Tuýp 25g', N'CSSD           ', 20360, N'BTP            ', N'NCC3           ', N'P01092T_3_l.jpeg                                  ', N'20.360', N'kem tri nut got sen thai duong')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01209H_3_l         ', N'Sữa tắm dưỡng ẩm Ceradan Moisturising Body Wash 150ml', N'Tắm, dưỡng ẩm', N'Cholesterol Acid Linolenic (acid béo tự do), Hydroxypropyl Bispalmitamide MEA (Ceramide), Nước, Glycerin, Caprylic/capric Triglyceride, Natri Lauroamphoacetate, Hydroxypropyl Guar, Cocamide MEA, Acid Citric, Allantoin, Phenoxyethanol.', 10, N'Chai 150ml', N'CSCT           ', 208890, N'BTP            ', N'NCC5           ', N'P01209H_3_l.jpeg                                  ', N'208.890', N'sua tam duong am ceradan')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01218H_1_l         ', N'Sữa tắm dạng dầu Eucerin pH5 Shower Oil 200ml', N'Tắm', N'Glycine Soja, MIPA Laureth Sulfate, Ricinus Communis, Laureth-4, Cocamide DEA, Poloxamer 101, Parfum (Fragrance), Panthenol, Bisabolol, Lanolin Alcohol, Citric Acid, Diammonium Citrate, Aqua, Propyl Gallate, BHT, Linalool, Butylphenyl Methylpropional, Alpha-Isomethyl Ionone, Hexyl Cinnamal, Limonene, Coumarin, Benzyl Salicylate."', 3, N'Chai 86ml', N'CSCT           ', 146660, N'BTP            ', N'NCC5           ', N'P01218H_1_l.jpeg                                  ', N'146.660', N'sua tam eucerin')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01229H_1_l         ', N'Nước súc miệng Valentine Thái dương sát trùng răng, miệng và vòm họng của bé 250ml', N'Nước súc miệng Valentine Thái dương trẻ em 250ml được sản xuất từ các dược liệu tự nhiên, quý giá, có nguồn gốc rõ ràng và có nguồn gốc từ thảo dược thiên nhiên nhằm đảm bảo an toàn sức khỏe và công dụng đến khách hàng.', N'Hoạt chất chính: Aqua, Propylene Glycol, Glycerin, Poloxamer 407, Sodium Clorid, Allantoin, Citrus, Sinensis peel oil ( tinh dầu cam), Menthol, Sodium Fluoride, Mentha piperita oil ( Tinh dầu bạc hà),….', 12, N'1 chai', N'CSRM           ', 15000, N'NTP            ', NULL, N'P01229H_1_l.jpeg                                  ', N'15.000', N'nuoc suc mieng valine')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01231H_3_l         ', N'Sữa tắm Tây Thi Thái Dương', N'Sữa tắm', N'Hoa đào, Nhân sâm, Bí đao, trầu không, Nghệ vàng, Tá dược…', 5, N'Tuýp 200g', N'CSCT           ', 55570, N'BTP            ', N'NCC5           ', N'P01231H_3_l.jpeg                                  ', N'55.570', N'sua tam tay thi thai duong')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01239C_1_l         ', N'Dung dịch Cồn 90 độ
', N'Dung dịch Cồn 90 độ hay còn được gọi là cồn y tế có tác dụng diệt vi khuẩn, siêu vi khuẩn và các loại nấm. Trong y tế, các loại cồn sát trùng này thường được dùng để: sát trùng dụng cụ y tế, sát trùng phần mô trước khi tiêm, phẫu thuật…', N'Hoạt chất chính: Ethanol 96% 56,25ml; Xanh methylen 0,02mg.', 100, N'Chai 60ml', N'DCSC           ', 5150, N'NTP            ', NULL, N'P01239C_1_l.jpeg                                  ', N'5.150', N'con 90')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01240C_1_l         ', N'Dung dịch Oxy Già', N'Dung dịch Oxy già được dùng để rửa sạch, sát trùng vết thương và vết loét. Súc miệng trong trường hợp viêm răng lợi, viêm miệng cấp. Nhỏ tai để rửa ống tai, loại bỏ ráy tai, khi tai có mủ.', N'Hoạt chất chính: nước oxy già đậm đặc 6,03g, Acid benzoic, Ethanol 96%.', 100, N'Chai 60ml', N'DCSC           ', 3070, N'NTP            ', NULL, N'P01240C_1_l.jpeg                                  ', N'3.070', N'oxy gia')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01322G_1_l         ', N'Gạc y tế tiệt trùng Bảo Thạch 5x6.5cm', N'Gạc y tế tiệt trùng Bảo Thạch 5x6.5cm dùng sát trùng vùng da lành hoặc da bất thường', N'Được làm từ 100% sợi cotton.', 100, N'Gói 10 miếng', N'DCSC           ', 5780, N'NTP            ', NULL, N'P01322G_1_l.jpeg                                  ', N'5.780', N'gac y te bao thach')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01324G_1_l         ', N'Gạc sát trùng vết thương Povidine 10%', N'Gạc thuốc sát trùng chứa Povidon iod 10% sử dụng cho các vết thương, vết bỏng nông và ít rộng, và điều trị một số bệnh ngoài da.', N'Hoạt chất chính: Povidon iod 10g, tá dược vừa đủ 100g. Mỗi miếng gạc (10cm x 10cm) x 3g thuốc mỡ Povidine 10%.', 100, N'Miếng', N'DCSC           ', 8500, N'NTP            ', NULL, N'P01324G_1_l.jpeg                                  ', N'8.500', N'gac sat trung povidine')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01326C_1_l         ', N'Sữa tắm Dial Greek Vanilla Honey 473ml', N'Sửa tắm', N'Nước, Sodium Laureth Sulfate, Cocamidopropyl Betaine, Glycerin, Fragrance, Polyquaternium-7,PEG-7 Glyceryl Cocoate,…', 12, N'Chai 473ml', N'CSCT           ', 108780, N'BTP            ', N'NCC5           ', N'P01326C_1_l.jpeg                                  ', N'108.780', N'sua tam dial greek')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01327C_1_l         ', N'Sữa tắm gội trẻ em 6+ Dial Kid Water Melon 355ml', N'Sửa tắm gội', N'Water, Sodium Laureth Sulfate, Cocamidopropyl Betaine, Glycerin ...', 0, N'Chai 355ml', N'CSCT           ', 121000, N'BTP            ', N'NCC5           ', N'P01327C_1_l.jpeg                                  ', N'121.000', N'sua tam goi tre em ')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01341T_1_l         ', N'Kem trị rôm sảy, mẩn ngứa & ngăn ngừa mụn Yoosun Rau Má (25g)', N'Dưỡng da, làm mát da', N'100% bông xơ tự nhiên', 40, N'Hộp 60 miếng', N'CSSD           ', 20000, N'BTP            ', N'NCC3           ', N'P01341T_1_l.jpeg                                  ', N'20.000', N'kim tri mun yoosun')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01418G_1_l         ', N'Bông gòn y tế tiệt trùng Bảo Thạch 5g', N'Sản phẩm Bông gòn y tế tiệt trùng Bảo Thạch 5g được sản xuất từ 100% bông xơ tự nhiên, không lẫn tạp chất và không pha poly. Công nghệ Châu Âu giúp bông mịn, chắc. Công nghệ tiệt trùng E.O.Gas đối với những sản phẩm dùng trong phẫu thuật.', N'Bông gòn Bảo Thạch được làm từ 100% bông tự nhiên

', 100, N'Gói 5g', N'DCSC           ', 1600, N'NTP            ', NULL, N'P01418G_1_l.jpeg                                  ', N'1.600', N'bong y te bao thach')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01428H_1_l         ', N'Đầu kim chích tiểu đường Novofine 32G x 4mm', N'Chích tiểu đường', N'Không hoạt chất', 25, N'Hộp 100 cái', N'DCYT           ', 280350, N'BTP            ', N'NCC4           ', N'P01428H_1_l.jpeg                                  ', N'280.350', N'kim chich tieu duong novofine')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01490G_1_l         ', N'Dao cạo râu Gillette Superthin II cán vàng', N'Cạo râu', N'Không có', 10, N'Tuýp 10g', N'CSSD           ', 9900, N'BTP            ', N'NCC3           ', N'P01490G_1_l.jpeg                                  ', N'9.900', N'dao cao rau gillette')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01622C_1_l         ', N'Sữa tắm khô No Rinse Body Bath 237ml', N'Tắm khô', N'Deionized water, triethanolamine lauryl sulfate, propylene glycol, cocamidopropyl betaine, diazolidinyl urea, methylparaben, propylparaben, fragrance, citric acid.', 2, N'Chai 237ml', N'CSCT           ', 133100, N'BTP            ', N'NCC5           ', N'P01622C_1_l.jpeg                                  ', N'133.100', N'sua tam kho')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01640H_1_l         ', N'Que thử đường huyết One Touch Ultra', N'Thử đường huyết', N'Không có', 22, N'Hộp 25 que', N'DCYT           ', 287140, N'BTP            ', N'NCC4           ', N'P01640H_1_l.jpeg                                  ', N'287.140', N'que thu duong huyet')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01660H_1_l         ', N'Băng cuộn y tế Ugotana kích thước 1,25cm x 4m', N'Băng thông thoáng, có độ dính cao, dùng băng các vết thương trong phẫu thuật, để cố định catheter, kim truyền…, dụng cụ y khoa.', N'Phần nền: Băng vải lụa.', 100, N'Hộp 1 cuộn', N'DCSC           ', 8400, N'NTP            ', NULL, N'P01660H_1_l.jpeg                                  ', N'8.400', N'bang y te ugotana')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01664H_1_l         ', N'Chỉ nha khoa Oraltana
', N'Chỉ Nha Khoa Oraltana được làm từ sợi nilon đây là loại chỉ đơn có thể trượt dễ dàng qua những kẽ răng thậm chí với những kẽ răng hẹp và gần như không bị tưa.', N'Nhựa y tế , sáp , hương liệu

', 12, N'Hộp 1 cái', N'CSRM           ', 45000, N'NTP            ', NULL, N'P01664H_1_l.jpeg                                  ', N'45.000', N'chi nha khoa oraltana')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01665G_1_l         ', N'Tăm chỉ nha khoa tiệt trùng Oraltana túi 50 cái', N'Tăm chỉ nha khoa tiệt trùng Oraltana túi 50 cái', N'Được làm từ sợi ni lông bền chắc , an toàn 

Nhựa y tế , sáp , hương liệu', 10, N'1 gói', N'CSRM           ', 22300, N'NTP            ', NULL, N'P01665G_1_l.jpeg                                  ', N'22.300', N'tam chi nha khoa oraltana')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01673H_1_l         ', N'Dụng cụ hút mũi silicone Softtana', N'Hút mũi sạch cho bé', N'Nhựa y tế và Silicone y tế', 13, N'Hộp 1 cái', N'DCYT           ', 45530, N'BTP            ', N'NCC4           ', N'P01673H_1_l.jpeg                                  ', N'45.530', N'may hut mai softtana')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01674H_3_l         ', N'Dụng cụ hút sữa Tanako', N'Giúp cho con bú', N'Nhựa Y tế, silicone Y tế.', 2, N'Hộp 1 cái', N'DCYT           ', 42370, N'BTP            ', N'NCC4           ', N'P01674H_3_l.jpeg                                  ', N'42.370', N'may hut sua tanako')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01677C_3_l         ', N'Nhiệt kế thủy ngân Tokyo', N'Đo nhiệt độ cơ thể khi sốt', N'Kim loại', 4, N'Hộp 1 cái', N'DCYT           ', 17920, N'BTP            ', N'NCC4           ', N'P01677C_3_l.jpeg                                  ', N'17.920', N'nhiet ke tokyo')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01678C_1_l         ', N'Nhiệt kế điện tử Sakura', N'Đo nhiệt độ cơ thể khi sốt', N'Kim loại', 3, N'Hộp 1 cái', N'DCYT           ', 31840, N'BTP            ', N'NCC4           ', N'P01678C_1_l.jpeg                                  ', N'31.840', N'nhiet ke sakura')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01687H_3_l         ', N'Máy đo huyết áp Omron HEM-8712', N'Đo huyết áp', N'Bảo hành máy 5 năm', 21, N'Hộp 1 máy', N'DCYT           ', 720000, N'BTP            ', N'NCC4           ', N'P01687H_3_l.jpeg                                  ', N'720.000', N'may do huyet ap omron')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01743G_1_l         ', N'Bông gòn y tế tiệt trùng Bảo Thạch 25g', N'Sản phẩm Bông gòn y tế tiệt trùng Bảo Thạch 25g được sản xuất từ 100% bông xơ tự nhiên, không lẫn tạp chất và không pha poly. Công nghệ Châu Âu giúp bông mịn, chắc. Công nghệ tiệt trùng E.O.Gas đối với những sản phẩm dùng trong phẫu thuật.

Bông gòn Bảo Thạch dùng để sát trùng trước khi tiêm, lau rửa vết thương và thấm máu, vệ sinh cho người lớn và em bé.', N'Bông gòn Bảo Thạch được làm từ 100% bông tự nhiên

', 100, N'Gói 25g', N'DCSC           ', 4630, N'NTP            ', NULL, N'P01743G_1_l.jpeg                                  ', N'6.630', N'bang y te bao thach')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01756C_2_l         ', N'Bàn chải đánh răng Oral - B Stages 3 dành cho bé 5-7 tuổi', N'Bàn Chải Đánh Răng Oral-B Stages 3 với thiết kế đầu bàn chải là những sợi chỉ tơ mềm là sản phẩm thích hợp cho răng nướu nhạy cảm của các bé từ 5 đến 7 tuổi. Bên cạnh đó, thiết kế ngộ nghĩnh, dễ thương của bàn chải còn thu hút và tạo cảm hứng để các bé chăm chỉ đánh răng mỗi ngày.

Với đầu bản chải là những sợi chỉ tơ siêu mềm giúp chăm sóc nhẹ nhàng và chải sạch vùng răng và nướu nhạy cảm. Thân bàn chải được thiết kế thon vừa phù hợp với khuôn bàn tay các bé.

Nhiều thiết kế ngộ nghĩnh, dễ thương để các bé dễ dàng lựa chọn.', N'Được làm từ sợi ni lông bền chắc , an toàn. 

Nhựa y tế , sáp , hương liệu.

', 10, N'Hộp 50 cái', N'CSRM           ', 18730, N'NTP            ', NULL, N'P01756C_2_l.jpeg                                  ', N'18.730', N'ban chai oral')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01773H_1_l         ', N'Xà phòng cục Coast Classic Scent Refreshing Deodorant Soap', N'Xà phòng tắm hoặc rửa tay chân', N'Nghệ, Aqua, Paraffin Oil, Vitamin E, B2, Nano bạc, glyceryl...', 0, N'Gói 2 cái', N'CSSD           ', 15950, N'BTP            ', N'NCC3           ', N'P01773H_1_l.jpeg                                  ', N'15.950', N'xa phong tam coast classic')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P01787H_1_l         ', N'Bông tẩy trang Merilynn 60 miếng', N'Tầy trang và rửa mặt hằng ngày', N'Soap, Water, Glycerin, Tallow Acid, Coconut Acid, Sodium Chloride,…', 30, N'Tuýp 20g', N'CSSD           ', 19890, N'BTP            ', N'NCC3           ', N'P01787H_1_l.jpeg                                  ', N'19.890', N'bong tay trang merilynn')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P02320H_1_l         ', N'Nước súc miệng diệt khuẩn Pierrot 15ml', N'Nước súc miệng diệt khuẩn Chlorexidine Pierrot được chế tạo đặc biệt với Chlorhexidine 0.12% có khả năng diệt vi khuẩn đường miệng giúp bảo vệ lợi, điều trị nha nhu, viêm nướu và Florua ngăn ngừa tích tụ mảng bám cao răng và chống sâu răng hiệu quả. Sản phẩm cho răng miệng thơm tho  với hương bạc hà tươi mát. ', N'Aqua, xylitol, alcohol, PEG-40 hydrogenated, castrol oil, glycrerin, aroma, sodium saccharin, menthol, triclosan, ', 50, N'Chai 15ml', N'CSRM           ', 11600, N'NTP            ', NULL, N'P02320H_1_l.jpeg                                  ', N'11.600', N'nuoc suc mieng pierrot')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P02790H_1_l         ', N'Gel rửa tay khô iCare 100ml', N'Rửa tay', N'Silver Nano, Ethanol 96%, Glyxeen, Hương trà xanh, nước tinh khiết.', 6, N'Chai 100ml', N'CSCT           ', 52800, N'BTP            ', N'NCC5           ', N'P02790H_1_l.jpeg                                  ', N'52.800', N'gel rua tay kho icare')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P02818C_1_l         ', N'Dung dịch nước rửa tay sát khuẩn Green Cross 500ml', N'Rửa tay sát khuẩn', N'Công thức độc đáo với chiết xuất Triclosan giúp bảo vệ da tay, diệt khuẩn hữu hiệu. Vitamin E giúp da tay được giữ ẩm và chống lão hóa.', 3, N'Chai 500ml', N'CSCT           ', 108000, N'BTP            ', N'NCC5           ', N'P02818C_1_l.jpeg                                  ', N'108.000', N'nuoc rua tay green cross')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P02832C_1_l         ', N'Dung dịch lau làm sạch và khử khuẩn bề mặt ALFASEPT SURFACE-RTU 750ml ', N'Sát khuẩn làm sạch dụng cụ', N'Didecyl dimethyl ammonium chloride, Poly(hexamethylenebiguanide) hydrochloride, Ethanol', 16, N'Chai 750ml', N'DCYT           ', 200000, N'BTP            ', N'NCC4           ', N'P02832C_1_l.jpeg                                  ', N'200.000', N'dung dich lam sach alfasept')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P02834C_1_l         ', N'Gel Rửa Tay Khô On1 100ml Hương Fresh Sakura', N'Rửa tay', N'Ethanol, nước, glycerin, carbomer, hương liệu', 5, N'Tuýp 20g', N'CSSD           ', 22230, N'BTP            ', N'NCC3           ', N'P02834C_1_l.jpeg                                  ', N'22.230', N'gel rua tay kho on1')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'P02842H_1_l         ', N'Nhiệt kế điện tử đo trán YASEE YASEE FT-100B', N'Đo nhiệt độ cơ thể khi sốt', N'Không có', 16, N'Hộp 1 máy', N'DCYT           ', 1300200, N'BTP            ', N'NCC4           ', N'P02842H_1_l.jpeg                                  ', N'1.300.200', N'nhiet ke dien tu yasee')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'sara1234            ', N'Thuốc giảm đau- hạ sốt Siro Sara 120mg', N'Thuốc giảm đau- hạ sốt Siro Sara 120mg có tác dụng: Hạ sốt, giảm đau nhức thông thường & khó chịu trong các trường hợp cảm lạnh, cúm, mọc răng, đau răng, đau đầu, đau tai, đau sau tiêm chủng, viêm họng.', N'Dung dịch Sorbitol, Xanthan Gum, Natri Saccharin, Natri dihydro phosphate, Màu đỏ Carmoisin, Hương dâu tây, Glycerin, Magnesi nhôm silicat, Simethicon emulsion 30% w/w, Natri methylparaben, Natri propylparaben, Acid phosphoric, Nước tinh khiết.', 60, N'Chai 60ml', N'TTGD           ', 23000, N'NTP            ', N'NCC2           ', N'sara.jpeg                                         ', N'23.000', N'thuoc ha sot siro saga')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'sara12345           ', N'Thuốc giảm đau- hạ sốt Siro Sara 250mg', N'Thuốc giảm đau- hạ sốt Siro Sara 250mg có tác dụng: Hạ sốt, giảm đau nhức thông thường & khó chịu trong các trường hợp cảm lạnh, cúm, mọc răng, đau răng, đau đầu, đau tai, đau sau tiêm chủng, viêm họng.', N'Dung dịch Sorbitol, Xanthan Gum, Natri Saccharin, Natri dihydro phosphate, Màu đỏ Carmoisin, Hương dâu tây, Glycerin, Magnesi nhôm silicat, Simethicon emulsion 30% w/w, Natri methylparaben, Natri propylparaben, Acid phosphoric, Nước tinh khiết.', 60, N'Chai 60ml', N'TTGD           ', 26000, N'NTP            ', N'NCC2           ', N'sara1.jpeg                                        ', N'26.000', N'thuoc ha sot siro saga')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'tangco1234          ', N'Sữa Tăng Cơ Prostar 100% Whey Protein Chocolate 454g', N'Prostar Whey 100% Protein giúp chắc cơ, tăng cơ, giảm mỡ bao gồm 25g Protein chất lượng cao trong một khẩu phần.

Hàm lượng BCAAs (6g) hỗ trợ tăng cơ, xây dựng và phục hồi cơ.

Cung cấp nguồn năng lượng và kiểm soát nhiều tiến trình phát triển của cơ thể.

Mùi vị cực ngon, dễ hòa tan trong nước.', N'Protein 25g (50%), Cholesterol 20 mg (7%), Sodium 30mg(1%), Calcium 20%,…', 20, N'Hộp ', N'TPCN           ', 635560, N'NTP            ', N'NCC2           ', N'tangco.jpeg                                       ', N'635.000', N'sua tang co prostar vi choco')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'tangco12345         ', N'Sữa Tăng Cơ Prostar 100% Whey Protein Vanilla 454g', N'Prostar Whey 100% Protein giúp chắc cơ, tăng cơ, giảm mỡ bao gồm 25g Protein chất lượng cao trong một khẩu phần.

Hàm lượng BCAAs (6g) hỗ trợ tăng cơ, xây dựng và phục hồi cơ.

Cung cấp nguồn năng lượng và kiểm soát nhiều tiến trình phát triển của cơ thể.

Mùi vị cực ngon, dễ hòa tan trong nước.', N'Protein 25g (50%), Cholesterol 20 mg (7%), Sodium 30mg(1%), Calcium 20%,…', 20, N'Hộp', N'TPCN           ', 635600, N'NTP            ', N'NCC2           ', N'suatangco.jpeg                                    ', N'653.600', N'sua tang co prostar vi vani')
INSERT [dbo].[THUOC] ([MaThuoc], [TenThuoc], [CongDung], [ThanhPhan], [SoLuongTon], [DangThuoc], [MaLoaiThuoc], [DonGia], [MaHangSX], [MaNhaCungCap], [UrlImage], [Tien], [TimKiem]) VALUES (N'tra1234             ', N'Trà thảo mộc giảm cân Lanui', N'Kích thích đốt cháy mỡ thừa giúp giảm cân, làm săn chắc cơ bắp

Cải thiện quá trình chuyển hóa lipid, giảm rối loạn lipit máu

Tăng cường tiêu hóa, giúp cơ thể đào thải độc tố

Tăng cường hoạt động trao đổi chất trong cơ thể

Phòng ngừa các bệnh liên quan đến béo phì như tim mạch, tiểu đường, thoái hóa khớp gối, suy giãn hệ tĩnh mạch chi dưới.', N'Hoạt chất chính: Lá Sen, Sơn Tra.', 20, N'Hộp 20 gói', N'TPCN           ', 100000, N'NTP            ', N'NCC2           ', N'tragiamcan.jpeg                                   ', N'100.000', N'tra thao moc giam can lanui')
ALTER TABLE [dbo].[CHITIETHOADON]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETHOADON_HOADON] FOREIGN KEY([MaHoaDon])
REFERENCES [dbo].[HOADON] ([MaHoaDon])
GO
ALTER TABLE [dbo].[CHITIETHOADON] CHECK CONSTRAINT [FK_CHITIETHOADON_HOADON]
GO
ALTER TABLE [dbo].[CHITIETHOADON]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETHOADON_THUOC] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[THUOC] ([MaThuoc])
GO
ALTER TABLE [dbo].[CHITIETHOADON] CHECK CONSTRAINT [FK_CHITIETHOADON_THUOC]
GO
ALTER TABLE [dbo].[CHITIETHOADON]  WITH CHECK ADD  CONSTRAINT [FK_CHITIETHOADON_THUOC1] FOREIGN KEY([MaThuoc])
REFERENCES [dbo].[THUOC] ([MaThuoc])
GO
ALTER TABLE [dbo].[CHITIETHOADON] CHECK CONSTRAINT [FK_CHITIETHOADON_THUOC1]
GO
ALTER TABLE [dbo].[THUOC]  WITH CHECK ADD  CONSTRAINT [FK_THUOC_HANGSANXUAT] FOREIGN KEY([MaHangSX])
REFERENCES [dbo].[HANGSANXUAT] ([MaHangSX])
GO
ALTER TABLE [dbo].[THUOC] CHECK CONSTRAINT [FK_THUOC_HANGSANXUAT]
GO
ALTER TABLE [dbo].[THUOC]  WITH CHECK ADD  CONSTRAINT [FK_THUOC_LOAITHUOC] FOREIGN KEY([MaLoaiThuoc])
REFERENCES [dbo].[LOAITHUOC] ([MaLoaiThuoc])
GO
ALTER TABLE [dbo].[THUOC] CHECK CONSTRAINT [FK_THUOC_LOAITHUOC]
GO
ALTER TABLE [dbo].[THUOC]  WITH CHECK ADD  CONSTRAINT [FK_THUOC_NHACUNGCAP] FOREIGN KEY([MaNhaCungCap])
REFERENCES [dbo].[NHACUNGCAP] ([MaNhaCungCap])
GO
ALTER TABLE [dbo].[THUOC] CHECK CONSTRAINT [FK_THUOC_NHACUNGCAP]
GO
USE [master]
GO
ALTER DATABASE [CNWeb_Pharmacy] SET  READ_WRITE 
GO
