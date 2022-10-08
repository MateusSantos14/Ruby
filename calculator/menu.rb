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
        alunos = Array.new
        blacklist = Array.new
        puts "Digite o nome dos alunos e suas notas:"
        controlador = 1
        while controlador != 2
          puts "Nome:"
          nome = gets.chomp
          puts "Nota:"
          nota = gets.chomp.to_f
          alunos.push([nome,nota])
          puts "Deseja adicionar outro aluno:\n1-Sim 2-Não"
          controlador = gets.chomp.to_i
        end
        puts "Escolha os alunos da lista negra:"
        loop do
          puts "0 - Calcular média"
          for a in alunos-blacklist do
            puts "#{alunos.index(a)+1} - #{a[0]}"
          end
          to_lista = gets.chomp.to_i
          if to_lista!=0
            blacklist.push(alunos[to_lista-1])
          else
            operadores.biased_mean(alunos,blacklist)
            break
          end
        end
      #Divisiveis por 25
      elsif(operacao == 2)
        valores = Array.new
        puts "Digite uma série de números para saber se eles são divisiveis por 25, se deseja parar de digitar, digite 0:"
        loop do
          valor = gets.chomp.to_i
          if valor == 0
            operadores.no_integers(valores)
            break
          else
            valores.push(valor)
          end
        end
      #Filtro de filmes
      elsif(operacao == 3)
        puts "Escolha o genero do filme:"
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
          puts "#{generos.index(a)+1} - #{a}"
        end
        genero = nil
        loop do
          genero = gets.chomp.to_i
          if genero>0 and genero<generos.length
            genero = generos[(genero)-1]
            break
          else
            puts "Opção inválida"
          end
        end
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