# https://www.primarysite-kidszone.co.uk/kidszone/resources/connect4.htm
# Ruby code file - All your code should be located between the comments provided.
# Credit to Nigel Beacham for the provided Rspec template
# Add any additional gems and global variables here

require 'sinatra'		# remove '#' character to run sinatra wen server
$myname = "Dewei LU"
$studentid = 5188190

# Main class module
module MS_Game
	# Input and output constants processed by subprocesses. MUST NOT change.
	TOKEN1 = "O" # mine found
	TOKEN2 = "X" # mine not found

	class Game
		attr_reader :matrix, :player1, :player2, :hotspots, :input, :output, :turn, :turnsleft, :winner, :played, :score, :resulta, :resultb, :guess
		attr_writer :matrix, :player1, :player2, :hotspots, :input, :output, :turn, :turnsleft, :winner, :played, :score, :resulta, :resultb, :guess

		def initialize(input, output)
			@input = input
			@output = output
		end

		def getinput
			txt = @input.gets.chomp
			return txt
		end

		# Any code/methods aimed at passing the RSpect tests should be added below.
        # displays messages at the start of the game
		def start
            @output.puts ("Welcome to Minesweeper!")
            @output.puts ("Created by: DEWEI LU")
            @output.puts ("Game started.")
            @output.puts ("Enter a coordinate to uncover if mine found.")
        end

        def created_by
            myname = DEWEI LU
        end

        def student_id
            student_id = 51881930
        end

        def displaybegingame
            @output.puts ("Begin game.")
        end

        def displaynewgamecreated
            @output.puts ("New game created.")
        end

        def finish
            @output.puts ("Game finished.")
        end

        def displaymenu
            @output.puts ("Menu: (1)Start | (2)New | (9)Exit\n")
        end

        def clearscores #reset score
            $resulta=0
            $resultb=0
        end

        def displayplayerscores
            @output.puts ("Player 1: #{$score1} and Player 2: #{$score2}")
        end

        def displayplayer1prompt
            @output.puts ("Player 1 to enter coordinate.")
        end

        def displayplayer2prompt
            @output.puts ("Player 2 to enter coordinate.")
        end

        def displayinvalidinputerror
            @output.puts ("Invalid input.")
        end

        def displaynomoreroomerror
            @output.puts ("No more room.")
        end

        def displaywinner(p)
            if    p == 1
                    @output.puts ("Player #{p} wins.")
            elsif p == 2
                    @output.puts ("Player #{p} wins.")
            end
						displayplayerscores
						$game_playing = false
            displaymenu
        end

				def setplayer1
					@player1 = "X"
				end

				def setplayer2
					@player2 = "X"
				end

				def getplayer1
						@player1 = "X"
				end

				def getplayer2
						@player2 = "X"
				end

        def clearcolumns
            $matrix = []
            for i in 0..5 do
                $matrix[i] = ["_", "_", "_", "_", "_", "_", "_"]
            end
        end


        def getcolumnvalue(row, column)
            @selectedcolumn = $matrix[row][column]
        end


        def setmatrixcolumnvalue(c, i)
            if $matrix[c][i] == "!"
                if $player == 1
                    $resulta += 1
                elsif $player == 2
                    $resultb += 1
                end
                $matrix[c][i] = "O"
                $gamematrix[c][i]= "O"
						elsif $matrix[c][i] == "X" || $matrix[c][i] == "O"
							$matrix_space = false
							@output.puts "no more room"

            else
                $matrix[c][i] = "X"
                $gamematrix[c][i]= "X"
            end
        end


        def displayemptyframe
            @title = "  1 2 3 4 5 6 7 "
            @rowAempty = "1|_|_|_|_|_|_|_|"
            @rowBempty = "2|_|_|_|_|_|_|_|"
            @rowCempty = "3|_|_|_|_|_|_|_|"
            @rowDempty = "4|_|_|_|_|_|_|_|"
            @rowEempty = "5|_|_|_|_|_|_|_|"
            @rowFempty = "6|_|_|_|_|_|_|_|"
            @output.puts ("#{@title}")
            @output.puts ("#{@rowAempty}")
						@output.puts ("#{@rowBempty}")
						@output.puts ("#{@rowCempty}")
						@output.puts ("#{@rowDempty}")
						@output.puts ("#{@rowEempty}")
						@output.puts ("#{@rowFempty}")
        end



        def generatemines
					pos = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42]
					hotspots = []
					for i in 0..41 do
						j = pos.size-1
						r = rand(0..j)
						hotspots.push(pos[r])
						pos.delete_at(r)
						j = j - 1
					end
						$hotspots = hotspots
            for i in 0..25 do
            $hotspots[i] = "!"
            end
            $hotspots = $hotspots.shuffle
        end


				        def setupgamematrix
				          $gamematrix=[]
				            for i in 0..5 do
				               $gamematrix[i] = ["_","_","_","_","_","_","_"]
				            end
				        end

				        def display_gamematrix
				            $gamematrix_title1 = "          Game Matrix"
										$gamematrix_title2 = "  1    2    3    4    5    6    7"
				            $rowAg = $gamematrix[0]
				            $rowBg = $gamematrix[1]
				            $rowCg = $gamematrix[2]
				            $rowDg = $gamematrix[3]
				            $rowEg = $gamematrix[4]
				            $rowFg = $gamematrix[5]
				            @output.puts ("#{$gamematrix_title1}")
										@output.puts ("#{$gamematrix_title2}")
				            @output.puts ("#{$rowAg}")
										@output.puts ("#{$rowBg}")
										@output.puts ("#{$rowCg}")
										@output.puts ("#{$rowDg}")
										@output.puts ("#{$rowEg}")
										@output.puts ("#{$rowFg}")
				        end

        def burrymine
            $matrix[0]=$hotspots[0..6]
            $matrix[1]=$hotspots[7..13]
            $matrix[2]=$hotspots[14..20]
            $matrix[3]=$hotspots[21..27]
            $matrix[4]=$hotspots[28..34]
            $matrix[5]=$hotspots[35..41]
        end

        def updatematrix
        @title = "  1 2 3 4 5 6 7 "
            @rowA = $matrix[0]
            @rowB = $matrix[1]
            @rowC = $matrix[2]
            @rowD = $matrix[3]
            @rowE = $matrix[4]
            @rowF = $matrix[5]
        end

        def checkwinner
            if $resulta == 2
                $winner=1
								$score1+=1
            elsif $resultb == 2
                $winner=2
								$score2+=1
            else
                $winner= nil
            end
            if $winner != nil
                displaywinner($winner)
            end
        end


		# Any code/methods aimed at passing the RSpect tests should be added above.
    end
end
