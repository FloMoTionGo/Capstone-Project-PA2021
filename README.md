# Capstone Project PA2021

## Idea ##  
Combining data flows to draw conclusions from Berlin VBB Stations / POIs and eMobility availability at these locations.
Use measure of busyness at station and eMobility supply at these stations at set times of day and connect with weather / public holiday data to enable more insights

## Details ##

### Progress ###
* setup capstone project virtual env
  * ```virtualenv capstone```
* get VBB stations lat & lon
  * ```npm install -g vbb-stations-cli```
  * [VBB Stations CLI](https://www.npmjs.com/package/vbb-stations-cli)
* select "interesting" stations
* use REST API to get data about arriving trains
  * ```curl 'https://v5.vbb.transport.rest/journeys?from=900000058101&to=900000110005&departure=tomorrow+2pm&results=2' -s | jq```
  * get occupancy info from data stream as a measure of busyness at the station


--- 

**Topic**
eMobility / eScooter availability with Busyness at BVG stations / POI

**FUNCTIONALITY**
#### acquire data from DB, API, queue/tracker, scraper ####
  * TIER API, access requested
  * BVG API, access?
#### ETL it, automated ####
  * makefile for E
  * dbt for TL
#### DWH it, maybe plain vanilla ML ####
  * GCP
#### deploy in cloud ####
  * tbd
#### CD/CI it ####
  * tbd
#### serve data to humans or machines ####
  * Tableau


---

# Progress #
## Transportation | eMobility | Scooters in Berlin ##
### General Idea ###

combine seemingly unrelated Data sources:
+ charging stations,
+ weather, 
+ public holidays

### Possible Endpoint for Data Pipeline Purpose ###
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

### Workflow ###
+ get daily data from eMobility Provider e.g. eScooters
+ host somewhere, retention 1week
+ transform to analysisDB
+ query analysisDB for "Story" of selected eMobility vessel
