select * from olympic_analysis.athlete_events;

#1 Find sports or event Thailand has won the highest medal? 
select event,count(Medal)
from olympic_analysis.athlete_events
where team = 'Thailand'
and Medal <> 'NA'
group by event
order by count(Medal) desc;

#2 Identify the sports or event which was played most consecutively in the summer Olympics games
select event,count(Event)
from olympic_analysis.athlete_events
where Season = 'Summer'
group by event
order by count(Event) desc;

#3 fectch the details of the all the countries which have won most number of silver and bronze medals and at least one gold medal
select team,sum(Silver),
		sum(Bronze),
        sum(Gold)
from(
select *,
		case Medal when 'silver' then 1 else 0 end as Silver,
        case Medal when 'Bronze' then 1 else 0 end as Bronze,
        case Medal when 'Gold' then 1 else 0 end as Gold
from olympic_analysis.athlete_events
) innerT
group by Team
having sum(Gold) > 0
order by sum(Silver) desc;

#4 Which player has won maximum number of gold
select Name,
		sum(Gold)
from(
select *,
		case Medal when 'Gold' then 1 else 0 end as Gold
from olympic_analysis.athlete_events ) innerT
group by Name
order by sum(Gold) desc;

#5 Which sport has maximum events
select Sport,count(*)
from olympic_analysis.athlete_events
group by Sport
order by count(*) desc;

#6 Which year has maximuum events
select year,count(event)
 from olympic_analysis.athlete_events
 group by year
 order by count(event) desc;



