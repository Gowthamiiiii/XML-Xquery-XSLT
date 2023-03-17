let $x := doc("movies.xml")/mdb/performers/performer
let $y := doc("movies.xml")/mdb/performers/performer
let $data:=
for $item in $x
for $item1 in $y
where $item1/directed/movie = $item/actedin/movie and $item1/dob > $item/dob
return $item1/name
let $distinctname := distinct-values($data)
return for $name in $distinctname return <performer>{ $name }</performer>