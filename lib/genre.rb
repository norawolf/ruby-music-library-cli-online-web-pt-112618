class Genre
  extend Concerns::Findable

  attr_accessor :name
  attr_reader :songs

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
    Genre.new(name).tap {|genre| genre.save}
  end

  def artists
    self.songs.collect do |song|
      song.artist
    end.uniq
  end
end
