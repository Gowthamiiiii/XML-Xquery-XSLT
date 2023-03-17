



let $x := doc("movies.xml")/mdb/performers/performer
for $item in $x
where count($item/actedin/movie) >= 10 and count($item/actedin/movie) >=2
return <performer title="{data($item/name)}"/>