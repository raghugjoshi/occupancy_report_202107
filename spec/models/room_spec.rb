require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'Room' do
    let(:room) { FactoryBot.build(:room) }

    describe 'validations' do 
      before(:each) do 
        expect(room).to be_valid
      end

      describe 'room_group' do 
        it 'validates room_group association with nil value' do
          room.room_group = nil
          expect(room).to be_invalid
        end
      end

      describe 'code' do 
        it 'validates code with nil value' do 
          room.code = nil
          expect(room).to be_invalid
        end
      end

      describe 'notification_date' do 
        it 'validates notification_date with nil value' do 
          room.notification_date = nil
          expect(room).to be_invalid
        end
      end

      describe 'hash_name' do 
        it 'validates hash_name with nil value' do 
          room.hash_name = nil
          expect(room).to be_invalid
        end
      end

      describe 'lodging_operator_name' do 
        it 'validates lodging_operator_name with nil value' do 
          room.lodging_operator_name = nil
          expect(room).to be_invalid
        end
      end

      describe 'is_open' do 
        it 'validates is_open with nil value' do 
          room.is_open = nil
          expect(room).to be_invalid
        end

        it 'validates is_open with nil value' do 
          room.is_open = nil
          expect(room).to be_invalid
        end
      end
    end
  end
end
