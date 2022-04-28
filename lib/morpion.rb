class Morpion

  # On initialise le plateau, chaque espace représentant une case qui a un index
  def initialize
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " ", ]
      
  end

# On liste toutes les combination d'index possible qui donne la victoire (par ligne, puis colonne, puis diago)
  WIN_COMBINATIONS = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
  ]

#On crée le plateau de jeu grâce aux index du tableau
 def display_board
  puts "\n\n "
  puts "                #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "               -----------"
  puts "                #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "               -----------"
  puts "                #{@board[6]} | #{@board[7]} | #{@board[8]} "
  puts "\n\n "
 end

#On ajoute ça pour que lorsque qu'on va indiquer A1 cela acorresponde à l'index 0 et ainsi de suite
 def input_to_index(input)
  input.to_i - 1
 end

#Permet de remplacer l'espace vide par le token correspondant au joueur et ainsi remplir la case(change la valeur de " " à "X" ou "O")
 def move(index, token)
  @board[index] = token
 end

#Permet de vérifier si la case est libre (en écrivant comme ça raccourci l'écriture : évite d'ajouter if "condition" return true or false, là si l'index ne correspond pas à un espace ben ça veut dire que la position est prise)
 def position_taken?(index)
  @board[index] != " "
 end

#Permet de voir si l'entrée du joueur est valide : que la position ne soit pas prise et que l'index soit compris entre 0 et 8
 def valid_move?(index)
  !position_taken?(index) && index.between?(0, 8)
 end

#Compte le nombre de tour en comptant le nombre de case occupées (grâce à notre array) : si une case n'est pas un " " alors on a joué 1 tour, etc...
 def turn_count
  @board.count{|square| square !=" "}
 end

#Permet de savoir qui va jouer en se servant de turn.count, X va jouer en premier (turn.count = 0 =>even), si pas even, c'est aux "O" de jouer
 def current_player
  turn_count.even? ? "X" : "O"
 end

#1) On demande à l'utilisateur de rentrer un chiffre de 1 à 9 correspondant à un index (1 = A1, 2=A2 etc...)
#2) On vérifie si le chiffre est valide grâce à valid_move : index non utlisé et compris entre 0 et 8
#3) Si valide : on change le token de l'index selon le current player
#4) On affiche à nouveau le plateau en ayant changer la valeur de l'index joué.
#5) Si le chiffre n'est pas valide on relance turn
 def turn
  display_board
  puts "Please choose where to put your token (1-9): "
 index = input_to_index(gets.chomp)
  if valid_move?(index)
  move(index, current_player)
  display_board
  else
    turn
  end
end


#1) On définit si la partie est gagnée : 
# On reprend les array d'array de nos "win_condition" : Si la valeur des index de chaque array d'array de notre win_condition est la même alors la condition de victoire est remplie.
  def won?
      WIN_COMBINATIONS.any? do |combo| 
          if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] &&  @board[combo[1]] == @board[combo[2]]
              return combo
          end
      end
  end
 
  #Methode pour tester la draw, dans le cas où toute les cases sont remplies
  def full?
      @board.all?{|square| square != " "}
  end

  #Les conditions de draw sont remplies si toutes les cases ont des tokens sans que une condition de victoire soit remplie (retourne true si ces 2 conditions sont remplies)
  def draw?
      full? && !won?
  end

# Retrourne true si les conditions de victoire ou de draw sont remplies, met fin à la partie
  def over?
      won? || draw?
  end

#On demande si une variable remplie les conditions de victoire si c'est le cas on retourne??????????????????? 
  def winner
      if winning_combo = won?
          return @board[winning_combo[0]]
      end
  end

#On répète turn (fait jouer chaque joueur) jusqu'à ce que les conditions de over(victoire ou draw) soit réunies.
# + un petit puts
  def play
      turn until over?
      puts winner ? "Congrats, #{winner} won!" : "Sorry, it's a draw :("
  end
end