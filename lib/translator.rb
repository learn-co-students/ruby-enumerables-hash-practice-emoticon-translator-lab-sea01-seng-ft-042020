# require modules here
require 'pry'
require 'yaml'

def load_library(yaml_file)
  # code goes here
get_meaning = {}
get_emoticon =  {}
translation = {}
library = YAML.load_file(yaml_file)
library.each do |meaning, emoticon_array|
  get_meaning[(emoticon_array[1])] = meaning
  get_emoticon[(emoticon_array[0])] = emoticon_array[1]
end
translation["get_meaning"] = get_meaning
translation["get_emoticon"] = get_emoticon
translation
end



def get_japanese_emoticon(yaml_file,emoticon)
  # code goes here
library = load_library(yaml_file)
  if library["get_emoticon"].include?(emoticon)
    library["get_emoticon"][emoticon]
  else
    "Sorry, that emoticon was not found"
  end  
end

def get_english_meaning(yaml_file,meaning)
  # code goes here
  library = load_library(yaml_file)
  if library["get_meaning"].include?(meaning)
    library["get_meaning"][meaning]
  else
    "Sorry, that emoticon was not found"
  end  
end