require "test_helper"

class AlbumsControllerTest < ActionDispatch::IntegrationTest
  fixtures :albums   # ✅ loads albums.yml

  setup do
    @album = albums(:one)
  end

  test "should get index" do
    get albums_url
    assert_response :success
  end

  test "should get new" do
    get new_album_url
    assert_response :success
  end

=begin
  test "should create album" do
    assert_difference("Album.count") do
      post albums_url, params: { album: {
        title: "New Album",
        artist: "New Artist",
        release_year: 2025,
        genre: "Rock",
        rating: 5,
        availability: true   # Must include this!
      } }
    end
    assert_redirected_to album_url(Album.last)
  end
=end

  test "should show album" do
    get album_url(@album)
    assert_response :success
  end

  test "should get edit" do
    get edit_album_url(@album)
    assert_response :success
  end

=begin
  test "should update album" do
    patch album_url(@album), params: { album: {
      title: "Updated Album",
      artist: "Updated Artist",
      release_year: 2025,
      genre: "Pop",
      rating: 4,
      availability: true   # Must include this!
    } }
    assert_redirected_to album_url(@album)
  end
=end

  test "should destroy album" do
    assert_difference("Album.count", -1) do
      delete album_url(@album)
    end

    assert_redirected_to albums_url
  end
end
