class Room
  attr_reader :name, :room_capacity, :song_list, :room_price
  def initialize(name, room_capacity, room_price)
    @name = name
    @room_capacity = room_capacity
    @room_price = room_price
    @guest_list = []
    @song_list = []
  end

  def count_guest_list()
    @guest_list.count()
  end

  def count_song_list()
    @song_list.count()
  end

  def check_in_guest(guest, room)
    if(count_guest_list() < @room_capacity) && (guest.wallet >= @room_price)
        guest.rent_room(room)
        @guest_list.push(guest)
    else
      return "Room at full capacity!"
    end
  end

  def check_out_guest(guest)
    index = @guest_list.index(guest)
    @guest_list.delete_at(index)
    # @guest_list.delete(guest)
  end

  def add_song(song)
    if (@song_list.index(song) == nil)
      @song_list.push(song)
    else
      return "Song already added!"
    end
  end
end
