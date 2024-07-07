use SQL_QLTD
-- create table
CREATE TABLE Projects (
    ProjectID CHAR(10) PRIMARY KEY,
    ProjectName NVARCHAR(100) NOT NULL,
    ProjectDescription NVARCHAR(500),
		StartDate DATE,
		EndDate DATE
);

CREATE TABLE Tasks (
    TaskID CHAR(10) PRIMARY KEY,
    TaskName NVARCHAR(100) NOT NULL,
    TaskDescription NVARCHAR(500),
    DueDate DATE,
    Status NVARCHAR(50) NOT NULL,
    ProjectID CHAR(10) FOREIGN KEY REFERENCES Projects(ProjectID),
    Priority NVARCHAR(50),  -- Added Priority column
    EstimatedEffort INT     -- Added EstimatedEffort column
);

CREATE TABLE Employees (
    EmployeeID CHAR(10) PRIMARY KEY ,
    EmployeeName NVARCHAR(100) NOT NULL,
    EmployeeEmail NVARCHAR(100) NOT NULL,
    EmployeeRole NVARCHAR(50) NOT NULL
);

CREATE TABLE TaskAssignments (
    TaskID CHAR(10) FOREIGN KEY REFERENCES Tasks(TaskID),
    EmployeeID CHAR(10) FOREIGN KEY REFERENCES Employees(EmployeeID),
    PRIMARY KEY (TaskID, EmployeeID)
);

CREATE TABLE Users (
    UserID CHAR(10) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL UNIQUE,
    PasswordHash CHAR(64) NOT NULL,
    EmployeeID CHAR(10) FOREIGN KEY REFERENCES Employees(EmployeeID)
);

CREATE TABLE TaskComments (
    CommentID INT PRIMARY KEY IDENTITY(1, 1),
    CommentText NVARCHAR(MAX) NOT NULL,
    CommentedBy CHAR(10) FOREIGN KEY REFERENCES Employees(EmployeeID),
    TaskID CHAR(10) FOREIGN KEY REFERENCES Tasks(TaskID),
    CommentedOn DATETIME DEFAULT GETUTCDATE()
);

-- add data
INSERT INTO Projects (ProjectID, ProjectName, ProjectDescription, StartDate, EndDate) 
VALUES
  ('PRJ-0011', N'Hệ thống Quản lý Khách hàng', N'Phát triển hệ thống để quản lý thông tin và tương tác với khách hàng', '2024-07-10', '2024-12-24'),
  ('PRJ-0012', N'Trang web Thương mại Điện tử', N'Tạo trang web cho bán hàng trực tuyến', '2024-08-01', '2025-01-31'),
  ('PRJ-0013', N'Ứng dụng Quản lý Kho', N'Phát triển ứng dụng để theo dõi và quản lý hàng tồn kho', '2024-09-15', '2025-02-28'),
  ('PRJ-0014', N'Hệ thống Phân tích Dữ liệu', N'Triển khai hệ thống để phân tích dữ liệu kinh doanh', '2024-10-05', '2025-03-31'),
  ('PRJ-0015', N'Công cụ Hỗ trợ Nhân viên', N'Tạo công cụ để hỗ trợ nhân viên làm việc hiệu quả hơn', '2024-11-20', '2025-04-30'),
  ('PRJ-0016', N'Hệ thống Quản lý Nhân sự', N'Phát triển hệ thống để quản lý thông tin và quy trình nhân sự', '2024-12-12', '2025-05-27'),
  ('PRJ-0017', N'Nâng cấp Hệ thống Mạng', N'Cải thiện hiệu suất và bảo mật của hệ thống mạng', '2025-01-10', '2025-06-24'),
  ('PRJ-0018', N'Triển khai Hệ thống Bảo mật', N'Nâng cao an ninh mạng và bảo vệ dữ liệu', '2025-02-05', '2025-07-22'),
  ('PRJ-0019', N'Phát triển Phần mềm Di động', N'Tạo ứng dụng di động cho các dịch vụ nội bộ', '2025-03-15', '2025-08-20'),
  ('PRJ-0020', N'Tự động hóa Quy trình Công việc', N'Tự động hóa các quy trình thủ công để nâng cao hiệu quả', '2025-04-04', '2025-09-16');

INSERT INTO Tasks (TaskID, TaskName, TaskDescription, DueDate, Status, ProjectID, Priority, EstimatedEffort)
VALUES
  ('TSK-0011', N'Thiết kế Giao diện Khách hàng', N'Thiết kế giao diện người dùng cho hệ thống CRM', '2024-08-15', N'Đang tiến hành', 'PRJ-0011', N'Cao', 60),
  ('TSK-0012', N'Phát triển Cấu trúc Dữ liệu', N'Tạo cấu trúc cơ sở dữ liệu cho trang web thương mại điện tử', '2024-09-30', N'Cần làm', 'PRJ-0012', N'Cao', 80),
  ('TSK-0013', N'Tích hợp Hệ thống', N'Kết nối ứng dụng quản lý kho với các hệ thống khác', '2024-11-15', N'Chưa bắt đầu', 'PRJ-0013', N'Trung bình', 40),
  ('TSK-0014', N'Phân tích Dữ liệu Kinh doanh', N'Phân tích dữ liệu bán hàng và marketing', '2024-12-20', N'Chưa bắt đầu', 'PRJ-0014', N'Cao', 70);
  
INSERT INTO Employees (EmployeeID, EmployeeName, EmployeeEmail, EmployeeRole)
VALUES
  ('EMP-0011', N'Nguyễn Thị Lan', 'lan_nguyen@gmail.com', 'Developer'),
  ('EMP-0012', N'Trần Văn Minh', 'minh_tran@yahoo.com', 'Tester'),
  ('EMP-0013', N'Lê Thị Hoa', 'hoa_le@hotmail.com', 'Project Manager'),
  ('EMP-0014', N'Đỗ Kim Tuyết', 'tuyet_do@outlook.com', 'Designer'),
  ('EMP-0015', N'Phạm Minh Tuấn', 'tuan_pham@icloud.com', 'Business Analyst'),
  ('EMP-0016', N'Huỳnh Thị Thu', 'thu_huynh@gmail.com', 'Marketing Specialist'),
  ('EMP-0017', N'Vũ Kim Long', 'long_vu@yahoo.com', 'Sales Representative'),
  ('EMP-0018', N'Nguyễn Trọng Hùng', 'hung_nguyen@hotmail.com', 'System Administrator'),
  ('EMP-0019', N'Bùi Thị Lan Anh', 'lan_anh_bui@outlook.com', 'Content Writer'),
  ('EMP-0020', N'Trần Minh Đức', 'duc_tran@icloud.com', 'Database Administrator');

INSERT INTO TaskAssignments (TaskID, EmployeeID)
VALUES
  ('TSK-0011', 'EMP-0011'),
  ('TSK-0011', 'EMP-0014'),
  ('TSK-0012', 'EMP-0012'),
  ('TSK-0013', 'EMP-0012'),
  ('TSK-0013', 'EMP-0013'),
  ('TSK-0014', 'EMP-0015'),
  ('TSK-0014', 'EMP-0011'),
  ('TSK-0013', 'EMP-0014'),
  ('TSK-0012', 'EMP-0015'),
  ('TSK-0011', 'EMP-0018'),
  ('TSK-0011', 'EMP-0019'),
  ('TSK-0013', 'EMP-0018'),
  ('TSK-0013', 'EMP-0020'),
  ('TSK-0013', 'EMP-0011'),
  ('TSK-0011', 'EMP-0012'),
  ('TSK-0013', 'EMP-0015'),
  ('TSK-0014', 'EMP-0019');

INSERT INTO Users (UserID, Username, PasswordHash, EmployeeID)
VALUES
  ('USR-0011', 'admin2', 'admin123', 'EMP-0013'),
  ('USR-0012', 'developer2', 'dev123', 'EMP-0011'),
  ('USR-0013', 'tester2', 'test123', 'EMP-0012'),
  ('USR-0014', 'project_manager2', 'project123', 'EMP-0013'),
  ('USR-0015', 'designer2', 'design123', 'EMP-0014'),
  ('USR-0016', 'analyst2', 'analyst123', 'EMP-0015'),
  ('USR-0017', 'marketing2', 'market123', 'EMP-0016'),
  ('USR-0018', 'sales2', 'sale123', 'EMP-0017'),
  ('USR-0019', 'admin23', 'admin123', 'EMP-0018'),
  ('USR-0020', 'content2', 'content123', 'EMP-0019'),
  ('USR-0021', 'database2', 'database123', 'EMP-0020');

INSERT INTO TaskComments (CommentText, CommentedBy, TaskID, CommentedOn)
VALUES
  (N'Đã bắt đầu phát triển giao diện.', 'EMP-0011', 'TSK-0011', '2024-06-27 13:50:00'),
  (N'Cần làm rõ yêu cầu cho tính năng quản lý kho.', 'EMP-0015', 'TSK-0013', '2024-06-27 13:55:00'),
  (N'Gửi bản thiết kế giao diện đầu tiên cho phản hồi.', 'EMP-0014', 'TSK-0011', '2024-06-27 14:00:00'),
  (N'Hoàn thành thử nghiệm đơn vị cho module B.', 'EMP-0012', 'TSK-0014', '2024-06-27 14:05:00'),
  (N'Bắt đầu viết nội dung cho trang web.', 'EMP-0019', 'TSK-0012', '2024-06-27 14:10:00'),
  (N'Chuẩn bị tài liệu hướng dẫn sử dụng cho người dùng.', 'EMP-0011', 'TSK-0014', '2024-06-27 14:15:00'),
  (N'Hoàn thành triển khai hệ thống trên môi trường thử nghiệm.', 'EMP-0013', 'TSK-0014', '2024-06-27 14:20:00'),
  (N'Cập nhật tài liệu phân tích dữ liệu với các phát hiện mới.', 'EMP-0015', 'TSK-0014', '2024-06-27 14:25:00'),
  (N'Bắt đầu phát triển chức năng mới cho ứng dụng di động.', 'EMP-0011', 'TSK-0012', '2024-06-27 14:30:00'),
  (N'Phê duyệt yêu cầu thay đổi cho quy trình công việc.', 'EMP-0015', 'TSK-0012', '2024-06-27 14:35:00');

-- truy vấn
SELECT * FROM Projects;

SELECT p.ProjectName, p.ProjectID
FROM Projects p
JOIN Tasks t ON p.ProjectID = t.ProjectID
JOIN TaskAssignments ta ON t.TaskID = ta.TaskID
JOIN Employees e ON ta.EmployeeID = e.EmployeeID
WHERE e.EmployeeID = 'EMP-0011';

SELECT t.TaskName, t.TaskID, p.ProjectName
FROM Employees e
JOIN TaskAssignments ta ON e.EmployeeID = ta.EmployeeID
JOIN Tasks t ON t.TaskID = ta.TaskID
JOIN Projects p ON p.ProjectID = t.ProjectID
WHERE e.EmployeeID = 'EMP-0011';

SELECT t.TaskName, t.TaskID, p.ProjectName, t.Status, t.DueDate, ta.EmployeeID
FROM Tasks t
JOIN Projects p ON p.ProjectID = t.ProjectID
LEFT JOIN TaskAssignments ta ON t.TaskID = ta.TaskID
ORDER BY p.ProjectName, t.TaskID;




  



