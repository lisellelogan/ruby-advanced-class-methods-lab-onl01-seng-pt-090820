require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    adding_a_song = self.create
    adding_a_song.name = name
    adding_a_song
  end

  def self.find_by_name(name)
    @@all.detect{|song_name| song_name.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by{|word| word.name}
  end

  def new_from_filename(file_name)
    file = file_name.split(" - ")
    artist = file[0]
    song_title = file[1] + ".mp3"
  end

  def create_from_filename(file)

  end

  def self.destroy_all
    self.all.clear
  end


end
