# require modules here
require 'yaml'
require 'pry'

def load_library(library)
  library_hash = YAML.load_file('lib/emoticons.yml')
  new_hash = {}
  library_hash.each do |key, value|
    new_hash[key] = {
      :english => value[0],
      :japanese => value[1]
    }
  end
  new_hash
  #binding.pry
end

def get_japanese_emoticon(library, emoticon)
  library_hash = load_library(library)
  library_hash.select do |key, value|
    if emoticon == value[:english]
      return value[:japanese]
    end
  end
  unless library_hash.include?(emoticon)
    return "Sorry, that emoticon was not found"
  end
  
end

def get_english_meaning(library, emoticon)
  library_hash = load_library(library)
  library_hash.select do |key, value|
    if emoticon == value[:japanese]
      return key
    end
  end
  unless library_hash.include?(emoticon)
    return "Sorry, that emoticon was not found"
  end
  #binding.pry
end