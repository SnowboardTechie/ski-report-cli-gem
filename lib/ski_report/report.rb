class SkiReport::Report
  attr_accessor :state

  def initialize(state)
    @state = state.gsub(/\s/, '-')
    print_report(get_report)
  end

  def self.get_report
    #returns either array or hash for print_report
  end

  def self.print_report
    #uses data from get_report to print
  end

end