# Day 03


### Goals
* Parse out guest and menu information from dinner party details stored in different XML schemeas.
* Parse each schema and find popular menu entries with large crowds.
* Extract the items and detemine which dishes were served most often across all of the dinners.

### Challenges
I haven't worked with XML schemas in SQL before, so needed to do some research to figure out how to parse and extract items stored in that format. I found this [XML Data Type](https://neon.tech/postgresql/postgresql-tutorial/postgresql-xml-data-type#creating-indexes-for-xml-data) reference site helpful. `XPATH` was used to extract the necessary information.

##### Raw Data Example
```
INSERT INTO christmas_menus (id, menu_data) VALUES
(2, '<menu version="2.0">
    <total_guests>85</total_guests>
    <dishes>
        <dish_entry>
            <food_item_id>101</food_item_id>
        </dish_entry>
        <dish_entry>
            <food_item_id>102</food_item_id>
        </dish_entry>
    </dishes>
</menu>');
```

##### Code Sample
```
select 
		id, 
		unnest(xpath('//food_item_id/text()', menu_data::xml))::text::int AS food_item_id,
		COALESCE(
			NULLIF((xpath('string(//total_count)', menu_data::xml)::text[])[1], '')::int,
			NULLIF((xpath('string(//total_present)', menu_data::xml)::text[])[1], '')::int,
			NULLIF((xpath('string(//headcount)', menu_data::xml)::text[])[1], '')::int,
			NULLIF((xpath('string(//total_guests)', menu_data::xml)::text[])[1], '')::int
		) as guest_count
	from christmas_menus
```

### Skills Used
**XML &nbsp;&nbsp; | &nbsp;&nbsp; ARRAY**  
