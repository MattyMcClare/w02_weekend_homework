class Guest
  attr_reader :name, :wallet
  def initialize(name, wallet)
    @name = name
    @wallet = wallet
  end

  def rent_room(room)
    @wallet -= room.room_price()
  end

  def fav_song(song, room)
    song_list = room.song_list
    found_song = song_list.find{ |x| x.title == song.title }
    if (song.title() == found_song.title)
      return "Whooo!"
    end
  end
end
