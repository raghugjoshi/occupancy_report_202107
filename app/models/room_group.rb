class RoomGroup < ApplicationRecord

	# Validations
	validates 	:room_title,
							:house_rule,
							:house_manual,
							:description,
							:room_type,
							:law_type,
							presence: true

	validates		:order,
							:maximum_guests,
							:beds,
							:bedrooms,
							:bathrooms,
							:bathtubs,
							:base_inventories,
							numericality: { only_integer: true, greater_than: 0 }

	validates		:size,
							numericality: { greater_than: 0 }								

	validates		:is_shared_bath,
							:is_open,
							:is_edit_complete,
							inclusion: { in: [true, false] }

end
