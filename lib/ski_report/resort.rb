class SkiReport::Resort

  attr_accessor :name, :one_day_snowfall, :three_day_snowfall, :base_depth, :url, :scraped_details

  def initialize(name, one_day_snowfall, three_day_snowfall, base_depth, url)
    @name = name
    @one_day_snowfall = one_day_snowfall
    @three_day_snowfall = three_day_snowfall
    @base_depth = base_depth
    @url = url
  end

  def gather_details
    @scraped_details ||= SkiReport::Scraper.new.scrape_resort(@url)
  end

  def print_details
    gather_details
    @scraped_details #play with this to print necessary info
  end

end