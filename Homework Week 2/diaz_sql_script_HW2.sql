#Question 1

#23 airplanes have listed speeds.
select speed, count(*) from planes where speed is not null;

#Minimum listed speed = 90 
select min(speed) from planes;

#Maximum listed speed = 432
select max(speed) from planes;

#Question 2
#total distance flown = 350217607
select sum(distance) from flights where year= 2013;

#Total distance flown by planes missing a tailnumber = 1784167
select sum(distance) from flights where year= 2013 and tailnum is null;

#Question 3 
#total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer.
select manufacturer, sum(distance) from planes inner join flights on planes.tailnum = flights.tailnum where flights.year = 2013 and day = 5 and month = 7 group by manufacturer;

#Same as above using LEFT OUTER JOIN
select manufacturer, sum(distance) from planes left outer join flights on planes.tailnum = flights.tailnum where flights.year = 2013 and day = 5 and month = 7 group by manufacturer;

#Question #4
#Frequency of airline and plane type for all flights in December 2013. 
select count(*), airlines.name, planes.type from flights left join planes on flights.tailnum = planes.tailnum 
left join airlines on flights.carrier=airlines.carrier
where flights.year = 2013 and flights.month = 12
 group by planes.type, airlines.name
 order by count(*) desc;


