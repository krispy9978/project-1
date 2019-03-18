# Ruby code file - All your code should be located between the comments provided.

# Add any additional gems and global variables here
require 'sinatra'

# The file where you are to write code to pass the tests must be present in the same folder.
# See http://rspec.codeschool.com/levels/1 for help about RSpec
require "#{File.dirname(__FILE__)}/wad_ms_gen_01"

# Main program
module MS_Game
	@input = STDIN
	@output = STDOUT
	g = Game.new(@input, @output)
	playing = true
	input = ""
	option = 0
	turn = 0
	placed = nil
		
	@output.puts 'Enter "1" runs game in command-line window or "2" runs it in web browser.'
	game = g.getinput
	if game == "1"
		@output.puts "Command line game"
	elsif game == "2"
		@output.puts "Web-based game"
	else
		@output.puts "Invalid input! No game selected."
		exit
	end
		
	if game == "1"
		
	# Any code added to command line game should be added below.
	
	g.start
	playing = true
	while playing do
		g.displaymenu
		input = @input.gets.chomp
		option = input.to_i
		case option
			when 9 
			g.finish
			playing false
		when 1
		     #call saved matrix from previous state and continue [Possible .txt. file]
		     # displayplayerscore ffrom save file [or variable with score value]
		
		when 2
		     #clear score and display begin game
		
		else
			
		end
		
	end

	class PlaymsCom
		#require 'Game'
		attr_accssor :player1 :player2 #?????
		attr_reader                     #????
		attr_writer                      #????
		
		def initialize ()
			@player1 = Player.new(name: "Player 1", token: "X")
                        @player2 = Player.new(name: "Player 2", token: "O")
                        @players = [player1, player2]
                        @game    = Game.new(players)
                        @printer = game.printer
                        @board   = game.board
		end
		
		def start_game
			players_turn
		end
		
		def players_turn
		end
		
		
		def countscore
		end
		
		def ask_for_coord
		end
		
		def check_inputted_coord
		end
		
		def display_menu
			if #new 
				#clear score // generate hotspots
			elsif #start 
				#load matrix coord values
				
		        else #exit
				#exit game
				
		end 
		
		
		def newgame
			#clear board
			#display matrix 
			#get player turn 
			#check winner
		end
			
	end
		
		









	
	# Any code added to output the activity messages to the command line window should be added above.

		exit	# Does not allow command-line game to run code below relating to web-based version
	end

end
# End modules

# Sinatra routes

	# Any code added to output the activity messages to a browser should be added below.



	# Any code added to output the activity messages to a browser should be added above.

# End program
