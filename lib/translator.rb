require "yaml" 

def load_library(path)
 
   emoticons_hash = YAML.load_file("./lib/emoticons.yml")

    new_hash = {}

    emoticons_hash.each do |key,value|
     new_hash[key] = {
       :english => value[0],
       :japanese => value[1]
     }
   end

  new_hash
  
 end	
 
def get_japanese_emoticon(path, emoticon)
  emoticons_hash = load_library(path)
   emoticons_hash.select do |key, value|
     if emoticon == value[:english]
       return value[:japanese]
     end
   end
   unless emoticons_hash.include?(emoticon)
     return "Sorry, that emoticon was not found"
   end
  end
  
  def get_english_meaning(path, emoticon)
  emoticons_hash = load_library(path)
   emoticons_hash.select do |key, value|
     if emoticon == value[:japanese]
       return key
     end 
   end 
     unless emoticons_hash.include?(emoticon)
     return "Sorry, that emoticon was not found"
   end
  end