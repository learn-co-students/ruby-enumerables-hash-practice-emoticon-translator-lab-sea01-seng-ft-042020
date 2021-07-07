# require modules here
require "yaml"

def load_library(library)
  emotsfile = YAML.load_file(library)
  sorted_emots = {}
  emotsfile.each do |key, value|
    if sorted_emots[key] == nil
      sorted_emots[key] = {}
    end
    sorted_emots[key][:english] = value[0]
    sorted_emots[key][:japanese] = value[1]
  end
  return sorted_emots
end

def get_japanese_emoticon(library, emot)
  emots = load_library(library)
  emots.each do |key1, value1|
    value1.each do |key2, value2|
      if value2 == emot
        return emots[key1][:japanese]
      end
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(library, emot)
  emots = load_library(library)
  emots.each do |key1, value1|
    value1.each do |key2, value2|
      if value2 == emot
        return key1
      end
    end
  end
  return "Sorry, that emoticon was not found"
end