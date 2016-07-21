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
  	song = self.new #instantiates a new song/ creates a new song
  	# song.name = name #sets name to the song's name that was just created
  	self.all << song #adds the new song to this specific self instance's array
  	song #returns the new song
  end

  def self.new_by_name(title)
  	song = self.new #creates a new song
  	song.name = title #sets song's name to the title
  	song #returns the new song
  end

  def self.create_by_name(title)
  	song = self.new
  	song.name = title
  	self.all << song
  	song
  end

  def self.find_by_name(title)
  	@@all.detect{|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
  	if !self.find_by_name(title) 
  		self.create_by_name(title)
  	else
  		self.find_by_name(title)
  	end
  end

  def self.alphabetical
  	@@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(title)
  	song = self.new #creates a new song
  	rows = title.split(" - ") #splits the given song at the -
  	rows[1].slice!".mp3" #removes the ".mp3" at index of row 1
  	song.artist_name = rows[0] #calls the new instance of the song with the artist_name with the information
  	song.name = rows[1] #calls the new instance of the song with the name of the information
  	song #calls that instance
  end

  def self.create_from_filename(title)
  	@@all << self.new_from_filename(title) #initializes and saves the song and artist_name 
  end

  def self.destroy_all
  	@@all.clear
  end

end
