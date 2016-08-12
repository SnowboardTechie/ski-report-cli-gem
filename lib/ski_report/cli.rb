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
    puts "********************* Welcome to Ski Reports *********************"
    menu
  end

  def menu
    input = nil
    while input != "exit"
      list_states
      input = gets.strip.downcase
      
      if input.to_i > 0 && input.to_i <= @@SKI_STATES.length
        report = SkiReport::Report.new(@@SKI_STATES[input.to_i - 1])
        report.print_report
        puts "\nWhen you are ready to continue please press enter or type 'exit' to exit"
        input = gets.strip.downcase
      elsif input != "exit" 
        puts "Input not valid, please try again."
        sleep(2)
      end
    end
  end

  def list_states
    puts "1. #{@@SKI_STATES[0]}      9. #{@@SKI_STATES[8]}           17. #{@@SKI_STATES[16]}         25. #{@@SKI_STATES[24]}"
    puts "2. #{@@SKI_STATES[1]}     10. #{@@SKI_STATES[9]}         18. #{@@SKI_STATES[17]}  26. #{@@SKI_STATES[25]}"
    puts "3. #{@@SKI_STATES[2]}  11. #{@@SKI_STATES[10]}      19. #{@@SKI_STATES[18]}     27. #{@@SKI_STATES[26]}"
    puts "4. #{@@SKI_STATES[3]}    12. #{@@SKI_STATES[11]} 20. #{@@SKI_STATES[19]}     28. #{@@SKI_STATES[27]}"
    puts "5. #{@@SKI_STATES[4]} 13. #{@@SKI_STATES[12]}      21. #{@@SKI_STATES[20]}       29. #{@@SKI_STATES[28]}"
    puts "6. #{@@SKI_STATES[5]}       14. #{@@SKI_STATES[13]}     22. #{@@SKI_STATES[21]} 30. #{@@SKI_STATES[29]}"
    puts "7. #{@@SKI_STATES[6]}    15. #{@@SKI_STATES[14]}      23. #{@@SKI_STATES[22]}           31. #{@@SKI_STATES[30]}"
    puts "8. #{@@SKI_STATES[7]}     16. #{@@SKI_STATES[15]}       24. #{@@SKI_STATES[23]}         32. #{@@SKI_STATES[31]}"
    puts "               33. #{@@SKI_STATES[32]}     34. #{@@SKI_STATES[33]}"

    puts "\nTo view resorts please select a state by entering its number or type 'exit'"
  end
  
end

