require 'rails_helper'

RSpec.describe RoomGroup, type: :model do
  describe 'RoomGroup' do
    let(:room_group) { FactoryBot.build(:room_group) }

    describe 'validations' do 
      before(:each) do 
        expect(room_group).to be_valid
      end

      describe 'order' do 
        it 'validates order with nil value' do
          room_group.order = nil
          expect(room_group).to be_invalid
        end

        it 'validates order with non-numeric value' do
          room_group.order = 'abcd123'
          expect(room_group).to be_invalid
        end
      end

      describe 'room_title' do 
        it 'validates room_title with nil value' do 
          room_group.room_title = nil
          expect(room_group).to be_invalid
        end
      end

      describe 'house_rule' do 
        it 'validates house_rule with nil value' do 
          room_group.house_rule = nil
          expect(room_group).to be_invalid
        end
      end

      describe 'house_manual' do 
        it 'validates house_manual with nil value' do 
          room_group.house_manual = nil
          expect(room_group).to be_invalid
        end
      end

      describe 'description' do 
        it 'validates description with nil value' do 
          room_group.description = nil
          expect(room_group).to be_invalid
        end
      end

      describe 'room_type' do 
        it 'validates size with nil value' do 
          room_group.size = nil
          expect(room_group).to be_invalid
        end

        it 'validates size with non-numeric value' do 
          room_group.size = 'abcd'
          expect(room_group).to be_invalid
        end
      end

      describe 'room_type' do 
        it 'validates room_type with nil value' do 
          room_group.room_type = nil
          expect(room_group).to be_invalid
        end
      end

      describe 'room_type' do 
        it 'validates room_type with nil value' do 
          room_group.room_type = nil
          expect(room_group).to be_invalid
        end
      end

      describe 'maximum_guests' do 
        it 'validates maximum_guests with nil value' do 
          room_group.maximum_guests = nil
          expect(room_group).to be_invalid
        end

        it 'validates maximum_guests with non-numeric value' do 
          room_group.maximum_guests = 'abcd123'
          expect(room_group).to be_invalid
        end
      end

      describe 'beds' do 
        it 'validates beds with nil value' do 
          room_group.beds = nil
          expect(room_group).to be_invalid
        end

        it 'validates beds with non-numeric value' do 
          room_group.beds = 'abcd123'
          expect(room_group).to be_invalid
        end
      end

      describe 'bed_rooms' do 
        it 'validates bedrooms with nil value' do 
          room_group.bedrooms = nil
          expect(room_group).to be_invalid
        end

        it 'validates bedrooms with non-numeric value' do 
          room_group.bedrooms = 'abcd123'
          expect(room_group).to be_invalid
        end
      end

      describe 'bathrooms' do 
        it 'validates bathrooms with nil value' do 
          room_group.bathrooms = nil
          expect(room_group).to be_invalid
        end

        it 'validates bathrooms with non-numeric value' do 
          room_group.bathrooms = 'abcd123'
          expect(room_group).to be_invalid
        end
      end

      describe 'bathtubs' do 
        it 'validates bathtubs with nil value' do 
          room_group.bathtubs = nil
          expect(room_group).to be_invalid
        end

        it 'validates bathtubs with non-numeric value' do 
          room_group.bathtubs = 'abcd123'
          expect(room_group).to be_invalid
        end
      end

      describe 'base_inventories' do 
        it 'validates base_inventories with nil value' do 
          room_group.base_inventories = nil
          expect(room_group).to be_invalid
        end

        it 'validates base_inventories with non-numeric value' do 
          room_group.base_inventories = 'abcd123'
          expect(room_group).to be_invalid
        end
      end

      describe 'is_shared_bath' do 
        it 'validates is_shared_bath with nil value' do 
          room_group.is_shared_bath = nil
          expect(room_group).to be_invalid
        end
      end

      describe 'law_type' do 
        it 'validates law_type with nil value' do 
          room_group.law_type = nil
          expect(room_group).to be_invalid
        end
      end

      describe 'is_open' do 
        it 'validates is_open with nil value' do 
          room_group.is_open = nil
          expect(room_group).to be_invalid
        end
      end

      describe 'is_edit_complete' do 
        it 'validates is_edit_complete with nil value' do 
          room_group.is_edit_complete = nil
          expect(room_group).to be_invalid
        end
      end
      
    end
  end
end
