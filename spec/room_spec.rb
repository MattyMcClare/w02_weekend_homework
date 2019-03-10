require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class TestRoom < MiniTest::Test
  def setup
    @room = Room.new("Karsongs", 5, 80)
    @guest = Guest.new("Johnny", 200)
    @guest1 = Guest.new("Bonny", 50)
    @song = Song.new("Britney Spears", "Toxic")
  end

  def test_can_have_name()
    assert_equal("Karsongs", @room.name)
  end

  def test_can_check_in_guest__added()
    @room.check_in_guest(@guest, @room)
    assert_equal(1, @room.count_guest_list())
  end

  def test_can_check_in_guest__full_capacity()
    @room.check_in_guest(@guest, @room)
    @room.check_in_guest(@guest, @room)
    @room.check_in_guest(@guest, @room)
    @room.check_in_guest(@guest, @room)
    assert_equal("Room at full capacity!", @room.check_in_guest(@guest, @room))
  end

  def test_can_check_in_guest__sufficient_funds()
    @room.check_in_guest(@guest, @room)
    assert_equal(120, @guest.wallet())
    assert_equal(1, @room.count_guest_list())
  end

  def test_can_check_in_guest__unsufficient_funds()
    @room.check_in_guest(@guest1, @room)
    assert_equal(50, @guest1.wallet())
    assert_equal(0, @room.count_guest_list())
  end

  def test_can_check_out_guest()
    @room.check_in_guest(@guest, @room)
    @room.check_out_guest(@guest)
    assert_equal(0, @room.count_guest_list())
  end

  def test_can_add_song__add()
    @room.add_song(@song)
    assert_equal(1, @room.count_song_list())
  end

  def test_can_add_song__already_exists()
    @room.add_song(@song)
    assert_equal("Song already added!", @room.add_song(@song))
  end

end
