# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

room_group = RoomGroup.new(property_id:10, order: 120, room_title: 'Great rooms', house_rule: 'New house role', house_manual: 'New house manual', description: 'New description', size: 1024.25, room_type: 'Single occupancy', maximum_guests: 2, beds: 1, bedrooms: 1, bathrooms: 1, bathtubs: 1, base_inventories: 4, is_shared_bath: false, law_type: 'vacation_rental_law', is_open: true, is_edit_complete: true, opened_at: 15.days.ago)

room_1 = Room.create(room_group: room_group, code: 'M001', notification_date: 2.days.ago, name: 'new room 1', hash_name: 'New hash name 1', lodging_operator_name: 'John Smith', is_open: true)

room_2 = Room.create(room_group: room_group, code: 'M002', notification_date: 2.days.ago, name: 'new room 2', hash_name: 'New hash name 2', lodging_operator_name: 'John Smith', is_open: true)

room_3 = Room.create(room_group: room_group, code: 'M003', notification_date: 2.days.ago, name: 'new room 3', hash_name: 'New hash name 3', lodging_operator_name: 'John Smith', is_open: true)

room_4 = Room.create(room_group: room_group, code: 'M004', notification_date: 2.days.ago, name: 'new room 4', hash_name: 'New hash name 4', lodging_operator_name: 'John Smith', is_open: true)

reservation_1 = Reservation.create(room_group: room_group, reference_code: 'ref_code_1', status: 'reserved', checkin: 2.days.ago, checkout: 1.days.ago, checkin_time: 14, site_code: 'new_site_code_1', sales_code: 'vacationstay', external_reservation_id: 'new_external_reservation_id_1', user_id: 1004, user_name: 'Kiran Kumar', user_phone_number: '9845098450', user_email: 'kiran_kumar@gmail.com', user_prefecture: 'new_user_prefecture_1', accommodation_fee: 1800, service_fee: 180, service_fee_for_cancellation: 200, service_fee_rate: 10, sales_fee: 20, cleaning_fee: 10, discount_by_coupon: 5, consumption_tax: 2, local_tax: 6, total_price: 2500, cancel_fee: 150, remarks: 'new_remark_1', payment_type: 'credit_card', currency: 'INR', local_total_price:6, total_stay_adults: 2, total_stay_children: 0, total_stay_infants: 0, host_actioned_at: 2.days.before, settled_at: 1.days.before)

reservation_2 = Reservation.create(room_group: room_group, reference_code: 'ref_code_2', status: 'reserved', checkin: 2.days.ago, checkout: 1.days.ago, checkin_time: 14, site_code: 'new_site_code_2', sales_code: 'vacationstay', external_reservation_id: 'new_external_reservation_id_2', user_id: 1005, user_name: 'Raju MK', user_phone_number: '9845098451', user_email: 'raju_mk@gmail.com', user_prefecture: 'new_user_prefecture_2', accommodation_fee: 1800, service_fee: 180, service_fee_for_cancellation: 200, service_fee_rate: 10, sales_fee: 20, cleaning_fee: 10, discount_by_coupon: 5, consumption_tax: 2, local_tax: 6, total_price: 2500, cancel_fee: 150, remarks: 'new_remark_2', payment_type: 'credit_card', currency: 'INR', local_total_price:6, total_stay_adults: 2, total_stay_children: 0, total_stay_infants: 0, host_actioned_at: 2.days.before, settled_at: 1.days.before)

reservation_3 = Reservation.create(room_group: room_group, reference_code: 'ref_code_3', status: 'reserved', checkin: 2.days.ago, checkout: 1.days.ago, checkin_time: 14, site_code: 'new_site_code_2', sales_code: 'vacationstay', external_reservation_id: 'new_external_reservation_id_3', user_id: 1006, user_name: 'Santosh Patil', user_phone_number: '9845098450', user_email: 'santosh_patil@gmail.com', user_prefecture: 'new_user_prefecture_3', accommodation_fee: 1800, service_fee: 180, service_fee_for_cancellation: 200, service_fee_rate: 10, sales_fee: 20, cleaning_fee: 10, discount_by_coupon: 5, consumption_tax: 2, local_tax: 6, total_price: 2500, cancel_fee: 150, remarks: 'new_remark_3', payment_type: 'credit_card', currency: 'INR', local_total_price:6, total_stay_adults: 2, total_stay_children: 0, total_stay_infants: 0, host_actioned_at: 2.days.before, settled_at: 1.days.before)

reservation_4 = Reservation.create(room_group: room_group, reference_code: 'ref_code_4', status: 'reserved', checkin: 2.days.ago, checkout: 1.days.ago, checkin_time: 14, site_code: 'new_site_code_4', sales_code: 'vacationstay', external_reservation_id: 'new_external_reservation_id_4', user_id: 1007, user_name: 'Ravi Kiran', user_phone_number: '9845098450', user_email: 'ravi_kiran@gmail.com', user_prefecture: 'new_user_prefecture_4', accommodation_fee: 1800, service_fee: 180, service_fee_for_cancellation: 200, service_fee_rate: 10, sales_fee: 20, cleaning_fee: 10, discount_by_coupon: 5, consumption_tax: 2, local_tax: 6, total_price: 2500, cancel_fee: 150, remarks: 'new_remark_4', payment_type: 'credit_card', currency: 'INR', local_total_price:6, total_stay_adults: 2, total_stay_children: 0, total_stay_infants: 0, host_actioned_at: 2.days.before, settled_at: 1.days.before)

reservation_assignment_1 = ReservationAssignment.create(reservation: reservation_1, room: room_1, date: reservation_1.checkout, status: 'stay', adults: reservation_1.total_stay_adults, children: reservation_1.total_stay_children, infants: reservation_1.total_stay_infants, room_price: reservation_1.total_price)

reservation_assignment_2 = ReservationAssignment.create(reservation: reservation_2, room: room_2, date: reservation_2.checkout, status: 'stay', adults: reservation_2.total_stay_adults, children: reservation_2.total_stay_children, infants: reservation_2.total_stay_infants, room_price: reservation_2.total_price)

reservation_assignment_3 = ReservationAssignment.create(reservation: reservation_3, room: room_3, date: reservation_3.checkout, status: 'stay', adults: reservation_3.total_stay_adults, children: reservation_3.total_stay_children, infants: reservation_3.total_stay_infants, room_price: reservation_3.total_price)

reservation_assignment_4 = ReservationAssignment.create(reservation: reservation_4, room: room_4, date: reservation_4.checkout, status: 'stay', adults: reservation_4.total_stay_adults, children: reservation_4.total_stay_children, infants: reservation_4.total_stay_infants, room_price: reservation_4.total_price)
