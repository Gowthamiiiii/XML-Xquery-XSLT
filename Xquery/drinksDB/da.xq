





let $x := doc("drinks.xml")/pubsData/likes/like[@dname="Donald"]
let $y := doc("drinks.xml")/pubsData/serves/serve

for $item in $y
where data($item/rname) = $x/rname
return <bname>{data($item/@bname)}</bname>

