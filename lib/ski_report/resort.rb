class SkiReport::Resort

  attr_accessor :name, :one_day_snowfall, :three_day_snowfall, :base_depth

  def initialize(name, one_day_snowfall, three_day_snowfall, base_depth)
    @name = name
    @one_day_snowfall = one_day_snowfall
    @three_day_snowfall = three_day_snowfall
    @base_depth = base_depth
  end

end