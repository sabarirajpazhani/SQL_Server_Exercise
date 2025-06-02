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
