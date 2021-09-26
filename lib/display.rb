require "./turn.rb"

def display_english(game_data)
    system("clear")
    puts "________________________________Rules________________________________"
    puts "-You can write 1 letter every turn." 
    puts "-If you write a letter that it's in the secret word then the system will add it up on the correct spot."
    puts "-If you write a letter that it isn't in the secret word then the system will add it up on list of the wrong letters."
    puts "-Everytime you write a wrong letter, the system will also remove one life from the 6 given to you."
    puts "-When you arrive at 0 lives the system will give you one last chance to guess the word with the letters that you've achieved."
    puts "-If you try to write more than one letter or a number, the system will warn you that the input is not valid."
    puts "-If you write '/save' you can save the game you're currently playing."
    puts "-If you write '/load' you can load a game saved before and if there isn't saves then the game will warn you and resume."
    puts "-If you write '/menu' you will be redirected to the main menu."
    puts "-If you write '/exit' you will leave the game without saving."
    puts "_____________________________________________________________________\n\n\n"

    sleep(3)

    puts "Press 'Enter' to continue!"
    gets.chomp()

    system("clear")

    puts "Game Started\nTry to guess the word!"
    turn_english(game_data)
end

def display_italian(game_data)
    system("clear")
    puts "________________________________Regole________________________________"
    puts "-Puoi scrivere 1 lettera ogni turno." 
    puts "-Se scrivi una lettera compresa nella parola segreta allora il sistema l'aggiungerà nel punto giusto."
    puts "-Se scrivi una lettera non compresa nella parola segreta allora il sistema la inserirà nella lista di lettere sbagliate."
    puts "-Ogni volta che sbagli una lettera il sistema togliera una vita dalle 6 inizialmente date."
    puts "-Quando arrivi a 0 vite il sistema ti darà un ultima possibilità per indovinare la parola con le lettere che hai scoperto."
    puts "-Se scrivi più di una lettera o un numero il sistema ti avviserà che l'input non è valido."
    puts "-Se scrivi '/salva' potrai salvare i progressi."
    puts "-Se scrivi '/carica' potrai scegliere un salvataggio e giocarlo, se non ci sono salvataggi disponibili il sistema ti avvisera e tornerà alla partita."
    puts "-Se scrivi '/menu' il sistema ti riporterà al menu principale."
    puts "-Se scrivi '/esci' puoi uscire dal gioco senza salvare."
    puts "______________________________________________________________________\n\n\n"

    sleep(3)

    puts "Premi il tasto 'Invio' per continuare!"
    gets.chomp()

    system("clear")

    puts "Comincia il gioco\nProva ad indovinare la parola!"
    turn_italian(game_data)
end