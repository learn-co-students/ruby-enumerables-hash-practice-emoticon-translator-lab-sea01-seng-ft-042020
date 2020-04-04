require "yaml"
require "pry"

def load_library(file)
  library = YAML.load_file(file)
  new_library = {}
  library.each do |emoticon, symbol|
  new_library[emoticon] = {:english => symbol[0], :japanese => symbol[1]}
end
new_library
end

def get_japanese_emoticon(file, emoticon)
  library = load_library(file)
  library.each do |memo, languages|
    if emoticon == languages[:english]
      return languages[:japanese]
  end
  end
"Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  library = load_library(file)
  library.each do |memo, languages|
    if emoticon == languages[:japanese]
      return memo
    end
  end
  "Sorry, that emoticon was not found"
end