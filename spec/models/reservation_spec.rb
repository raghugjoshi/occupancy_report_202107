require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'Reservation' do
    let(:reservation) { FactoryBot.build(:reservation) }

    describe 'validations' do 
      before(:each) do 
        expect(reservation).to be_valid
      end

      describe 'room_group' do 
        it 'validates room_group association with nil value' do
          reservation.room_group = nil
          expect(reservation).to be_invalid
        end
      end

      describe 'reference_code' do 
        it 'validates reference_code with nil value' do 
          reservation.reference_code = nil
          expect(reservation).to be_invalid
        end
      end

      describe 'status' do 
        it 'validates status with nil value' do 
          reservation.status = nil
          expect(reservation).to be_invalid
        end
      end

      describe 'checkin_time' do 
        it 'validates checkin_time with nil value' do 
          reservation.checkin_time = nil
          expect(reservation).to be_invalid
        end

        it 'validates checkin_time within 24 hrs value' do
          reservation.checkin_time = 29
          expect(reservation).to be_invalid
        end
      end

      describe 'site_code' do 
        it 'validates site_code with nil value' do 
          reservation.site_code = nil
          expect(reservation).to be_invalid
        end
      end

      describe 'external_reservation_id' do 
        it 'validates external_reservation_id with nil value' do 
          reservation.external_reservation_id = nil
          expect(reservation).to be_invalid
        end
      end

      describe 'user_name' do 
        it 'validates user_name with nil value' do 
          reservation.user_name = nil
          expect(reservation).to be_invalid
        end
      end

      describe 'user_phone_number' do 
        it 'validates user_phone_number with nil value' do 
          reservation.user_phone_number = nil
          expect(reservation).to be_invalid
        end

        it 'validates user_phone_number with invalid value' do 
          reservation.user_phone_number = 'adsadsad112'
          expect(reservation).to be_invalid
        end
      end

      describe 'user_email' do 
        it 'validates user_email with nil value' do 
          reservation.user_email = nil
          expect(reservation).to be_invalid
        end

        it 'validates user_email with invalid email value' do 
          reservation.user_email = 'sfdsfdsfs'
          expect(reservation).to be_invalid
        end
      end

      describe 'user_prefecture' do 
        it 'validates user_prefecture with nil value' do 
          reservation.user_prefecture = nil
          expect(reservation).to be_invalid
        end
      end

      describe 'accommodation_fee' do 
        it 'validates accommodation_fee with nil value' do 
          reservation.accommodation_fee = nil
          expect(reservation).to be_invalid
        end

        it 'validates accommodation_fee with non-numeric value' do 
          reservation.accommodation_fee = 'sfsadf'
          expect(reservation).to be_invalid
        end
      end

      describe 'service_fee' do 
        it 'validates service_fee with nil value' do 
          reservation.service_fee = nil
          expect(reservation).to be_invalid
        end

        it 'validates service_fee with non-numeric value' do 
          reservation.service_fee = 'fdsfsdf'
          expect(reservation).to be_invalid
        end
      end

      describe 'service_fee_for_cancellation' do 
        it 'validates service_fee_for_cancellation with nil value' do 
          reservation.service_fee_for_cancellation = nil
          expect(reservation).to be_invalid
        end

        it 'validates service_fee_for_cancellation with non-numeric value' do 
          reservation.service_fee_for_cancellation = 'fdsfsdf'
          expect(reservation).to be_invalid
        end
      end

      describe 'service_fee_rate' do 
        it 'validates service_fee_rate with nil value' do 
          reservation.service_fee_rate = nil
          expect(reservation).to be_invalid
        end

        it 'validates service_fee_rate with non-numeric value' do 
          reservation.service_fee_rate = 'fdsfsdf'
          expect(reservation).to be_invalid
        end
      end

      describe 'sales_fee' do 
        it 'validates sales_fee with nil value' do 
          reservation.sales_fee = nil
          expect(reservation).to be_invalid
        end

        it 'validates sales_fee with non-numeric value' do 
          reservation.sales_fee = 'fdsfsdf'
          expect(reservation).to be_invalid
        end
      end

      describe 'cleaning_fee' do 
        it 'validates cleaning_fee with nil value' do 
          reservation.cleaning_fee = nil
          expect(reservation).to be_invalid
        end

        it 'validates cleaning_fee with non-numeric value' do 
          reservation.cleaning_fee = 'fdsfsdf'
          expect(reservation).to be_invalid
        end
      end

      describe 'discount_by_coupon' do 
        it 'validates discount_by_coupon with nil value' do 
          reservation.discount_by_coupon = nil
          expect(reservation).to be_invalid
        end

        it 'validates discount_by_coupon with non-numeric value' do 
          reservation.discount_by_coupon = 'fdsfsdf'
          expect(reservation).to be_invalid
        end
      end

      describe 'consumption_tax' do 
        it 'validates consumption_tax with nil value' do 
          reservation.consumption_tax = nil
          expect(reservation).to be_invalid
        end

        it 'validates consumption_tax with non-numeric value' do 
          reservation.consumption_tax = 'fdsfsdf'
          expect(reservation).to be_invalid
        end
      end

      describe 'local_tax' do 
        it 'validates local_tax with nil value' do 
          reservation.local_tax = nil
          expect(reservation).to be_invalid
        end

        it 'validates local_tax with non-numeric value' do 
          reservation.local_tax = 'fdsfsdf'
          expect(reservation).to be_invalid
        end
      end

      describe 'total_price' do 
        it 'validates total_price with nil value' do 
          reservation.total_price = nil
          expect(reservation).to be_invalid
        end

        it 'validates total_price with non-numeric value' do 
          reservation.total_price = 'fdsfsdf'
          expect(reservation).to be_invalid
        end
      end

      describe 'cancel_fee' do 
        it 'validates cancel_fee with nil value' do 
          reservation.cancel_fee = nil
          expect(reservation).to be_invalid
        end

        it 'validates cancel_fee with non-numeric value' do 
          reservation.cancel_fee = 'fdsfsdf'
          expect(reservation).to be_invalid
        end
      end

      describe 'remarks' do 
        it 'validates remarks with nil value' do 
          reservation.remarks = nil
          expect(reservation).to be_invalid
        end
      end

      describe 'payment_type' do 
        it 'validates payment_type with nil value' do 
          reservation.payment_type = nil
          expect(reservation).to be_invalid
        end
      end

      describe 'currency' do 
        it 'validates currency with nil value' do 
          reservation.currency = nil
          expect(reservation).to be_invalid
        end
      end

      describe 'local_total_price' do 
        it 'validates local_total_price with nil value' do 
          reservation.local_total_price = nil
          expect(reservation).to be_invalid
        end

        it 'validates local_total_price with non-numeric value' do 
          reservation.local_total_price = 'fdsfsdf'
          expect(reservation).to be_invalid
        end
      end

      describe 'total_stay_adults' do 
        it 'validates total_stay_adults with nil value' do 
          reservation.total_stay_adults = nil
          expect(reservation).to be_invalid
        end

        it 'validates total_stay_adults with non-numeric value' do 
          reservation.total_stay_adults = 'fdsfsdf'
          expect(reservation).to be_invalid
        end
      end

      describe 'total_stay_adults' do 
        it 'validates total_stay_adults with nil value' do 
          reservation.total_stay_adults = nil
          expect(reservation).to be_invalid
        end

        it 'validates total_stay_adults with non-numeric value' do 
          reservation.total_stay_adults = 'fdsfsdf'
          expect(reservation).to be_invalid
        end
      end

      describe 'total_stay_children' do 
        it 'validates total_stay_children with nil value' do 
          reservation.total_stay_children = nil
          expect(reservation).to be_invalid
        end

        it 'validates total_stay_children with non-numeric value' do 
          reservation.total_stay_children = 'fdsfsdf'
          expect(reservation).to be_invalid
        end
      end

      describe 'total_stay_infants' do 
        it 'validates total_stay_infants with nil value' do 
          reservation.total_stay_infants = nil
          expect(reservation).to be_invalid
        end

        it 'validates total_stay_infants with non-numeric value' do 
          reservation.total_stay_infants = 'fdsfsdf'
          expect(reservation).to be_invalid
        end
      end
    end
  end
end
