# Day 01


### Goals
Parse out wished for item(s) and favorite color(s) per child from wish lists stored in JSON. 
Map difficulty and workshop needed using a CASE statement.
Return first 5 children ASC.

### Challenges
I haven't worked with JSON in SQL before, so needed to do some research to figure out how to parse and extract items stored in a JSON format. I found this [JSON Functions](https://neon.tech/postgresql/postgresql-json-functions) reference site helpful.

##### Raw Data Example
```
INSERT INTO wish_lists VALUES
  (1, 1, '{"first_choice": "bike", "second_choice": "blocks", "colors": ["red", "blue"]}', '2024-11-01'),
  (2, 2, '{"first_choice": "doll", "second_choice": "books", "colors": ["pink", "purple"]}', '2024-11-02'),
  (3, 3, '{"first_choice": "blocks", "second_choice": "bike", "colors": ["green"]}', '2024-11-03');
```

##### Code Sample
```
SELECT
  -- extract value from key matching 'first_choice'
  wishes->>'first_choice' as primary_wish,
  -- extract value from key matching 'second_choice'
  wishes->>'second_choice' as backup_wish,
  -- extract first value from key matching 'colors'
  wishes->'colors'->>0 as favorite_color,

  -- count number of values from key matching 'colors'
  jsonb_array_length((wishes->'colors')::jsonb) as color_count
		
FROM wish_lists w
```

### Skills Used
**JSON &nbsp;&nbsp; | &nbsp;&nbsp; JOIN &nbsp;&nbsp; | &nbsp;&nbsp; CASE**  
