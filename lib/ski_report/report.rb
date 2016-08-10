class SkiReport::Report

  def self.scrape_ots(state)
    #returns either array or hash for print_report
  end

  def self.print_report(state)
    state = state.gsub(/\s/, '-')
    scrape_ots(state)
    puts "test"
    #uses data from get_report to print
  end

end