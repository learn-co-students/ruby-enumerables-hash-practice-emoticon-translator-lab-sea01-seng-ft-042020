# require modules here
require 'yaml'

def load_library(path)
  emo_ref = YAML.load_file(path)
  lib = {}
  emo_ref.map do | name , array |
    lib[name] = { :english => array[0],:japanese => array[1] }
  end
  lib 
end

def get_japanese_emoticon(path,emo_en)
  lib = load_library( path )
  lib.each do | name , value |
    if lib[name][:english] == emo_en
      return lib[name][:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path,emo_jp)
  lib = load_library( path )
  lib.each do | key , value |
    if lib[key][:japanese] == emo_jp
      return key.to_s
    end
  end
  return "Sorry, that emoticon was not found"
end