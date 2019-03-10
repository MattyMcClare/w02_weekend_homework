require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')
require_relative('../room.rb')

class TestSong < MiniTest::Test
  def setup
    @song = Song.new("Britney Spears", "Oops…I Did It Again")
  end

  def test_song_can_have_artist
    assert_equal("Britney Spears", @song.artist)
  end

  def test_song_can_have_title
    assert_equal("Oops…I Did It Again", @song.title)
  end
end
