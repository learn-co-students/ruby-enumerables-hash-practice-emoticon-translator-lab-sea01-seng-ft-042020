require "yaml"
require "pry"


def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  new_hash = {}
    emoticons.each do |description, symbol|
      new_hash[description] = {}
      new_hash[description][:english] = symbol[0]
      new_hash[description][:japanese] = symbol[1]
    end
    new_hash
    # binding.pry
end

def get_japanese_emoticon(file_path, emoticon)
  my_hash = load_library(file_path)
  emoticon = my_hash.keys.find do |key|
    my_hash[key][:english] == emoticon
  end
  emoticon ? my_hash[emoticon][:japanese]:
  "Sorry, that emoticon was not found"
end
  

def get_english_meaning(file_path, emoticon)
  my_hash = load_library(file_path)
  emoticon = my_hash.keys.find do |key|
    my_hash[key][:japanese] == emoticon
end
emoticon ? emoticon:
"Sorry, that emoticon was not found"
end



