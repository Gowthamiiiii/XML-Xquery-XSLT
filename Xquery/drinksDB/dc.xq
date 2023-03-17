





let $z := doc("drinks.xml")/pubsData/frequents/freq
for $item2 in $z
where data($item2/bname) = data($z[@dname="Donald"]/bname) and data($item2/@dname) != "Donald"
return <dname>{data($item2/@dname)}</dname>