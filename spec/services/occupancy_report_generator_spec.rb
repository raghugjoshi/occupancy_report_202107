require 'rails_helper'

RSpec.describe OccupancyReportGenerator, type: :model do
  describe 'OccupancyReportGenerator' do
    let(:room_group) { FactoryBot.create(:room_group) }

    let(:room_1) { FactoryBot.create(:room, room_group: room_group, code: 'M001') }
    let(:room_2) { FactoryBot.create(:room, room_group: room_group, code: 'M002') }
    let(:room_3) { FactoryBot.create(:room, room_group: room_group, code: 'M003') }
    let(:room_4) { FactoryBot.create(:room, room_group: room_group, code: 'M004') }

    let(:reservation_1) { FactoryBot.create(:reservation, room_group: room_group, reference_code: 'reference_code_1') }
    let(:reservation_2) { FactoryBot.create(:reservation, room_group: room_group, reference_code: 'reference_code_2') }
    let(:reservation_3) { FactoryBot.create(:reservation, room_group: room_group, reference_code: 'reference_code_3') }
    let(:reservation_4) { FactoryBot.create(:reservation, room_group: room_group, reference_code: 'reference_code_4', checkin: 5.days.ago, checkout: 2.days.ago) }

    let!(:reservation_assignment_1) { FactoryBot.create(:reservation_assignment, reservation: reservation_1, room: room_1, date: reservation_1.checkout, adults: reservation_1.total_stay_adults, children: reservation_1.total_stay_children, infants: reservation_1.total_stay_infants, room_price: reservation_1.total_price) }

    let!(:reservation_assignment_2) { FactoryBot.create(:reservation_assignment, reservation: reservation_2, room: room_2, date: reservation_2.checkout, status: 'stay', adults: reservation_2.total_stay_adults, children: reservation_2.total_stay_children, infants: reservation_2.total_stay_infants, room_price: reservation_2.total_price) }

    let!(:reservation_assignment_3) { FactoryBot.create(:reservation_assignment, reservation: reservation_3, room: room_3, date: reservation_3.checkout, status: 'stay', adults: reservation_3.total_stay_adults, children: reservation_3.total_stay_children, infants: reservation_3.total_stay_infants, room_price: reservation_3.total_price) }

    let!(:reservation_assignment_4) { FactoryBot.create(:reservation_assignment, reservation: reservation_4, room: room_4, date: reservation_4.checkout, status: 'stay', adults: reservation_4.total_stay_adults, children: reservation_4.total_stay_children, infants: reservation_4.total_stay_infants, room_price: reservation_4.total_price) }

    describe "#completed_reservations_before" do 
      it 'has completed reservations today' do
        OccupancyReportGenerator.generate
        file = File.open(File.join(Rails.root, "occupancy_report_#{Date.today.strftime("%Y-%m-%d")}.csv"))
        expect(File.exist?(file)).to be true
      end
    end
  end
end