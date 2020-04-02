# Require yaml library as it is used in load_library (Would it be better to require this in the method it is used in?)
require "yaml"

def load_library(file_path)
  # Initialize output variable
  output = {}
  # Load YAML file and assign english and japanese symbols via hard code
  YAML.load_file(file_path).each_pair {|key,value| output[key] = {:english => value[0], :japanese => value[1]}}
  return output
end

def get_japanese_emoticon(file_path, english_emoji)
  # Load emoji library then loop through library looking for a match of the english_emoji, return japenese emoji if found
  load_library(file_path).each_pair {|key,value| return value[:japanese] if value[:english] == english_emoji}
  # If the english_emoji was not found return a error message
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, japanese_emoji)
  # Load emoji library then loop through library looking for a match of the japenese_emoji, return meaning if found
  load_library(file_path).each_pair {|key,value| return key if value[:japanese] == japanese_emoji}
  # If the japanese_emoji was not found return a error message
  return "Sorry, that emoticon was not found"
end
