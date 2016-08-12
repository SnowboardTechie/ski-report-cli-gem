class SkiReport::Resort

  attr_accessor :name, :one_day_snowfall, :three_day_snowfall, :base_depth, :url

  def initialize(name, one_day_snowfall, three_day_snowfall, base_depth, url)
    @name = name
    @one_day_snowfall = one_day_snowfall
    @three_day_snowfall = three_day_snowfall
    @base_depth = base_depth
    @url = url
  end

end