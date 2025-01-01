dateid=$(date "+%m%d")
while IFS= read -r toottext; do
echo "$toottext"
curl --silent --header "Authorization: Bearer YOUR_TOKEN_HERE" https://mstdn.social/api/v1/statuses --form "status=$toottext"
done < <(sqlite3 komousi_popravili.sqlite "select toottext from vrazdy where tootdateid='$dateid';")

