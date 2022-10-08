require_relative '../extra_operations'
require 'net/http'
require 'json'

module Calculator
  class Operations
    include ExtraOperations
    
    def biased_mean(grades, blacklist)
      grades = JSON.parse(grades)
      media = 0
      cout = 0
      blacklist = blacklist.split(" ")
      grades.each do |key, value|
        if not blacklist.include?(key)
          media += value
          cout += 1
        end
      end
      media = media/cout
      puts "Media preconceituosa = #{media.round(2)}\n\n\n"
    end
  
    def no_integers(numbers)
      puts "Números divisíveis por 25:\n"
      for number in numbers do
        #Confere se tem dos digitos, depois confere se terminar com: 00 25 50 75
        if number.length>=2 and ((number[-1] == "0" and (number[-2] == "5" or number[-2] == "0" )) or (number[-1] == "5" and (number[-2] == "2" or number[-2] == "7" )))
          print "S "
        else
          print "N "
        end
      end
      puts "\n\n\n"
    end
  
    def filter_films(genres, year)
      count = 0
      films = get_films
      puts "Filmes:\n"
      genres = genres.split(" ")
      for movie in films[:movies] do
        if movie[:year].to_i >= year.to_i
          genero_selecionado = 0
          for genero in movie[:genres] do
            if genres.include?(genero)
              genero_selecionado +=1
            end
          end
          if genero_selecionado==genres.length
            genero_selecionado = 1
          else
            genero_selecionado = 0
          end
          if genero_selecionado == 1
            puts "Titulo: #{movie[:title]}"
          end
        end
      end
      puts "\n\n\n"
    end
    
    private
  
    def get_films
      url = 'https://raw.githubusercontent.com/yegor-sytnyk/movies-list/master/db.json'
      uri = URI(url)
      response = Net::HTTP.get(uri)
      return JSON.parse(response, symbolize_names: true)
    end
  end
end
