lat=52.506731
lon=13.494930
# id=900160004
now_date="$(shell date +"%H%y%m%d")"

# add API key file to gitignore

# Get Data from both APIs
get_data: vbbstops_csv tier_data_csv
	mv *.json JSON_source
	mv *.csv CSV_source

	@echo "Data caught - $(now_date)"

# Get Data from selected Station ID
vbbstops_csv:
#vbbstops_csv: vbbstops.json
	# 900160004 S+U Lichtenberg
	curl -X 'GET' 'https://v5.vbb.transport.rest/stops/900160004/arrivals?duration=10&linesOfStops=false&remarks=true&language=en' -H 'accept: application/json' | json2csv > "$(now_date)_vbb_arrival_data.csv"
	#900068201 S+U Tempelhof
	curl -X 'GET' 'https://v5.vbb.transport.rest/stops/900068201/arrivals?duration=10&linesOfStops=false&remarks=true&language=en' -H 'accept: application/json' | json2csv >> "$(now_date)_vbb_arrival_data.csv"
	#900016101 U Gneisenaustr.
	curl -X 'GET' 'https://v5.vbb.transport.rest/stops/900016101/arrivals?duration=10&linesOfStops=false&remarks=true&language=en' -H 'accept: application/json' | json2csv >> "$(now_date)_vbb_arrival_data.csv"
	#900062782 S+U Rathaus Steglitz
	curl -X 'GET' 'https://v5.vbb.transport.rest/stops/900062782/arrivals?duration=10&linesOfStops=false&remarks=true&language=en' -H 'accept: application/json' | json2csv >> "$(now_date)_vbb_arrival_data.csv"

	@echo "VBB Stops"

# Get StationID from Lat/Lon
#vbbstops.json:
	# TODO add all stations in Lat Lon and append to JSON
#	curl "https://v5.vbb.transport.rest/stops/nearby?latitude=${lat}&longitude=${lon}" > $@

# Convert TIER JSON to CSV for easier import into DB
tier_data_csv: tier_data.json jq json2csv
	@echo "Tier Data"
#	cat tier_data.json | jq '.data[]' -c | json2csv -f id,attributes.lat,attributes.lng,attributes.vehicleType > "$(now_date)_tier_data.csv"

# Extract Scooter Location based on Lat/Lon
tier_data.json:
	curl -X 'GET' \
	"https://platform.tier-services.io/v2/vehicle?lat=${lat}&lng=${lon}&radius=500" \
	# TODO add API key to separate file
	-H 'X-Api-Key: bpEUTJEBTf74oGRWxaIcW7aeZMzDDODe1yBoSxi2' > $@

jq:
	wget https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
	mv jq-linux64 jq
	chmod 777 jq
#	touch $@

json2csv:
	wget https://github.com/jehiah/json2csv/releases/download/v1.2.1/json2csv-1.2.1.linux-amd64.go1.13.5.tar.gz
	tar -xzf json2csv-1.2.1.linux-amd64.go1.13.5.tar.gz 
	rm json2csv-1.2.1.linux-amd64.go1.13.5.tar.gz
	mv json2csv-1.2.1.linux-amd64.go1.13.5/json2csv .
	rmdir json2csv-1.2.1.linux-amd64.go1.13.5
	chmod 777 json2csv
#	touch $@


