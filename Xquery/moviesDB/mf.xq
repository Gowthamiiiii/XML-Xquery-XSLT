



let $x := doc("movies.xml")/mdb/performers/performer
let $ages := 
for $item in $x
order by $item/dob descending
return data($item/dob)
for $item in $x
where $ages[1] = $item/dob
return <performer>{data($item/name)}</performer>