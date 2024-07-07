CREATE PROC ps_dangnhap
@user nvarchar(50),
@pass nvarchar(50),
@permiss nvarchar(50)

as
BEGIN
	SELECT * FROM TaiKhoanDN WHERE sTaiKhoan = @user AND sMatKhau = @pass
	SELECT * FROM Quyen WHERE TenQuyen = @permiss
END