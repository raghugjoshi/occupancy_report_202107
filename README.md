# README

Create a report for JTA
JTA wants every travel operator handling vacation rental to report daily about the number of days of reservation for each registered vacation rental.
The data is to be prepared as a csv file in Shift JIS format and uploaded via SFTP.
JTA will then combine the data and inform us which listing have to be closed because they crossed  the 180 day limit.

- Read data from DB and output csv file whose format is same with the query
- Please refer to schema.rb
- Create only required models and jobs for outputing data
- Make sure if your code becomes same results with queries which we shared
- Write specs to cover your code

- Create a daily job
- Triggering part and uploaded via SFTP is also is out of scope


Sample Query

```
SELECT 
    reservations.reference_code,
    room_groups.origin_id AS room_group,
    rooms.code as license,
    reservations.checkin,
    reservations.checkout,
    reservation_assignments.date
FROM reservations
JOIN reservation_assignments ON reservation_assignments.reservation_id = reservations.id AND reservation_assignments.status = "stay"
JOIN room_groups ON room_groups.id = reservations.room_group_id
JOIN rooms ON rooms.id = reservation_assignments.room_id
AND reservations.status = 'reserved'
AND room_groups.law_type = "vacation_rental_law"
AND reservations.sales_code = "vacationstay"
AND reservations.checkout BETWEEN Date('{{daterange.start}}') AND Date('{{daterange.end}}')
```
