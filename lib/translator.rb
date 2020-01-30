# require modules here
require "yaml"

def load_library(file)
  emoticons = YAML.load_file("#{file}")
  
  hash = {
    'get_meaning' => {},
    'get_emoticon' => {}
  }

  emoticons.each { |key, value| 
    hash['get_meaning'][value[1]] = key
    hash['get_emoticon'][value[0]] = value[1]
  }
  return hash
end

# load_library("./lib/emoticons.yml")

def get_japanese_emoticon(file, emoticon)
  
  result = ""
  
  if !load_library(file)['get_emoticon'][emoticon]
    result = "Sorry, that emoticon was not found"
  else 
    result = load_library(file)['get_emoticon'][emoticon]
  end 
  
    return result
end

def get_english_meaning(file, emoticon)
  load_library(file)['get_meaning'][emoticon]
  
end