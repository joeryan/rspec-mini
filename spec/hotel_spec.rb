require 'rspec'
require 'hotel'

describe Hotel do
  before do
    @hotel = Hotel.new
  end
  
  describe 'checking in a guest' do
    it 'adds the guest to the hotels guest list' do
      @hotel.check_in_guest('George Harrison', 305)
      expect(@hotel.guests).to include 'George Harrison'
    end

    context 'room is available' do
      it 'allows check-in' do
        expect(@hotel.check_in_guest('George Harrison', 302)).to be true
      end
    end

    context 'room is not available' do
      it 'disallows check-in' do
        @hotel.check_in_guest('Roy Orbison', 302)
        expect(@hotel.check_in_guest('George Harrison', 302)).to be false
      end

      it 'does not add guest to guest list' do
        expect(@hotel.guests).not_to include 'George Harrison'
      end
    end
  end

  describe 'checking out a guest' do
    it 'can check out a guest' do
      @hotel.check_in_guest('George Orwell', 306)
      @hotel.check_out_guest('George Orwell', 306)
      expect(@hotel.guests).not_to include 'George Orwell'
    end

    it 'makes the room available again' do
      @hotel.check_in_guest('George Orwell', 306)
      @hotel.check_out_guest('George Orwell', 306)
      expect(@hotel.occupied_rooms).not_to include 306
    end
  end
end
