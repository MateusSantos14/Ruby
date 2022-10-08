require_relative '../extra_operations'
require 'net/http'
require 'json'

module Calculator
  class Operations
    include ExtraOperations
    
    def biased_mean(grades, blacklist)
      grades = grades - blacklist
      media = 0
      for aluno in grades do
        media += aluno[1]/grades.length
      end
      puts "Media preconceituosa = #{media}\n\n\n"
    end
  
    def no_integers(numbers)
      puts "Números divisíveis por 25:\n"
      for a in numbers do
        aux = 25
        while aux<=a
          if aux == a
            puts "#{a}\n"
            break
          else
            aux = aux+25
          end
        end
      end
    end
  
    def filter_films(genres, year)
      count = 0
      films = get_films
      for movie in films[:movies] do
        if movie[:year] == year and movie[:genres].include?(genres)
          puts "Titulo: #{movie[:title]}"
          puts "Ano de lançamento: #{movie[:year]}"
          puts "Generos:"
          for genr in movie[:genres] do
            puts "#{genr}"
          end
          puts "Atores: #{movie[:actors]}"
          puts "Diretor: #{movie[:Diretor]}"
          puts "Sinopse: #{movie[:plot]}"
          count+=1
        end
      end
      if count==0
        puts "Não há filmes do genero no ano escolhido."
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
