class SkiReport::Resort

  attr_accessor :name, :one_day_snowfall, :three_day_snowfall, 
                :base_depth, :url, :scraped_details

  @@resorts = []

  def initialize(name, one_day_snowfall, three_day_snowfall, base_depth, url)
    @name = name
    @one_day_snowfall = one_day_snowfall
    @three_day_snowfall = three_day_snowfall
    @base_depth = base_depth
    @url = url
    @@resorts << self
  end

  def self.create(args*)
    self.new(args*)
    self.save
  end

  def self.all
    @@resorts 
  end 

  def self.clear 
    @@resorts = []
  end

  def gather_details
    @scraped_details ||= SkiReport::Scraper.new.scrape_resort(@url)
  end

  def save_details
    #Will use @scraped_details to populate more details about the resort
  end


  def print_details
    gather_details 
    save_details
    #print details once populated here
  end

end