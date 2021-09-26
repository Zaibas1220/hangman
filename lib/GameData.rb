require "./random_word"
require "json"

class GameData
  attr_accessor :wrong_letters, :secret_word, :displaying_word, :lives_counter, :language

  def new(language)
    @wrong_letters = []
    @secret_word = ""
    @displaying_word = ""
    @lives_counter = 6
    @language = ""
  end

  def initialize_variables(language)
    @wrong_letters = []
    @secret_word = random_word()
    @displaying_word = building_string
    @lives_counter = 6 - @wrong_letters.length
    @language = language
  end

  def italian_word()
    @secret_word = parola_casuale()
    @displaying_word = building_string()
  end

  def update_lives()
    @lives_counter = 6 - @wrong_letters.length
  end

  def building_string()
    word_length = @secret_word.length - 1
    string = ""

    for i in 0..word_length
      string += "_"
    end
    string
  end

  def as_json()
    {
      wrong_letters: @wrong_letters,
      secret_word: @secret_word,
      displaying_word: @displaying_word,
      lives_counter: @lives_counter,
      language: @language
    }
  end

  def to_json()
    as_json().to_json()
  end

  def from_json(json)
    hash = JSON.parse(json)
    Dir.chdir("../lib")
    @wrong_letters = hash["wrong_letters"]
    @secret_word = hash["secret_word"]
    @displaying_word = hash["displaying_word"]
    @lives_counter = hash["lives_counter"]
    @language = hash["language"]
  end

  def to_s()
    "_________________________________________\nWrong letters: #{@wrong_letters}\nSecret word: #{@secret_word}\nDisplaying word: #{@displaying_word}\nLives: #{@lives_counter}\nLanguage: #{@language}\n_________________________________________\n\n"
  end

  def save_game(save_name)
    save_name +=  ".json"
    json = to_json()
    Dir.chdir("../data")
    save = File.new(save_name, "w+")
    save.write(json)
    Dir.chdir("../lib")
  end

  def load_game(save_name)
    Dir.chdir("../data")
    path = "./#{save_name}.json"
    from_json(File.open(path).read)
  end
end
