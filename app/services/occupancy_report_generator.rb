require 'csv'

class OccupancyReportGenerator
	def self.generate(options = { col_sep: ',', encoding: 'Shift_JIS', headers: true })
		completed_reservations = ReservationAssignment.completed_reservations_before(1)
		if completed_reservations.present?
			attributes = ['id', 'License', 'Checkout Date']

			file_path = File.join(Rails.root, "occupancy_report_#{Date.today.strftime("%Y-%m-%d")}.csv")

			CSV.open(file_path, 'w', **options) do |csv|
				csv << attributes
				ReservationAssignment.completed_reservations_before(1).each do |completed_reservation|
					csv << completed_reservation.attributes.values
				end
			end
		end
	end
end
