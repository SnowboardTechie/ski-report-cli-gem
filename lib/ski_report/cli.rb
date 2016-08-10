class SkiReport::CLI

  def call
    puts "Today's Ski Reports"
    list_states
  end

  def list_states
    puts "Please select a state to view resorts"
    puts <<-DOC
    1. Colorado
    2. Utah
    DOC
  end

end