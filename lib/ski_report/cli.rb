class SkiReport::CLI

  def call
    puts "Today's Ski Reports"
    report
  end

  def list_states
    
    puts <<-DOC
    1. Colorado
    2. Utah
    DOC
    puts "Please select a state to view resorts"
  end

  def report
    list_states

    input = nil

    while input != "exit"
      list_states
      input = gets.chomp.downcase

      if input.to_i == 1
        puts "You selected CO"
      elsif input.to_i == 2
        puts "You selected UT"
      end
    end
  end


end