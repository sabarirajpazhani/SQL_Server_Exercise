USE [DoctorWho]
GO

select * from tblEpisode;

--First (if you haven't already done so) run the script shown above to generate the Doctor Who training database.
--Write a SELECT statement in SQL to list out all of the episodes which featured Matt Smith as the Doctor:
create procedure spDoctorWho
as
begin
	select e.SeriesNumber as Series,
		   e.EpisodeNumber as Episode,
		   e.Title,
		   e.EpisodeDate as Date_of_episode,
		   d.DoctorName
	from tblEpisode e
	join tblDoctor d on e.DoctorId = d.DoctorId
	where d.DoctorName = 'Matt Smith'
end


exec spDoctorWho


--Creating a Stored Procedure
--Add the following at the start of your SQL to store it as a stored procedure:
--CREATE PROC spMattSmithEpisodes
--Run your stored procedure to show that it lists out 44 films.  Now change your script so that it alters the stored procedure to list out only those episodes featuring Matt Smith made in 2012, using this syntax in the WHERE clause:
create Procedure spMattSmithEpisodes
as
begin
	select e.SeriesNumber as Series,
		   e.EpisodeNumber as Episode,
		   e.Title,
		   e.EpisodeDate as Date_of_episode,
		   d.DoctorName
	from tblEpisode e
	join tblDoctor d on e.DoctorId = d.DoctorId
	where d.DoctorName = 'Matt Smith' AND year(EpisodeDate) = 2012;
end

exec spMattSmithEpisodes;


--Using the tblAuthor and tblEpisode tables, create a stored procedure called spMoffats to list out the 32 episodes written by Steven Moffat in date order (with the most recent first):
create procedure spMoffats
as
begin 
	select e.Title from tblEpisode e
	join tblAuthor a on a.AuthorId = e.AuthorId
	where a.AuthorName = 'Steven Moffat'
	ORDER BY e.Title 
	offset 0 rows
	fetch next 32 rows only;
end

exec spMoffats

--Now amend your SQL so that it creates a different stored procedure called spRussell, listing out the 30 episodes penned by people called Russell:

create procedure spRussell
as
begin 
	select e.Title from tblEpisode e
	join tblAuthor a on a.AuthorId = e.AuthorId
	where a.AuthorName = 'Russell'
	ORDER BY e.Title 
	offset 0 rows
	fetch next 30 rows only;
end

exec spMoffats
