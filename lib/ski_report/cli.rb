class SkiReport::CLI

  @@ALL = ["alaska", "arizona", "califonia", "colorado", "connecticut", "idaho", "illinois", "indiana", "iowa", "maine", "maryland", "massachusetts", "michigan", "minnesota", "missouri", "montana", "nevada", "new hampshire", "new jersey", "new mexico", "new york", "north carolina", "ohio", "oregon", "pennsylvania", "south dakota", "tennessee", "utah", "vermont", "virginia", "washington", "west virginia", "wisconsin", "wyoming"]

  def call
    puts "Today's Ski Reports"
    report
  end

  def list_states
    @@ALL.each.with_index(1) do |state, i|
      puts "#{i}. #{state.capitalize}"
    end
    puts "Please select a state to view resorts or type 'exit'"
  end

  def report

    input = nil

    while input != "exit"
      list_states
      input = gets.chomp.downcase

      if input.to_i > 0
        selection = @@ALL[input.to_i - 1]

        weather = SkiReport::SkiScraper(selction)
        #will return a hash with the weather data needed to make snow report shown below
      elsif input = "list"
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
end