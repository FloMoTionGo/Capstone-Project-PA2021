# Capstone Project PA2021
| eMobility availability at VBB Point Of Interests |

## Idea ##

combine seemingly unrelated Data sources:
+ measure of traffic at VBB POIs
+ availability of eMobility vehicles
+ weather, 
+ public holidays

_Use measure of traffic at VBB POIs and eMobility supply at VBB POIs at set times of day and connect with weather / public holiday data to enable more insights_

## Details

### Progress - 15.11.21
* setup capstone project virtual env
  * ```virtualenv capstone```
* get VBB stations lat & lon
  * ```npm install -g vbb-stations-cli```
  * [VBB Stations CLI](https://www.npmjs.com/package/vbb-stations-cli)
* select "interesting" stations
* use REST API to get data about arriving trains
  * ```curl 'https://v5.vbb.transport.rest/journeys?from=900000058101&to=900000110005&departure=tomorrow+2pm&results=2' -s | jq```
  * get occupancy info from data stream as a measure of traffic / interest at the station

## Functionality
##### acquire data from DB, API, queue/tracker, scraper
* Connectors
  * TIER API, access requested
  * VBB API
    * [VBB Stations CLI](https://www.npmjs.com/package/vbb-stations-cli)
    * [VBB REST API](https://github.com/derhuerst/vbb-rest/blob/5/docs/getting-started.md)
* get daily data from eMobility Provider e.g. eScooters
##### ETL it, automated
* makefile for E
* dbt for TL
  * load into analysisDB
##### DWH it, maybe plain vanilla ML 
* GCP
##### deploy in cloud 
* tbd
##### CD/CI it 
* tbd
##### serve data to humans or machines 
* Tableau or html
  * query analysisDB for "Story" of selected eMobility vessel at selected VBB POI

---

##### Possible other Purposes / Train of Thoughts
+ more scooters to place A if rain is incoming
+ scooter usage while raining is low
+ places of scooter clusters per time of day
+ suggest charging station distribution
+ use coordinates to see distribution in bouroughs/selected area
+ show parameters per scooter 
  + from, to, last time used
+ "Story" of a selected scooter - depending on data provided
  + in vicinity - 5km!
  + avg km driven per trip
  + caretakers so far
  + standing alone in the rain for days
  + being with my buddies in sunshine/rain etc
  + public holidays alone / in vicinity of other eMobility vessel
