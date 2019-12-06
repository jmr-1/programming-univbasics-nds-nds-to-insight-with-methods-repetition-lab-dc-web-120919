$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

require "pry"

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0

  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end

  total
end

def list_of_directors(source)
  dir_array = []
  #creates new array and adds director names to them

  source.each_with_index do |value, index|

    dir_array << source[index][:name]
  end 

  return dir_array 
end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total

  total_g = 0 
  d_name = list_of_directors(source) #initialize an array of directors
  d_total = directors_totals(source) #initialize hash of director gross 

  d_total.each_with_index do |(key, value), index|

    total_g += value 
  end 
  

  return total_g 
end


