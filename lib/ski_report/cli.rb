class SkiReport::CLI
  @@ALL = ["Alaska", "Arizona", "California", "Colorado", "Connecticut", "Idaho", "Illinois", "Indiana", "Iowa", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Missouri", "Montana", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "Ohio", "Oregon", "Pennsylvania", "South Dakota", "Tennessee", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
  
  def call
    puts "Today's Ski Reports"
    menu
  end

  def menu
    input = nil
    while input != "exit"
      list_states
      input = gets.chomp.downcase
      
      if input.to_i > 0
        SkiReport::Report.print_report(@@ALL[input.to_i - 1])
        puts "When you are ready to continue please press enter"
        gets
      elsif input != "exit" 
        puts "Not valid input, please try again."
        sleep(2)
      end

    end
  end

  def list_states
    @@ALL.each.with_index(1) do |state, i|
      puts "#{i}. #{state}"
    end
    puts "Please select a state to view resorts or type 'exit'"
  end
  
end