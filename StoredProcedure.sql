USE [Music_01]

select * from Album;

--Write a script to create a stored procedure called usp_Number_1_Albums which returns the following columns from the Album table where the US_Billboard_200_peak equals 1.
create procedure usp_Number_1_Albums
as
begin
	select Title, Release_date, [US_sales_(m)] from Album
	where US_Billboard_200_peak = 1;
end

exec usp_Number_1_Albums

--Change the CREATE PROC statement to an ALTER PROC statement and sort the albums in descending order of US sales.
alter procedure usp_Number_1_Albums
as
begin
	select Title,Release_date, [US_sales_(m)] from Album
	where US_Billboard_200_peak = 1
	order by [US_sales_(m)] desc;
end;
exec usp_Number_1_Albums

--Create a query to return the following columns from the Album, Artist and Subgenre tables for albums in the Rock and roll subgenre.
create procedure spSubgenreInRockAndRoll
as
begin
	select A.Title, AR.Artist, S.Subgenre, A.Release_date, A.US_Billboard_200_peak from Album A
	join Artist AR on AR.Artist_ID = A.Artist_ID
	join Subgenre S on S.Subgenre_ID = A.Subgenre_ID
	where Subgenre = 'Rock and roll'
	order by A.Title;
end

exec spSubgenreInRockAndRoll;

--Add a CREATE PROC statement to the query to create a stored procedure called usp_Rock_and_Roll_Albums.
--Execute the script to create the procedure and then execute the procedure to see its results.
--Alter the procedure to return the extra columns

sp_rename 'spSubgenreInRockAndRoll', 'usp_Rock_and_Roll_Albums'

alter procedure usp_Rock_and_Roll_Albums
as
begin
	select A.Title, 
		   AR.Artist,
		   AR.Artist_type, 
		   S.Subgenre,
		   A.Release_date,
		   A.[US_sales_(m)], 
		   A.US_Billboard_200_peak 
	from Album A
	join Artist AR on AR.Artist_ID = A.Artist_ID
	join Subgenre S on S.Subgenre_ID = A.Subgenre_ID
	WHERE S.Subgenre= 'Rock and roll'
	order by A.Title;
end

exec usp_Rock_and_Roll_Albums
	
