class Reservation < ApplicationRecord

	EMAIL_FORMAT_REG_EXP = /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i
	PHONE_NUMBER_REG_EXP = /((\+*)((0[ -]+)*|(91 )*)(\d{12}+|\d{10}+))|\d{5}([- ]*)\d{6}/

	# Associations
	belongs_to :room_group

	# Validations
	validates 	:reference_code,
							:status,
							:site_code,
							:sales_code,
							:external_reservation_id,
							:user_name,
							:user_phone_number,
							:user_prefecture,
							:remarks,
							:payment_type,
							:currency,
							:cancelled_by,
							:user_email,
							presence: true

	validates	:user_email,
						format: { with: EMAIL_FORMAT_REG_EXP }
	
	validates	:user_phone_number,
						format: { with: PHONE_NUMBER_REG_EXP }													

	
	validates		:accommodation_fee,
							:service_fee,
							:service_fee_for_cancellation,
							:service_fee_rate,
							:sales_fee,
							:cleaning_fee,
							:discount_by_coupon,
							:consumption_tax,
							:local_tax,
							:total_price,
							:cancel_fee,
							:local_total_price,
							:total_stay_adults,
							:total_stay_children,
							:total_stay_infants,
							numericality: { greater_than_or_equal_to: 0 }
	
	validates		:checkin_time,
							numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 23 }
end
