USE [DoctorWho]
GO

select * from tblDoctor;

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