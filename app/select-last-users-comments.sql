# запрос к СУБД MySQL, который выберет из базы имена пользователей и 
# их последние комментарии (по одному комментарию на каждого пользователя)
# --------------
select 
	u.name,	
	c.text
	
from 
	users as u
join(
	select 
		c.user_id,
		max(c.id) as cid
	from comments as c
	group by
		c.user_id
	) as t on
	t.user_id = u.id
join comments as c on
	c.id = t.cid

group by
	u.id

order by 
	u.id

