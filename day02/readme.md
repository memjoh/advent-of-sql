# Day 02


### Goals
FInd the message hidden in the code by:
1. Concatenating all rows into a single cell.
2. Converting numbers to letters.
3. Removing special characters (noise) in the data.

### Challenges
I shockingly wasn't aware of the SQL `CHR` or `ASCII` functions. This [SQL CHR](https://www.sqltutorial.org/sql-string-functions/sql-chr/) reference site provided more details.

`REGEX` will always be my nemesis so was grateful to get an assist from [this Quoara response](https://www.quora.com/What-does-this-regex-a-zA-Z-s-actually-mean-in-Java) on how to remove all of the special characters.

```
-- remove unneeded special characters
WHERE REGEXP_REPLACE(value, '[^a-zA-Z\s,.!]+', '') <> ''
```

`[^a-zA-Z\s,.!]+` removes anything that doesn't match a letter a through z, A through Z, a space indicated by `\s`, a period, a comma, or an exclamation point.

### Skills Used
**ASCII &nbsp;&nbsp; | &nbsp;&nbsp; STRING_AGG &nbsp;&nbsp; | &nbsp;&nbsp; REGEXP_REPLACE &nbsp;&nbsp; | &nbsp;&nbsp; UNION**  
