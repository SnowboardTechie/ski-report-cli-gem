class SkiReport::Report

  def self.scrape_ots(state)
    #returns either array or hash for print_report
  end

  def self.print_report(state)
    state = state.gsub(/\s/, '-')
    report_data = scrape_ots(state)
    puts "#{state}" #using as test to verify state is appropriately setup here
    #uses report_data from get_report to print
  end

end