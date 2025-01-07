# Day 04


### Goals
* Identify tags that are the same, added, or removed across fields.
* Return these differences as arrays.
* Find the item with the most added tags.

### Challenges
`UNNEST` provided some challenges but for the most part this was relatively straightforward. I used this function to parse out each individual tag from one field and used the `ANY` function to compare it to any of the items in the other field (with help from this guide on [Searching an Array](https://database.guide/4-ways-to-search-an-array-in-postgresql/)).

### Skills Used
**ARRAY &nbsp;&nbsp; | &nbsp;&nbsp; CTE**  
