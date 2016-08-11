class SkiReport::Report

  def self.scrape_ots(state_url)
    resorts = []
    scraped_data = Nokogiri::HTML(open("http://www.onthesnow.com/" + state_url + "/skireport.html?&ud=1&o=resort"))
    
    get_resorts(scraped_data).each do |resort|
      if valid_resort?(resort)
        new_resort = {
          :name => resort.css('.name').text,
          :twofour => resort.css('.rLeft b').first.text.slice(/\d+/),
          :seventwo => resort.css('.rLeft b').last.text.slice(/\d+/),
          :base => resort.css('.rMid b').text
        }
        resorts << new_resort
      end
    end
    resorts
  end

  def self.print_report(state)
    report_data = scrape_ots(state_url_creator(state)) 
    longest_resort = report_data.max_by {|report| report[:name].length}[:name].length

    puts "\nSnow Report's for #{state}:"

    printf("%-#{longest_resort + 1}s|%10s|%10s|%10s\n", 
      "Resort", 
      "24Hr Total", 
      "72Hr Total", 
      "Base Depth"
      )

    puts "-------------------------------------------------------------------"

    report_data.each do |resort|
      printf("%-#{longest_resort + 1}s|    %-6s|    %-6s|%10s\n", 
        resort[:name], 
        resort[:twofour] + '"', 
        resort[:seventwo] + '"', 
        resort[:base]
      )
    end
  end

  def self.state_url_creator(state)
    state.gsub(/\s/, '-').downcase
  end

  def self.get_resorts(scraped_data)
    scraped_data.css(".resScrollCol8 table tr")
  end

  def self.valid_resort?(resort)
    resort.css('.name').text != ""
  end 


end