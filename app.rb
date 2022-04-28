require 'bundler'
require 'Player'
require 'Board'
require 'Board_case'
Bundler.require
$:.unshift File.expand_path("./../lib", __FILE__)


class Application
    def perform
        puts @array_board_case
        puts "Welcome to the game"
        gets
        puts "Player 1 choose your name"
        print "> "
        player1 = Player.new("#{gets.chomp}", "x")
        puts "Welcome #{player1.name} you will play with \"x\""
        gets
        puts "Player 2 choose your name"
        print "> "
        player2 = Player.new("#{gets.chomp}", "o")
        puts "Welcome #{player2.name} you will play with \"o\""
        gets
        puts "It's a game between #{player1.name} and #{player2.name} !"
        gets
        puts
            
        # TO DO : méthode qui initialise le jeu puis contient des boucles while pour faire tourner le jeu tant que la partie n'est pas terminée.
    end
  
  end
  


Application.new.perform