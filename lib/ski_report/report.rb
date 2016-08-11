class SkiReport::Report

  attr_accessor :all_resorts, :state

  def initialize(state)
    @state = state
    save_resorts(get_resorts(SkiReport::Scraper.new.scrape_ots(state)))
  end 
    
  def print_report
    longest_resort = @all_resorts.max_by {|report| report[:name].length}[:name].length

    puts "\nSnow Report's for #{@state}:"

    printf("%-#{longest_resort + 1}s|%10s|%10s|%10s\n", 
      "Resort", 
      "24Hr Total", 
      "72Hr Total", 
      "Base Depth"
      )

    puts "-------------------------------------------------------------------"

    @all_resorts.each do |resort|
      printf("%-#{longest_resort + 1}s|    %-6s|    %-6s|%10s\n", 
        resort[:name], 
        resort[:twofour] + '"', 
        resort[:seventwo] + '"', 
        resort[:base]
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
      {
        :name => resort.css('.name').text,
        :twofour => resort.css('.rLeft b').first.text.slice(/\d+/),
        :seventwo => resort.css('.rLeft b').last.text.slice(/\d+/),
        :base => resort.css('.rMid b').text
      }
    end
  end

end



