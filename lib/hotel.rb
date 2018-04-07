class Hotel

  def initialize
    @guests = {}
  end

  def check_in_guest(guest_name, room_number)
    if @guests.include?(room_number)
      return false
    else
      @guests[room_number] = guest_name
      return true
    end
  end

  def check_out_guest(guest_name)
    @guests.delete(@guests.key(guest_name))
  end

  def occupied_rooms()
    @guests.keys
  end

  def guests()
    @guests.values
  end
end

