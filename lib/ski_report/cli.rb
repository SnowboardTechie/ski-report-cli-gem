class SkiReport::CLI
  @@SKI_STATES = ["Alaska", "Arizona", "California", "Colorado", 
            "Connecticut", "Idaho", "Illinois", "Indiana", 
            "Iowa", "Maine", "Maryland", "Massachusetts", 
            "Michigan", "Minnesota", "Missouri", "Montana", 
            "Nevada", "New Hampshire", "New Jersey", 
            "New Mexico", "New York", "North Carolina", "Ohio", 
            "Oregon", "Pennsylvania", "South Dakota", "Tennessee", 
            "Utah", "Vermont", "Virginia", "Washington", 
            "West Virginia", "Wisconsin", "Wyoming"
          ]
  
  def call
    puts "                 ************* Welcome to Ski Reports *************"
    menu
  end

  def menu
    input = nil
    while input != "exit"
      list_states
      input = gets.strip.downcase
      
      if input.to_i > 0
        SkiReport::Report.print_report(@@SKI_STATES[input.to_i - 1])
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
      1. #{@@SKI_STATES[0]}       8. #{@@SKI_STATES[7]}       15. #{@@SKI_STATES[14]}      22. #{@@SKI_STATES[21]} 29. #{@@SKI_STATES[28]}
      2. #{@@SKI_STATES[1]}      9. #{@@SKI_STATES[8]}          16. #{@@SKI_STATES[15]}       23. #{@@SKI_STATES[22]}           30. #{@@SKI_STATES[29]}
      3. #{@@SKI_STATES[2]}  10. #{@@SKI_STATES[9]}         17. #{@@SKI_STATES[16]}        24. #{@@SKI_STATES[23]}         31. #{@@SKI_STATES[30]}
      4. #{@@SKI_STATES[3]}    11. #{@@SKI_STATES[10]}      18. #{@@SKI_STATES[17]} 25. #{@@SKI_STATES[24]}   32. #{@@SKI_STATES[31]}
      5. #{@@SKI_STATES[4]} 12. #{@@SKI_STATES[11]} 19. #{@@SKI_STATES[18]}    26. #{@@SKI_STATES[25]}   33. #{@@SKI_STATES[32]}
      6. #{@@SKI_STATES[5]}       13. #{@@SKI_STATES[12]}      20. #{@@SKI_STATES[19]}    27. #{@@SKI_STATES[26]}      34. #{@@SKI_STATES[33]}
      7. #{@@SKI_STATES[6]}    14. #{@@SKI_STATES[13]}     21. #{@@SKI_STATES[20]}      28. #{@@SKI_STATES[27]}
    HEREDOC

    puts "\nTo view resorts please select a state by entering its number or type 'exit'"
  end
  
end