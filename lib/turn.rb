require "./guess.rb"

def turn_english(game_data)
  while (game_data.lives_counter > 0)
    puts "--------------Wrong letters-----------------"
    puts game_data.wrong_letters.to_s
    puts "--------------------------------------------"
    puts "\n\n\n\n\n\n\n\n\n"

    if game_data.lives_counter > 1
      puts "You have #{game_data.lives_counter} lives"
    else
      puts "You have 1 last life!"
    end

    puts "Word: #{game_data.displaying_word.capitalize}"

    puts "Write a letter"
    input = gets.chomp.downcase

    if input.length > 1 && input.include?("/")
      case input
      when "/save"
        system("clear")
        puts "How do you wanna call the save?\n(Use '/back' to return to the game)"
        save_name = gets.chomp

        if save_name.capitalize != "/back"
          game_data.language = "English"
          game_data.save_game(save_name)
        end
        system("clear")
      when "/load"
        system("clear")

        if Dir.empty?("../data")
          puts "There's no saved data!"
          sleep(3)
          system("clear")
        else
          saves_names = Dir.entries("../data")
          .select {|save_name| save_name != "." && save_name != ".."}
          .map {|save_name| save_name.gsub(".json", "")}
          puts "Saves\n#{saves_names}"

          puts "Write the save name!\n(Use '/back' to return to the game)"
          save_name = gets.chomp
          if save_name.downcase != "/back"
            game_data.load_game(save_name)
  
            case game_data.language
            when "English"
              display_english(game_data)
            when "Italian"
              display_italian(game_data)
            when "Dutch"
              display_dutch(game_data)
            end
          end
          system("clear")
        end
      when "/menu"
        default_menu(game_data)
      when "/exit"
        system("clear")
        puts "Thank you for playing.\nGoodbye!"
        sleep(3)
        system("clear")
        exit!
      when "/debug"
        system("clear")
        puts game_data
      else
        system("clear")
        puts "Invalid input!"
      end
    elsif input.length > 1 || input =~ /[!@£#$%^&*()_+{}:;'"?><.,1234567890]/ || game_data.wrong_letters.include?(input) || game_data.displaying_word.include?(input)
      system("clear")
      puts "Invalid input!"
    else
      system("clear")
      guess(input, game_data)
    end

    if game_data.secret_word.include?(game_data.displaying_word)
      system("clear")
      puts "Congratulation!\nYou Win."
      sleep(3)
      default_menu(game_data)
    end
  end

  puts "Last Chance\nTry to guess the word, with the information you currently have!"

  while (game_data.lives_counter = 0)
  
  puts "#{game_data.wrong_letters}\n\n\n#{game_data.displaying_word.capitalize}\nWrite the word"

  input = gets.chomp.downcase
  
    if input.include?("/")
      case input
      when "/save"
        system("clear")
        puts "Insert save name!"
        save_name = gets.chomp

        game_data.language = "English"
        game_data.save_game(save_name)
      when "/load"
        system("clear")

        if Dir.empty?("../data")
          puts "There's no saved data!"
          sleep(3)
          system("clear")
        else
          saves_names = Dir.entries("../data")
          .select {|save_name| save_name != "." && save_name != ".."}
          .map {|save_name| save_name.gsub(".json", "")}
          puts "Saves\n#{saves_names}"

          puts "Write the save name:"
          save_name = gets.chomp
          game_data.load_game(save_name)

          case game_data.language
          when "English"
            display_english(game_data)
          when "Italian"
            display_italian(game_data)
          when "Dutch"
            display_dutch(game_data)
          end 
        end
      when "/menu"
        default_menu(game_data)
      when "/exit"
        system("clear")
        puts "Thank you for playing.\nGoodbye!"
        sleep(3)
        system("clear")
        exit!
      when "/debug"
        system("clear")
        puts game_data
      else
        system("clear")
        puts "Invalid input!"
      end
    elsif input.length != game_data.secret_word.length || input =~ /[!@£#$%^&*()_+{}:;'"?><.,1234567890]/ || game_data.wrong_letters.include?(input)
      system("clear")
      puts "Invalid input!"
    else
      final_guess(input, game_data)
    end
  end
end

def turn_italian(game_data)
  while (game_data.lives_counter > 0)
    puts "--------------Lettere sbagliate-----------------"
    puts game_data.wrong_letters.to_s
    puts "--------------------------------------------"
    puts "\n\n\n\n\n\n\n\n\n"

    if game_data.lives_counter > 1
      puts "Hai #{game_data.lives_counter} vite"
    else
      puts "Hai solo 1 vita!"
    end

    puts "Parola: #{game_data.displaying_word.capitalize}"

    puts "Scrivi una lettera"
    input = gets.chomp.downcase

    if input.length > 1 && input.include?("/")
      case input
      when "/salva"
        system("clear")
        puts "Quale nome vuoi dare al salvataggio?\n(Usa '/ritorna' per tornare al gioco)"
        save_name = gets.chomp

        if save_name.capitalize != "/ritorna"
          game_data.language = "Italian"
          game_data.save_game(save_name)
        end
        system("clear")
      when "/carica"
        system("clear")

        if Dir.empty?("../data")
          puts "Non ci sono salvataggi!"
          sleep(3)
          system("clear")
        else
          saves_names = Dir.entries("../data")
          .select {|save_name| save_name != "." && save_name != ".."}
          .map {|save_name| save_name.gsub(".json", "")}
          puts "Salvataggi\n#{saves_names}"

          puts "Scrivi il nome del salvataggio!\n(Usa '/ritorna' per tornare al gioco)"
          save_name = gets.chomp
          if save_name.downcase != "/ritorna"
            game_data.load_game(save_name)
  
            case game_data.language
            when "English"
              display_english(game_data)
            when "Italian"
              display_italian(game_data)
            when "Dutch"
              display_dutch(game_data)
            end
          end
          system("clear")
        end
      when "/menu"
        italian_menu(game_data)
      when "/esci"
        system("clear")
        puts "Grazie per aver giocato.\nArrivederci!"
        sleep(3)
        system("clear")
        exit!
      when "/debug"
        system("clear")
        puts game_data
      else
        system("clear")
        puts "Input non valido!"
      end
    elsif input.length > 1 || input =~ /[!@£#$%^&*()_+{}:;'"?><.,1234567890]/ || game_data.wrong_letters.include?(input) || game_data.displaying_word.include?(input)
      system("clear")
      puts "Input non valido!"
    else
      system("clear")
      indovina(input, game_data)
    end

    if game_data.secret_word.include?(game_data.displaying_word)
      system("clear")
      puts "Complimenti!\nHai vinto."
      sleep(3)
      italian_menu(game_data)
    end
  end

  puts "Ultima possibilità\nProva ad indovinare la parola con le informazioni guadagnate fino ad ora!"

  while (game_data.lives_counter = 0)
  
  puts "#{game_data.wrong_letters}\n\n\n#{game_data.displaying_word.capitalize}\nScrivi la parola"

  input = gets.chomp.downcase
  
    if input.include?("/")
      case input
      when "/salva"
        system("clear")
        puts "Quale nome vuoi dare al salvataggio?\n(Usa '/ritorna' per tornare al gioco)"
        save_name = gets.chomp

        if save_name.capitalize != "/ritorna"
          game_data.language = "Italian"
          game_data.save_game(save_name)
        end
        system("clear")
      when "/carica"
        system("clear")

        if Dir.empty?("../data")
          puts "Non ci sono salvataggi!"
          sleep(3)
          system("clear")
        else
          saves_names = Dir.entries("../data")
          .select {|save_name| save_name != "." && save_name != ".."}
          .map {|save_name| save_name.gsub(".json", "")}
          puts "Salvataggi\n#{saves_names}"

          puts "Scrivi il nome del salvataggio!\n(Usa '/ritorna' per tornare al gioco)"
          save_name = gets.chomp
          if save_name.downcase != "/ritorna"
            game_data.load_game(save_name)
  
            case game_data.language
            when "English"
              display_english(game_data)
            when "Italian"
              display_italian(game_data)
            when "Dutch"
              display_dutch(game_data)
            end
          end
          system("clear")
        end
      when "/menu"
        italian_menu(game_data)
      when "/esci"
        system("clear")
        puts "Grazie per aver giocato.\nArrivederci!"
        sleep(3)
        system("clear")
        exit!
      when "/debug"
        system("clear")
        puts game_data
      else
        system("clear")
        puts "Input non valido!"
      end
    elsif input.length != game_data.secret_word.length || input =~ /[!@£#$%^&*()_+{}:;'"?><.,1234567890]/ || game_data.wrong_letters.include?(input)
      system("clear")
      puts "Input non valido!"
    else
      ultimo_tentativo(input, game_data)
    end
  end
end