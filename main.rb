require_relative "lib/game"
require_relative "lib/guesser/computer_guesser"
require_relative "lib/guesser/human_guesser"
require_relative "lib/mastermind/computer_mastermind"
require_relative "lib/mastermind/human_mastermind"
system ("clear")
puts "This is a 'Mastermind' game."
puts "Do you want to play as a mastermind? (y/n)"
reply = gets.chomp.downcase
m = reply == "y" ? Mastermind::HumanMastermind.new : Mastermind::ComputerMastermind.new
puts "Do you want computer to play as guesser? (y/n)"
reply = gets.chomp.downcase
g = reply == "y" ? Mastermind::ComputerGuesser.new : Mastermind::HumanGuesser.new
game = Mastermind::Game.new(m,g)
game.play