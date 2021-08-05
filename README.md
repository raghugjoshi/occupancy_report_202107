# README

The application generates report of the "completed" reservations(i.e checkout date is in the past) every day. 

It has the service named
```
OccupancyReportGenerator.generate
```
which generates a CSV file containing list of completed reservations.

Cronjob can be created using the terminal in the application's root directory by running the following command
```
$ whenever --update-crontab --set environment=development
```
After running cronjob or specs it creates a csv file named "occupancy_report_yyyy_mm_dd.csv" in the application's home directory.
