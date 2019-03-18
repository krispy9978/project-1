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
	g.setplayer1
	g.setplayer2
	g.clearmatrix
	g.hotspots
	g.generatemines
	
	puts "#{g.matrix}\n"
	
	playing = true
	while playing do
		g.displaymenu
		input = @input.gets.chomp
		option = input.to_i
		case option
			when 9 
			g.finish
			playing false
			####################the following code is an example and wont work with minesweeper###########
			#################### put in place for a guideline                                  ###########
		when 1
		        puts "beggining game"
			while turn != 0 do
				if turn == 1
					puts"player 1 enter coordinate x and y to place token to uncover mine"
					coord = @input.gets.chomp
					#split into two i's?
					#
					if  coord.to_i.to_s == coord
						place = coord.to_i
						if place != 0 && place <= #42?
							#place X value to column push
							turn = 2
							g.setmatixcolumnvalue(place-1, g.player1.to_s)
							g.checkwinner
							#g.resulta +=1
							if g.winner ==1 then
								puts "player 1 wins!"
								turn = 0
							end
						elsif place == 0
							turn = 0
						else
							puts "invalid input"
						end
					      else
						turn = 1
					end
					
				elsif turn == 2
					puts "Player 2 enter coordinate x and y to place token to uncover mine"
					coord = @input.gets.chomp
					if coord.to_i.to_s == coord
						place = coord.to_i
						if place != 0 && place <= #42?
							turn = 1
							g.setmatrixcolumnvalue(place-1, g.player2.to_s)
							g.checkwinner
							if g.winner == 2 then
								puts "player 2 wins"
								turn = 0
							end
						elsif place = 0
							turn = 0
						else
							puts "invalid input"
						end
					else
						place = 2
					end
				else
					puts "whose turn is it?"
				end
				if turn != 0 then
					g.displaykey(matrixkey)#ammend#########
					g.displaymatrix###############
				end
			end
			
		
		when 2
		    puts "begin new game"
		    g.clearmatrix
		    puts "matrix initialised#{g.matrix}\n"
		
		else
			g.finish
			
		end
		
	end

<<<<<<< HEAD
=======

	
		
		

>>>>>>> 1cf513f2b473f2c8cfca6c1e6756870f061375e0








	
	# Any code added to output the activity messages to the command line window should be added above.

		exit	# Does not allow command-line game to run code below relating to web-based version
	end

end
# End modules

# Sinatra routes

	# Any code added to output the activity messages to a browser should be added below.



	# Any code added to output the activity messages to a browser should be added above.

# End program
