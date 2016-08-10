class SkiReport::CLI
  @@ALL = ["alaska", "arizona", "califonia", "colorado", "connecticut", "idaho", "illinois", "indiana", "iowa", "maine", "maryland", "massachusetts", "michigan", "minnesota", "missouri", "montana", "nevada", "new hampshire", "new jersey", "new mexico", "new york", "north carolina", "ohio", "oregon", "pennsylvania", "south dakota", "tennessee", "utah", "vermont", "virginia", "washington", "west virginia", "wisconsin", "wyoming"]
  
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
        SkiReport::Report.new(@@ALL[input.to_i - 1]) #will print the requested report to screen
      elsif input == "list"
        list_states
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