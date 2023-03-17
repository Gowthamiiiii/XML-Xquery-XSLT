



let $x := doc("movies.xml")/mdb/movies/movie

for $item in $x
where data($item/genres/genre) = "Crime"
return 
<movie title="{data($item/title)}" year="{data($item/year)}"></movie>
