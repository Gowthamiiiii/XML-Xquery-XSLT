



let $x := doc("movies.xml")/mdb/performers/performer
for $item in $x
return <performer title="{data($item/name)}" year="{count($item/actedin/movie)}"/>