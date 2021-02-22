# README

Create a report for JTA
JTA wants every travel operator handling vacation rental to report daily about the number of days of reservation for each registered vacation rental.
The data is to be prepared as a csv file in Shift JIS format and uploaded via SFTP.
JTA will then combine the data and inform us which listing have to be closed because they crossed  the 180 day limit.

- Read data from DB and output csv file
- Please refer to schema.rb
- Create only required models and jobs for output this data
- Make sure if your code becomes same results with queries which we shared
- Write specs to cover your code

- Create a daily job
- Triggering part and uploaded via SFTP is also is out of scope
- Create a CSV file whose format is same with the query
