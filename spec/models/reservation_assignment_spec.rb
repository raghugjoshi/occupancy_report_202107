require 'rails_helper'

RSpec.describe ReservationAssignment, type: :model do
  describe 'ReservationAssignment' do
    let(:reservation_assignment) { FactoryBot.build(:reservation_assignment) }

    describe 'validations' do 
      before(:each) do
        expect(reservation_assignment).to be_valid
      end

      describe 'reservation' do 
        it 'validates reservation association with nil value' do
          reservation_assignment.reservation = nil
          expect(reservation_assignment).to be_invalid
        end
      end

      describe 'room' do 
        it 'validates room association with nil value' do 
          reservation_assignment.room = nil
          expect(reservation_assignment).to be_invalid
        end
      end

      describe 'status' do 
        it 'validates status with nil value' do 
          reservation_assignment.status = nil
          expect(reservation_assignment).to be_invalid
        end
      end

      describe 'adults' do 
        it 'validates adults with nil value' do 
          reservation_assignment.adults = nil
          expect(reservation_assignment).to be_invalid
        end

        it 'validates adults with non-numeric value' do 
          reservation_assignment.adults = nil
          expect(reservation_assignment).to be_invalid
        end
      end

      describe 'children' do 
        it 'validates children with nil value' do 
          reservation_assignment.children = nil
          expect(reservation_assignment).to be_invalid
        end

        it 'validates children with non-numeric value' do 
          reservation_assignment.children = nil
          expect(reservation_assignment).to be_invalid
        end
      end

      describe 'infants' do 
        it 'validates infants with nil value' do 
          reservation_assignment.infants = nil
          expect(reservation_assignment).to be_invalid
        end

        it 'validates infants with non-numeric value' do 
          reservation_assignment.infants = nil
          expect(reservation_assignment).to be_invalid
        end
      end

      describe 'room_price' do 
        it 'validates room_price with nil value' do 
          reservation_assignment.room_price = nil
          expect(reservation_assignment).to be_invalid
        end

        it 'validates room_price with non-numeric value' do 
          reservation_assignment.room_price = nil
          expect(reservation_assignment).to be_invalid
        end
      end
    end

    describe '#completed_reservations_before' do
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

      it 'has completed reservations of yesterday' do
        expect(ReservationAssignment.completed_reservations_before(1)).to be_present
      end

      it 'has 3 completed reservations of yesterday' do
        expect(ReservationAssignment.completed_reservations_before(1).size).to eq(3)
      end

      it 'has completed reservations with correct data' do
        completed_reservations = ReservationAssignment.completed_reservations_before(1)
        completed_reservations.each do |cr|
          expect(['M001', 'M002', 'M003']).to include(cr.license)
          expect(cr.checkout_date.strftime("%Y-%m-%d")).to eq('2021-08-04')
          expect(cr.license).to_not eq('M004')
        end

      end

      it 'has no completed reservations of 2 days before' do
        expect(ReservationAssignment.completed_reservations_before(2)).to be_present
      end
    end
  end
end
