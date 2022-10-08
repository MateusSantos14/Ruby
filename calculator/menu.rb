require_relative 'operations'

module Calculator
  class Menu
    def initialize
      operadores = Operations.new
      puts "Calculadora\n"
      puts "Operações:\n"
      puts "1 - Operação Média Preconceituosa\n"
      puts "2 - Operação Calculadora sem números\n"
      puts "3 - Operação Filtro de filmes\n"
      puts "4 - Sair"
      operacao = gets.chomp.to_i
      #Media Preconceituosa
      if(operacao == 1)
        alunos_json = "{"
        puts "Digite o nome dos alunos e suas notas:"
        controlador = 1
        loop do
          puts "Nome:"
          nome = gets.chomp
          puts "Nota:"
          nota = gets.chomp.to_f
          alunos_json += "\"#{nome}\":#{nota}"
          puts "Deseja adicionar outro aluno:\n1-Sim 2-Não"
          controlador = gets.chomp.to_i
          if controlador == 2
            break
          end
          alunos_json+=", "
        end
        alunos_json+="}"
        puts "Digite o nome dos alunos da lista negra:"
        blacklist = gets.chomp
        operadores.biased_mean(alunos_json,blacklist)
      #Divisiveis por 25
      elsif(operacao == 2)
        valores = Array.new
        puts "Digite uma série de números para saber se eles são divisiveis por 25, se deseja parar de digitar, digite 0:"
        loop do
          valor = gets.chomp
          if valor == "0"
            operadores.no_integers(valores)
            break
          else
            valores.push(valor)
          end
        end
      #Filtro de filmes
      elsif(operacao == 3)
        puts "Digite o genero do filme:\n Generos:"
        generos = [
          "Comedy",
          "Fantasy",
          "Crime",
          "Drama",
          "Music",
          "Adventure",
          "History",
          "Thriller",
          "Animation",
          "Family",
          "Mystery",
          "Biography",
          "Action",
          "Film-Noir",
          "Romance",
          "Sci-Fi",
          "War",
          "Western",
          "Horror",
          "Musical",
          "Sport"
        ]
        for a in generos do
          puts "#{a}"
        end
        genero = gets.chomp
        puts "Digite o ano do filme:"
        ano = gets.chomp
        operadores.filter_films(genero,ano)
      #Sair
      elsif operacao==4
        abort
      #Número inválido
      else
        puts "Opção inválida.\n\n\n"
      end
    end
  end
end