FactoryBot.define do

  factory :room_group do
    property_id  { 10 }
    order  { 120 }
    room_title  { 'Great rooms' }
    house_rule  { 'New house role' }
    house_manual  { 'New house manual' }
    description  { 'New description' }
    size  { 1024.25 }
    room_type  { 'Single occupancy' }
    maximum_guests  { 2 }
    beds  { 1 }
    bedrooms  { 1 }
    bathrooms  { 1 }
    bathtubs  { 1 }
    base_inventories  { 4 }
    is_shared_bath  { false }
    law_type  { 'vacation_rental_law' }
    is_open  { true }
    is_edit_complete  { true }
    opened_at { 15.days.ago }  end

  factory :room do
    association :room_group
    code { 'M001' }
    notification_date { 2.days.ago }
    name { 'new room 1' }
    hash_name { 'New hash name 1' }
    lodging_operator_name { 'John Smith' }
    is_open { true }
  end

  factory :reservation do
    association :room_group
    reference_code {  'ref_code_1' }
    status { 'reserved' }
    checkin { 2.days.ago }
    checkout { 1.days.ago }
    checkin_time { 14 }
    site_code { 'new_site_code_1' }
    sales_code { 'vacationstay' }
    external_reservation_id { 'new_external_reservation_id_1' }
    user_id { 1006 }
    user_name { 'Kiran Kumar' }
    user_phone_number { '9845098450' }
    user_email { 'kiran_kumar@gmail.com' }
    user_prefecture { 'new_user_prefecture_1' }
    accommodation_fee { 1800 }
    service_fee { 180 }
    service_fee_for_cancellation { 200 }
    service_fee_rate { 10 }
    sales_fee { 20 }
    cleaning_fee { 10 }
    discount_by_coupon { 5 }
    consumption_tax { 2 }
    local_tax { 6 }
    total_price { 2500 }
    cancel_fee { 150 }
    remarks { 'new_remark_1' }
    payment_type { 'credit_card' }
    currency { 'INR' }
    local_total_price { 6 }
    total_stay_adults { 2 }
    total_stay_children { 0 }
    total_stay_infants { 0 }
    host_actioned_at { 2.days.before }
    settled_at { 1.days.before }
    cancelled_by { 'John Smith'}
  end

  factory :reservation_assignment do
    association :reservation
    association :room
    date { reservation.checkout } 
    status { 'stay' }  
    adults { reservation.total_stay_adults }
    children { reservation.total_stay_children } 
    infants { reservation.total_stay_infants } 
    room_price { reservation.total_price }
  end
end
