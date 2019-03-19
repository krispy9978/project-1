# Ruby code file - All your code should be located between the comments provided.

# Add any additional gems and global variables here
require 'sinatra'

# The file where you are to write code to pass the tests must be present in the same folder.
# See http://rspec.codeschool.com/levels/1 for help about RSpec
require "#{File.dirname(__FILE__)}/wad_ms_gen_01"

def switchPlayer(player)
	if player == 1
		return 2
	elsif player == 2
		return 1
	end
end

# Main program
module MS_Game
	@input = STDIN
	@output = STDOUT
	g = Game.new(@input, @output)
	$wg = MS_Game::Game.new(STDIN,STDOUT)
	playing = true
	input = ""
	option = 0
	$player = 1
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


	game_pause = false
	$game_playing = true


	if game == "1"

	# Any code added to command line game should be added below.
		g.start
		while(1)
		g.displaymenu
		option = g.getinput.chomp
		case option
		when "1"
			if game_pause == false
				@output.puts "No stored game, create a new game!"
				g.clearcolumns
				g.clearscores
				g.displayemptyframe
				g.generatemines
				g.setupgamematrix
				g.burrymine

				$player=1
			end

				$game_playing = true
         g.setplayer1
         g.setplayer2

         g.displaybegingame



         while $game_playing == true
             if $player == 1
                 g.displayplayer1prompt
             elsif $player == 2
                 g.displayplayer2prompt
             end
             @output.puts "Please enter the row value (Enter 0 to go back to menu)"
             a = gets.chomp.to_i
			case a

				when (a < 1 || a > 6)
					g.displayinvalidinputerror

				 when 0
					 game_pause=true
					 @output.puts "The game is paused, enter 1 to continue."
					 break


				 else
					 @output.puts "Please enter the column value"
					 b=gets.chomp.to_i
					 if (b < 1 || b > 7)
							 g.displayinvalidinputerror
						 else
						 a=a-1
						 b=b-1
						 g.getcolumnvalue(a,b)
						 g.setmatrixcolumnvalue(a,b)
						 # no room


						 g.updatematrix
						 g.display_gamematrix
						 g.checkwinner

					 $player=switchPlayer($player)
						 end
					 end
			 end




                   when "2"
			 @output.puts "New game created"
			 game_pause = false
			 g.clearcolumns


            when "9"
               @output.puts "Exit"
		break

     else g.displayinvalidinputerror
     end
	 end

	# Any code added to output the activity messages to the command line window should be added above.

		exit	# Does not allow command-line game to run code below relating to web-based version
	end

end
# End modules

# Sinatra routes

	# Any code added to output the activity messages to a browser should be added below.

	get "/" do
		$wg.start
	end

	# Any code added to output the activity messages to a browser should be added above.

# End program
