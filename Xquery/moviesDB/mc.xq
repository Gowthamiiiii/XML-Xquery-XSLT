



let $x := doc("movies.xml")/mdb/movies/movie
for $item in $x
where data($item/cast/performer/actor/@idref) = "jamescaan"
return <movie title="{data($item/title)}" year="{data($item/year)}"></movie>