# Day 08


### Goals
* Find out how many managers the most over-managed employee has (levels deep).
* Go through all employees and find out who their manager is, and who their manager's manager is, etc.
* Produce a report that calculates this mangement depth for all employees and find the one with the highest total number of levels of all staff.

### Challenges
This was a doozy! I haven't worked with Recursive CTE or cardinality before. I found this resource invaluable to understanding: [Recursive CTE case study to traverse an employee hierarchy](https://docs.yugabyte.com/preview/api/ysql/the-sql-language/with-clause/emps-hierarchy/). 

I unioned in a non-recurive table to a table that treats employees from prevoius iterations as managers and joins these with their reports (if any) using the `CARDINALITY()` function. I captured this in a recursive CTE using the `RECURSIVE PATHS()` function.

I was able to capture the depth of each employee using the `CARDINALITY()` function.

##### Raw Data Example
```
INSERT INTO staff (staff_id, staff_name, manager_id) VALUES
    (1, 'Santa Claus', NULL),         -- CEO level
    (2, 'Head Elf Operations', 1),    -- Department Head
    (3, 'Head Elf Logistics', 1),     -- Department Head
    (4, 'Senior Toy Maker', 2),       -- Team Lead
    (5, 'Senior Gift Wrapper', 2),    -- Team Lead
    (6, 'Inventory Manager', 3),      -- Team Lead
    (7, 'Junior Toy Maker', 4),       -- Staff
    (8, 'Junior Gift Wrapper', 5),    -- Staff
    (9, 'Inventory Clerk', 6),        -- Staff
    (10, 'Apprentice Toy Maker', 7);  -- Entry Level
```

##### Code Sample
```
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
```

### Skills Used
**RECURSIVE CTE &nbsp;&nbsp; | &nbsp;&nbsp; CARDINALITY**  
