require 'rspec'

class Hotel
  attr_accessor :guests

  def initialize
    @guests = []
    @occupied_rooms = []
  end

  def check_in_guest(guest_name, room_number)
    if @occupied_rooms.include?(room_number)
      return false
    else
      @occupied_rooms << room_number
      @guests << guest_name
      return true
    end
  end

  def check_out_guest(guest_name)
    @guests.delete(guest_name)
  end
end

describe Hotel do
  describe 'checking in a guest' do
    it 'adds the guest to the hotels guest list' do
      hotel = Hotel.new
      hotel.check_in_guest('George Harrison', 305)
      expect(hotel.guests).to include 'George Harrison'
    end

    context 'room is available' do
      it 'allows check-in' do
        hotel = Hotel.new
        expect(hotel.check_in_guest('George Harrison', 302)).to be true
      end
    end

    context 'room is not available' do
      it 'disallows check-in' do
        hotel = Hotel.new
        hotel.check_in_guest('Roy Orbison', 302)
        expect(hotel.check_in_guest('George Harrison', 302)).to be false
      end

      it 'does not add guest to guest list' do

        expect(hotel.guests).not_to include 'George Harrison'
      end
    end
  end
 
  it 'can check out a guest' do
    hotel = Hotel.new
    hotel.check_in_guest('George Orwell', 306)
    hotel.check_out_guest('George Orwell')
    expect(hotel.guests).not_to include 'George Orwell'
  end
end
