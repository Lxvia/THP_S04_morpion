require_relative 'Board_case'
require_relative 'Player'

class Board

  player1 = Player.new("Marcel", "x")
  player2 = Player.new("Gertrude", "o")

   
    #Optionnellement on peut aussi lui rajouter un autre sous le nom @count_turn pour compter le nombre de coups joué
    attr_accessor :array_board_case #la classe a 1 attr_accessor : un array/hash qui contient les BoardCases.
  
  
    def initialize #Quand la classe s'initialize, elle doit créer 9 instances BoardCases
        @array_board_case = [] #Ces instances sont rangées dans un array/hash qui est l'attr_accessor de la classe
        @array_board_case << a1 = BoardCase.new(" ", "a1")   
        @array_board_case << a2 = BoardCase.new(" ", "a2")
        @array_board_case << a3 = BoardCase.new(" ", "a3")
        @array_board_case << b1 = BoardCase.new(" ", "b1")
        @array_board_case << b2 = BoardCase.new(" ", "b2")
        @array_board_case << b3 = BoardCase.new(" ", "b3")
        @array_board_case << c1 = BoardCase.new(" ", "c1")
        @array_board_case << c2 = BoardCase.new(" ", "c2")
        @array_board_case << c3 = BoardCase.new(" ", "c3") 
    end
  
    def play_turn
        turn = 1
        case turn
        when turn == 1 || 3 || 5 || 7 || 9 #1) demande au bon joueur ce qu'il souhaite faire
            puts "Germaine it's your turn, what do you want to do ?"
        when turn == 2 || 4 || 6 || 8 || 10
            puts "Marc it's your turn, what do you want to do ?"
        end
        
    def select_board_cases
        puts "Write the placement you want :"
        choice = gets.chomp
        case choice = "a1"
            a1 = BoardCase.new("x", "a1")
        when choice = "a2"
            a1 = BoardCase.new("x", "a2")
        when choice = "a3"
            a3 = BoardCase.new("x", "a3") 
        when choice = "b1"
            b1 = BoardCase.new("x", "b1")
        when choice = "b2"
            b2 = BoardCase.new("x", "b2")
        when choice = "b3"
            b3 = BoardCase.new("x", "a1")
        when choice = "c1"
            a1 = BoardCase.new("x", "a1")
        when choice = "c2"
            a1 = BoardCase.new("x", "a1")
        when choice = "c3"
            a1 = BoardCase.new("x", "a1")
        
      #2) change la BoardCase jouée en fonction de la valeur du joueur (X ou O)
    end
  
    def victory?
      #TO DO : une méthode qui vérifie le plateau et indique s'il y a un vainqueur ou match nul
    end

    
end

Board.new.play_turn

