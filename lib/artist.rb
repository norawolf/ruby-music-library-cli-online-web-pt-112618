class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    Artist.new(name).tap {|artist| artist.save }
  end

  def add_song(song)
    #is there a better way to assign the artist only if the song does not already have an artist?
    song.artist ? song.artist : song.artist = self
    songs << song if !songs.include?(song)
  end

  def genres
    self.songs.collect do |song|
      song.genre
    end.uniq
  end
end
