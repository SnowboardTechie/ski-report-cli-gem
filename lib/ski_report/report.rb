class SkiReport::Report

  def self.scrape_ots(state_url)
    resorts = []
    doc = Nokogiri::HTML(open("http://www.onthesnow.com/" + state_url + "/skireport.html?&ud=1&o=resort"))
    doc.css(".resScrollCol8 table tr").each do |resort|
      if resort.css('.name').text != ""
        # binding.pry
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
    report_data = scrape_ots(state.gsub(/\s/, '-').downcase) #takes state and formats it for scraping
    longest_resort = report_data.max_by {|report| report[:name].length}[:name].length
    puts "Snow Report's for #{state}:"
    printf("%-#{longest_resort + 1}s|%10s|%10s|%10s\n", "Resort", "24Hr Total", "72Hr Total", "Base Depth")
    puts "-------------------------------------------------------------------"
    report_data.each do |resort|
      printf("%-#{longest_resort + 1}s|    %-6s|    %-6s|%10s\n", resort[:name], resort[:twofour] + '"', resort[:seventwo] + '"', resort[:base])
    end
  end

end