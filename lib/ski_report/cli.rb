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
    puts "Please select a state to view resorts or type 'exit'"
  end

  def report
    list_states

    input = nil

    while input != "exit"
      list_states
      input = gets.chomp.downcase

      if input.to_i == 1
        puts "Colorado snow reports:"
        puts "Arapahoe Basin Last 24 Hours = 0inches 48 Hours =  0inches"
      elsif input.to_i == 2
        puts "Utah snow reports:"
        puts "Snowbird Last 24 Hours = 0inches 48 Hours = 0inches"
      end
    end
  end


end