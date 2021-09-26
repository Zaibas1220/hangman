require "./display.rb"

def select_language(current_language, game_data)
  case current_language
  when "english"
    puts "Select a language!"
    puts "1: Italian"
    puts "2: Dutch"
    puts "3: Return Back"

    cycle = true

    while cycle
      selection = gets.chomp
      case selection
      when "1"
        system("clear")
        italian_menu(game_data)
      when "2"
        system("clear")
        case current_language
          when "english"
            system("clear")
            puts "Currently unvaiable.\nYou will be redirected to the main menu"
            sleep(3)
            default_menu(game_data)
          when "italian"
            system("clear")
            puts "Momentaneamente non disponibile.\nVerrai riportato al menu principale"
            sleep(3)
            italian_menu(game_data)
          end
      when "3"
        system("clear")
        default_menu(game_data)
      else
        system("clear")
        puts "Invalid Option!"
      end
    end
  when "italian"
    puts "Scegli una lingua!"
    puts "1: Inglese"
    puts "2: Olandese"
    puts "3: Torna al Menu"

    cycle = true

    while cycle
      selection = gets.chomp
      case selection
      when "1"
        system("clear")
        default_menu(game_data)
      when "2"
        system("clear")
        dutch_menu(game_data)
      when "3"
        system("clear")
        italian_menu(game_data)
      else
        system("clear")
        puts "Opzione non Valida!"
      end
    end
  when "dutch"
  end
end

def default_menu(game_data)
  system("clear")
  puts "Welcome to the HangMan game!"
  puts "Select your option"

  puts "1: New Game"
  puts "2: Load Game"
  puts "3: Language"
  puts "4: Exit Game"

  cycle = true

  while (cycle)
    selection = gets.chomp

    case selection
    when "1"
      system("clear")
      game_data.initialize_variables("English")
      display_english(game_data)
    when "2"
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

        puts "\nWrite the save name!\n(Use '/back' to return to the game)"
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
        else
          default_menu(game_data)
        end
      end
    when "3"
      system("clear")
      select_language("english", game_data)
    when "4"
      system("clear")
      puts "Thank you for playing.\nGoodbye!"
      sleep(3)
      system("clear")
      exit!
    else
      puts "Invalid Input!"
    end
  end
end

def italian_menu(game_data)
  system("clear")
  puts "Benvenuto al gioco dell'Impiccato!"
  puts "Scegli un'opzione"

  puts "1: Nuova Partita"
  puts "2: Carica Partita"
  puts "3: Lingua"
  puts "4: Esci"

  cycle = true

  while (cycle)
    selection = gets.chomp
    game_data = GameData.new

    case selection
    when "1"
      system("clear")
      game_data.initialize_variables("Italian")
      game_data.italian_word()
      display_italian(game_data)
    when "2"
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

        puts "\nScrivi il nome per il salvataggio!\n(Usa '/ritorna' per tornare al menu)"
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
        else
          italian_menu(game_data)
        end
      end
    when "3"
      system("clear")
      select_language("italian", game_data)
    when "4"
      system("clear")
      puts "Grazie per aver giocato.\nArrivederci!"
      sleep(3)
      system("clear")
      exit!
    else
      puts "Input inesistente!"
    end
  end
end

def dutch_menu()
  puts "Cooming Soon!"
end

game_data = GameData.new()
default_menu(game_data)