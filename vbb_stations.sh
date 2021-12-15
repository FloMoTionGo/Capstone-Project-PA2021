now_date=`date +"%H%y%m%d"`

# Get Data from selected Station ID
# 900160004 S+U Lichtenberg
curl -X 'GET' 'https://v5.vbb.transport.rest/stops/900160004/arrivals?duration=10&linesOfStops=false&remarks=true&language=en' -H 'accept: application/json' | json2csv > $now_date"_vbb_arrival_data.csv"
#900068201 S+U Tempelhof
curl -X 'GET' 'https://v5.vbb.transport.rest/stops/900068201/arrivals?duration=10&linesOfStops=false&remarks=true&language=en' -H 'accept: application/json' | json2csv >> $now_date"_vbb_arrival_data.csv"
#900016101 U Gneisenaustr.
curl -X 'GET' 'https://v5.vbb.transport.rest/stops/900016101/arrivals?duration=10&linesOfStops=false&remarks=true&language=en' -H 'accept: application/json' | json2csv >> $now_date"_vbb_arrival_data.csv"
#900062782 S+U Rathaus Steglitz
curl -X 'GET' 'https://v5.vbb.transport.rest/stops/900062782/arrivals?duration=10&linesOfStops=false&remarks=true&language=en' -H 'accept: application/json' | json2csv >> $now_date"_vbb_arrival_data.csv"

echo "VBB Stops"
