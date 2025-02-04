CREATE DATABASE CAPSTONE2
GO 

USE CAPSTONE2
GO


-- Thay đổi kiểu dữ liệu của Pass trong bảng SL_Auth
ALTER TABLE SL_Auth
DROP CONSTRAINT ck_Pass;

ALTER TABLE SL_Auth
ALTER COLUMN Pass NVARCHAR(MAX);

---------------------------------------------------
CREATE TABLE Like_Post (
	LikeID char(5),
	CMND_UserInfo char(8),
	CONSTRAINT pk_LikeID PRIMARY KEY (LikeID),
	CONSTRAINT CMND_UserInfo FOREIGN KEY (CMND_UserInfo) REFERENCES SL_UserInfo(CMND_UserInfo)
)

ALTER TABLE Like_Post
ADD PostDocID char(5)

ALTER TABLE Like_Post
ADD CONSTRAINT fk_PostDocID FOREIGN KEY (PostDocID) REFERENCES Post_Doc(PostDocID);

CREATE TABLE SL_Auth (
	Code_User char(11),
	Pass nvarchar(100),
	CONSTRAINT pk_Code_User PRIMARY KEY (Code_User),
	CONSTRAINT ck_Pass CHECK (Pass > 10),
)

CREATE TABLE SL_UserInfo (
	Name_UserInfo nvarchar(150),
	Code_User char(11), -- MSSV
	Sex_UserInfo nvarchar(10),
	DateBirth_UserInfo date,
	CMND_UserInfo char(8),
	Email_UserInfo nvarchar(100),
	CONSTRAINT pk_CMND_UserInfo PRIMARY KEY (CMND_UserInfo),
	CONSTRAINT ck_DateBirth_UserInfo CHECK (DateBirth_UserInfo > '1995-01-01'),
	CONSTRAINT fl_Code_User FOREIGN KEY (Code_User) REFERENCES SL_Auth(Code_User),
	CONSTRAINT ck_Sex_UserInfo CHECK (Sex_UserInfo IN ('NAM','NU','Other'))
)

CREATE TABLE Doc (
	DocumentID_Doc char(5),
	Name_Doc nvarchar(500),
	Code_User char(11),
	File_Doc varbinary(max),
	CONSTRAINT pk_DocumentID_Doc PRIMARY KEY (DocumentID_Doc),
	CONSTRAINT fk_Code_User FOREIGN KEY (Code_User) REFERENCES SL_Auth(Code_User),
)

CREATE TABLE Relationship (
	RelationshipID char(5),
	Code_User_1 char(11),
	Code_User_2 char(11),
	Status_Relationship nvarchar(100),
	CONSTRAINT ck_RelationshipID PRIMARY KEY (RelationshipID),
	CONSTRAINT fk_Code_User_1 FOREIGN KEY (Code_User_1) REFERENCES SL_Auth(Code_User),
	CONSTRAINT fk_Code_User_2 FOREIGN KEY (Code_User_2) REFERENCES SL_Auth(Code_User),
	CHECK (Code_User_1 <> Code_User_2),
	CHECK (Status_Relationship IN ('friends', 'not friends'))
)

-- Thêm cột RelationshipID vào bảng SL_UserInfo
ALTER TABLE SL_UserInfo
ADD RelationshipID char(5);

-- Thiết lập khóa ngoại cho cột RelationshipID trong bảng SL_UserInfo
ALTER TABLE SL_UserInfo
ADD CONSTRAINT fk_RelationshipID FOREIGN KEY (RelationshipID) REFERENCES Relationship(RelationshipID);

CREATE TABLE Post_Doc (
	PostDocID char(5),
	Topic nvarchar(1000),
	Content nvarchar(1000),
	Class_Doc nvarchar(15),
	TimePost_Doc timestamp,
	NameLecturers_Doc nvarchar(100),
	Description_Doc nvarchar(2000),
	CMND_UserInfo char(8),
	File_Doc varbinary(max),
	DocumentID_Doc char(5),
	CommentID char(5),
	CONSTRAINT pk_PostDocId PRIMARY KEY (PostDocID),
	CONSTRAINT fk_DocumentID_Doc FOREIGN KEY (DocumentID_Doc) REFERENCES Doc(DocumentID_Doc),
	CONSTRAINT fk_CMND_UserInfo FOREIGN KEY (CMND_UserInfo) REFERENCES SL_UserInfo(CMND_UserInfo)
)


ALTER TABLE Post_Doc
ADD LikeID char(5)

ALTER TABLE Post_Doc
ADD CONSTRAINT fk_LikeID FOREIGN KEY (LikeID) REFERENCES Like_Post(LikeID);


-- Thay đổi kiểu dữ liệu
ALTER TABLE Post_Doc
DROP COLUMN TimePost_Doc;

ALTER TABLE Post_Doc
ADD TimePost_Doc datetime;

CREATE TABLE Comment(
	 CommentID char(5),
	 CMND_UserInfo char(8),
	 Content TEXT,
	 CONSTRAINT pk_CommentID PRIMARY KEY (CommentID),
	 CONSTRAINT fk_Comment_CMND_UserInfo FOREIGN KEY (CMND_UserInfo) REFERENCES SL_UserInfo(CMND_UserInfo)
)


---------------------------------------------------------------
---------------------------------------------------------------


-------------------------------- PROC
CREATE PROC sp_Login
@code_user char(11),
@pass nvarchar(max)
AS 
	BEGIN 
		Select * from SL_Auth where Code_User = @code_user and Pass = @pass
	END;

-- THỰC THI PROC sp_login
exec sp_login
@code_user='26211236188', @pass='Minh2/9/2011'


-------------------------------- câu lệnh hiển thị tên người dùng khi đăng nhập bằng code 
SELECT A.Code_User, U.Name_UserInfo
FROM SL_Auth A, SL_UserInfo U
WHERE A.Code_User = U.Code_User 


--------------------------------- chèn dữ liệu cho doc
DECLARE @doc VARBINARY(MAX);
Select @doc = bulkColumn
From OPENROWSET(BULK N'D:\triếthọc.docx', SINGLE_BLOB) AS Document
INSERT INTO Doc (DocumentID_Doc, Name_Doc, Code_User, File_Doc) VALUES('DC001', N'Tài liệu ôn tập môn triết', '26211236188', @doc);



DECLARE @doc VARBINARY(MAX);
Select @doc = bulkColumn
From OPENROWSET(BULK N'D:\tinhoc.docx', SINGLE_BLOB) AS Document
INSERT INTO Doc (DocumentID_Doc, Name_Doc, Code_User, File_Doc) VALUES('DC002', N'Tài liệu ôn tập môn tin học', '11111111111', @doc);


DECLARE @doc VARBINARY(MAX);
Select @doc = bulkColumn
From OPENROWSET(BULK N'D:\Vật lí.docx', SINGLE_BLOB) AS Document
INSERT INTO Doc (DocumentID_Doc, Name_Doc, Code_User, File_Doc) VALUES('DC003', N'Tài liệu ôn tập môn tin học', '26211236188', @doc);


---------------------------------- Search
CREATE PROCEDURE SP_searchDocument
@name_doc nvarchar(500)
AS 
BEGIN
	Select * from  Doc Where 
	(Name_Doc = @name_doc OR @name_doc IS NULL)
END
GO


--------------------------------- chèn dữ liệu cho Post_Doc
DECLARE @doc VARBINARY(MAX);
Select @doc = bulkColumn
From OPENROWSET(BULK N'D:\triếthọc.docx', SINGLE_BLOB) AS Document
INSERT INTO Post_Doc(PostDocID,Topic, Class_Doc, NameLecturers_Doc, Description_Doc,CMND_UserInfo, File_Doc, DocumentID_Doc, CommentID, TimePost_Doc) 
VALUES('PS001', N'Tài liệu môn Triết',N'CMU_303S', N'Nguyễn Văn A', N'Đây chỉ là tài liệu có đề chứ không có đáp án', 20186342, @doc ,'DC001', 'CM001',CURRENT_TIMESTAMP);



DECLARE @doc VARBINARY(MAX);
Select @doc = bulkColumn
From OPENROWSET(BULK N'D:\tinhoc.docx', SINGLE_BLOB) AS Document
INSERT INTO Post_Doc(PostDocID,Topic, Class_Doc, NameLecturers_Doc, Description_Doc,CMND_UserInfo, File_Doc, DocumentID_Doc, CommentID, TimePost_Doc) 
VALUES('PS002', N'Doc of Tin học',N'CS 303 BIS', N'Trần Gê Tời', N'Ôn nè mấy em ơi', 42824924, @doc ,'DC002', 'CM002',CURRENT_TIMESTAMP);





--------------------------------- Hàm show bài post
Select P.PostDocID,D.Name_Doc, U.Name_UserInfo, P.TimePost_Doc, P.Description_Doc, P.File_Doc
From SL_UserInfo U, Post_Doc P, Doc D
Where U.CMND_UserInfo = P.CMND_UserInfo AND
	  U.Code_User = D.Code_User AND
	  D.File_Doc = P.File_Doc
	  

---------------------------------- Đếm số Like
Select P.PostDocID,D.Name_Doc, U.Name_UserInfo, P.TimePost_Doc, P.Description_Doc, P.File_Doc, (Select Count(*) From Like_Post L Where L.PostDocID = P.PostDocID) AS TotalLike
From SL_UserInfo U, Post_Doc P, Doc D
Where U.CMND_UserInfo = P.CMND_UserInfo AND
	  U.Code_User = D.Code_User AND
	  D.File_Doc = P.File_Doc

---------------------------------- Show Comment
Select CommentID, CMND_UserInfo,Content From Comment

INSERT INTO SL_UserInfo(Name_UserInfo) VALUES('Stephen')
