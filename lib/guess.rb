require "/home/peppe/Scrivania/projects/hangman/lib/GameData.rb"

def guess(input, game_data)
  if game_data.secret_word.include?(input)
    i = 0
    game_data.secret_word.each_char do |char|
      if input == char
        game_data.displaying_word[i] = input
      end
      i += 1
    end
    puts "Correct"
  else
    game_data.wrong_letters.push(input)
    puts "Wrong"
    game_data.update_lives
  end
end

def final_guess(input, game_data)
    if game_data.secret_word.include?(input.downcase) && game_data.secret_word.length == input.length
        system("clear")
        puts "Congratulation!\nYou win."
        sleep(3)
        default_menu(game_data)
    else
        system("clear")
        puts "Oh no!\nYou lost\nThe word was #{game_data.secret_word.capitalize}"
        sleep(3)
        default_menu(game_data)
    end
end

def indovina(input, game_data)
  if game_data.secret_word.include?(input)
    i = 0
    game_data.secret_word.each_char do |char|
      if input == char
        game_data.displaying_word[i] = input
      end
      i += 1
    end
    puts "Corretto"
  else
    game_data.wrong_letters.push(input)
    puts "Sbagliato"
    game_data.update_lives
  end
end

def ultimo_tentativo(input, game_data)
  if game_data.secret_word.include?(input.downcase) && game_data.secret_word.length == input.length
      system("clear")
      puts "Congratulazione!\nHai vinto."
      sleep(3)
      italian_menu(game_data)
  else
      system("clear")
      puts "Oh no!\nHai perso\nLa parola era #{game_data.secret_word.capitalize}"
      sleep(3)
      italian_menu(game_data)
  end
end