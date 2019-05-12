module ArtistsHelper
  def display_artist(song)
    song.artist.nil? ? link_to("Add Artist", edit_song_path(song)) : link_to(song.artist_name, artist_path(song.artist))
  end

  def artist_select(song, artist)
    #display a drop-down list of artists 
    #if someone edits a song directly via 
    # only display the artist's name 
    #if they are editing through nested routing.
    #binding.pry
    if song.artist.nil?
      select_tag "song[artist_id]", options_from_collection_for_select(Artist.all, :id, :name)
    else 
      hidden_field_tag "song[artist_id]", song.artist_id
    end
  end

end
