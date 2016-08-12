class SkiReport::Report

  attr_accessor :all_resorts, :state

  def initialize(state)
    @state = state
    save_resorts(get_resorts(SkiReport::Scraper.new.scrape_state(state)))
  end 
    
  def print_report
    longest_resort_name = @all_resorts.max_by {|resort| resort.name.length}.name.length

    puts "\nSnow Report's for #{@state}:"

    printf("%-#{longest_resort_name + 1}s|%10s|%10s|%10s\n", 
      "Resort", 
      "24Hr Total", 
      "72Hr Total", 
      "Base Depth"
      )

    puts "-------------------------------------------------------------------"

    @all_resorts.each do |resort|
      printf("%-#{longest_resort_name + 1}s|    %-6s|    %-6s|%10s\n", 
        resort.name, 
        resort.one_day_snowfall + '"', 
        resort.three_day_snowfall + '"', 
        resort.base_depth
      )
    end
  end

  def get_resorts(scraped_data)
    find_valid_resorts(scraped_data.css(".resScrollCol8 table tr"))
  end

  def find_valid_resorts(resorts)
    resorts.reject{|resort| resort.css('.name').text == ""}
  end 

  def save_resorts(resorts_scraped_data)
    @all_resorts = resorts_scraped_data.collect do |resort|
      SkiReport::Resort.new(resort.css('.name').text,
                            resort.css('.rLeft b').first.text.slice(/\d+/), 
                            resort.css('.rLeft b').last.text.slice(/\d+/), 
                            resort.css('.rMid b').text,
                            resort.css(".rMid a").attribute('href').value
                           )
    end
  end

end



