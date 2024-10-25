CREATE PROCEDURE sp_AddNewBorrower @id INT, @FirstName varchar(20), @LastName varchar(20),@Email varchar(30),@DateOfBirth DATE,@MembershipDate DATE
AS
	IF NOT EXISTS (SELECT 1 FROM BORROWERS WHERE EMAIL = @Email)
		INSERT INTO BORROWERS(BORROWERID,FIRST_NAME,LAST_NAME,EMAIL,DATE_OF_BIRTH,MEMPERSHIP_DATE) VALUES(@id,@FirstName,@LastName,@Email,@DateOfBirth,@MembershipDate)
	ELSE
		SELECT ERROR_PROCEDURE() AS ErrorProcedure;  

	
GO

SELECT * FROM BORROWERS WHERE BORROWERID =999999;
EXEC sp_AddNewBorrower @ID=999999, @firstName='mohammad' , @lastName='Qadumy',@Email='mohammadqadumy@gmail.com',@DateOfBirth='2001-01-05',@MembershipDate='2024-10-25';

DROP PROCEDURE sp_AddNewBorrower;
GO