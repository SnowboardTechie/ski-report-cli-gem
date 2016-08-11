class SkiReport::Report

  attr_accessor :state

  def self.scrape_ots(state_url)
    #returns array of objects that have a name, 24 hour snow total, 72 hours snow total
    #base depth
    #[{:name => 'Arapahoe Basin', :24hr => 0, :72hr => 0, :base => 30}, {:name => 'Arapahoe Basin', :24hr => 0, :72hr => 0, :base => 30}]
    resorts = []
    doc = Nokogiri::HTML(open("http://www.onthesnow.com/" + state_url + "/skireport.html?&ud=1&o=resort"))
    doc.css(".resScrollCol8 table tr").each do |resort|
      if resort.css('.name').text != ""
        # binding.pry
        new_resort = {
          :name => resort.css('.name').text
        }
        resorts << new_resort
      end
    end
    resorts

  end

  def self.print_report(state)
    @state = state
    report_data = scrape_ots(state.gsub(/\s/, '-').downcase) #takes state and formats it for scraping

    puts "#{state}" #using as test to verify state is appropriately setup here
    #uses report_data from get_report to print
    #Snow Report's for Colorado:
  end

end