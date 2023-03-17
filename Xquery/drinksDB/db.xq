let $x := doc("drinks.xml")/pubsData/likes/like
let $y := doc("drinks.xml")/pubsData/serves/serve
let $z := doc("drinks.xml")/pubsData/frequents/freq
for $item3 in $z
let $person2Name := $item3[@dname]
let $barCount := $person2Name/bname
for $item2 in $x
let $personName := $item2[@dname]
let $array := array {
for $item at $i in $y
let $barName := $item/@bname
where data($item/rname) = data($personName/rname) and $person2Name/@dname = $personName/@dname and data($item3/bname) = $barName
return if($barName)
then $i
else ()
}
return if(array:size($array) >= 1)
then <dname>{$item3/@dname}</dname>
else ()