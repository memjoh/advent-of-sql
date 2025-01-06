with recursive paths(path) as (
    select array[staff_id]
    from staff
    where manager_id is null

    union all

    select p.path||e.staff_id
    from staff as e
    inner join paths as p on e.manager_id = p.path[cardinality(path)]
)

select 
	cardinality(path) as depth, 
	path 
from paths 
order by depth desc;
