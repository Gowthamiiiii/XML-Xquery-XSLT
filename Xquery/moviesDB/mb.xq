


let $y:= doc("movies.xml")/mdb/performers
let $x := doc("movies.xml")/mdb/movies/movie
let $data := for $item in $x
where data($item/directors/director/@idref) = data($item/cast/performer/actor/@idref)
let $id := data($item/directors/director/@idref)
return 
data($y/performer[@id=$id]/name)
let $distinctname := distinct-values($data)
return for $name in $distinctname return <actor>{ $name }</actor>
