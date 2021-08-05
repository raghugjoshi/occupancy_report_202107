class Room < ApplicationRecord
  # Associations
  belongs_to :room_group

  # Validations
  validates :code, 
            :name,
            :hash_name,
            :lodging_operator_name,
            :notification_date,
            presence: true

  validates :is_open,
            inclusion: { in: [true, false] }

end
