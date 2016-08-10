class SkiReport::CLI
  include SkiReport

  
  def call
    puts "Today's Ski Reports"
    SkiReport::Report.today
  end

  def menu
    input = nil

    while input != "exit"
      list_states
      input = gets.chomp.downcase
      
      if input.to_i > 0
        selection = @@ALL[input.to_i - 1]

        SkiReport::Report.new(selection)
        #will print the requested report to screen
      elsif input == "list"
        list_states
      end


      if input.to_i == 1
        puts "Colorado snow reports:"
        puts "Arapahoe Basin Last 24 Hours = 0inches 48 Hours =  0inches"
      elsif input.to_i == 2
        puts "Utah snow reports:"
        puts "Snowbird Last 24 Hours = 0inches 48 Hours = 0inches"
      end
    end
  end

  def list_states
    @@ALL.each.with_index(1) do |state, i|
      puts "#{i}. #{state.capitalize}"
    end
    puts "Please select a state to view resorts or type 'exit'"
  end

  

end