class Hotel
  attr_accessor :guests
  attr_accessor :occupied_rooms

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

  def check_out_guest(guest_name, room_number)
    @guests.delete(guest_name)
    @occupied_rooms.delete(room_number)
  end
end

