class SkiReport::CLI
  @@ALL = ["Alaska", "Arizona", "California", "Colorado", "Connecticut", "Idaho", "Illinois", "Indiana", "Iowa", "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota", "Missouri", "Montana", "Nevada", "New Hampshire", "New Jersey", "New Mexico", "New York", "North Carolina", "Ohio", "Oregon", "Pennsylvania", "South Dakota", "Tennessee", "Utah", "Vermont", "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"]
  
  def call
    puts "                 ************* Welcome to Ski Reports *************"
    menu
  end

  def menu
    input = nil
    while input != "exit"
      list_states
      input = gets.chomp.downcase
      
      if input.to_i > 0
        SkiReport::Report.print_report(@@ALL[input.to_i - 1])
        puts "\nWhen you are ready to continue please press enter"
        gets
      elsif input != "exit" 
        puts "Not valid input, please try again."
        sleep(2)
      end

    end
  end

  def list_states
    puts <<-HEREDOC
      1. #{@@ALL[0]}       8. #{@@ALL[7]}       15. #{@@ALL[14]}      22. #{@@ALL[21]} 29. #{@@ALL[28]}
      2. #{@@ALL[1]}      9. #{@@ALL[8]}          16. #{@@ALL[15]}       23. #{@@ALL[22]}           30. #{@@ALL[29]}
      3. #{@@ALL[2]}  10. #{@@ALL[9]}         17. #{@@ALL[16]}        24. #{@@ALL[23]}         31. #{@@ALL[30]}
      4. #{@@ALL[3]}    11. #{@@ALL[10]}      18. #{@@ALL[17]} 25. #{@@ALL[24]}   32. #{@@ALL[31]}
      5. #{@@ALL[4]} 12. #{@@ALL[11]} 19. #{@@ALL[18]}    26. #{@@ALL[25]}   33. #{@@ALL[32]}
      6. #{@@ALL[5]}       13. #{@@ALL[12]}      20. #{@@ALL[19]}    27. #{@@ALL[26]}      34. #{@@ALL[33]}
      7. #{@@ALL[6]}    14. #{@@ALL[13]}     21. #{@@ALL[20]}      28. #{@@ALL[27]}
    HEREDOC

    # @@ALL.each.with_index(1) do |state, i|
    #   puts "#{i}. #{state}"
    # end
    puts "\nTo view resorts please select a state by entering its number or type 'exit'"
  end
  
end