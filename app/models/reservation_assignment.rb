class ReservationAssignment < ApplicationRecord
  # Associations
  belongs_to  :reservation
  belongs_to  :room

  # Validations
  validates   :reservation,
              :room,
              :status,
              presence: true
  
  validates   :adults,
              :children,
              :infants,
              :room_price,
              numericality: { greater_than_or_equal_to: 0 }      

  # Class Methods 
  def self.completed_reservations_before(number_of_days)
    number_of_days = ActiveRecord::Base::sanitize_sql(number_of_days)
    joins("
    INNER JOIN
      reservations 
      ON reservation_assignments.reservation_id = reservations.id 
      AND reservations.status = 'reserved'").joins("
      INNER JOIN
        room_groups 
        ON room_groups.id = reservations.room_group_id").joins("
        INNER JOIN
          rooms 
          ON rooms.id = reservation_assignments.room_id 
          AND reservation_assignments.status = 'stay' 
          AND reservation_assignments.date = DATE_SUB(CURRENT_DATE, INTERVAL #{number_of_days.to_s} DAY) 
          AND room_groups.law_type = 'vacation_rental_law' 
          AND reservations.sales_code = 'vacationstay'").select("reservation_assignments.id, rooms.code as license, reservation_assignments.date as checkout_date")
  end
end
