require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')
require_relative('../room.rb')
require_relative('../song.rb')

class TestGuest < MiniTest::Test
  def setup
    @guest = Guest.new("Barbara", 200)
    @room = Room.new("Karsongs", 4, 80)
    @song = Song.new("Britney Spears", "Toxic")
  end

  def test_guest_can_have_name
    assert_equal("Barbara", @guest.name)
  end

  def test_guest_can_have_money
    assert_equal(200, @guest.wallet)
  end

  def test_rent_room
    @guest.rent_room(@room)
    assert_equal(120, @guest.wallet())
  end

  def test_can_have_fav_song
    @room.add_song(@song)
    assert_equal("Whooo!", @guest.fav_song(@song, @room))
  end
end
