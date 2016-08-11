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
    puts "Snow Report's for #{state}:"
    report_data.each do |resort|
      puts "#{resort[:name]} - Last 24hr: #{resort[:twofour]}\" Last 72hr: #{resort[:seventwo]}\" Base Depth: #{resort[:base]}"
    end
    #Snow Report's for Colorado:
  end

end