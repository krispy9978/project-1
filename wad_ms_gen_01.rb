# https://www.primarysite-kidszone.co.uk/kidszone/resources/connect4.htm
# Ruby code file - All your code should be located between the comments provided.

# Add any additional gems and global variables here


# require 'sinatra'		# remove '#' character to run sinatra wen server

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

             
        def created_by 
            @myname = "Kristoffer Hansen"
        end
        
        def student_id
            studentid = 51881686
        end
        
        def start
            @output.puts "Welcome to Minesweeper!"
            @output.puts "Created by:#{@myname}" 
            @output.puts "Game started."
            @output.puts "Enter a coordinate to uncover if mine found."
        end
        
        def displaybegingame
            @output.puts "Begin game."
        end
        
        def displaynewgamecreated
            @output.puts "New game created."
        end
        
        def finish
            @output.puts "Game finished."
        end
        
        def displaymenu
            @output.puts "Menu: (1)Start | (2)New | (9)Exit\n"
        end
    
        def player1
            @player1
        end        
        def player2
            @player2
        end
         
        def clearscores      
            @p1 == 0 && @p2 == 0
            @resulta = 0
            @resultb = 0
        end
        
        def displayplayerscores
            @output.puts "Player 1: 0 and Player 2: 0"
        end
        
        def displayplayer1prompt
            @output.puts "Player 1 to enter coordinate (0 returns to menu)."
        end
        
        def displayplayer2prompt
            @output.puts "Player 2 to enter coordinate (0 returns to menu)."
        end
        
        def displayinvalidinputerror
            @output.puts "Invalid input."
        end
        
        def displaynomoreroomerror
            @output.puts "No more room."
        end
        
        def displaywinner(p)         
            @output.puts "Player #{p} wins."
        end
        
        def getplayer1
            @player1 = TOKEN2
        end
        
        def getplayer2
            @player2 = TOKEN2
        end
        
        def setplayer1
            @player1 = TOKEN2
        end
        
        def setplayer2
            @player2 = TOKEN2
        end
       
        
        def clearcolumns     
			@matrix = [["_", "_", "_", "_", "_", "_", "_"],
				["_", "_", "_", "_", "_", "_", "_"],
				["_", "_", "_", "_", "_", "_", "_"],
				["_", "_", "_", "_", "_", "_", "_"],
				["_", "_", "_", "_", "_", "_", "_"],
				["_", "_", "_", "_", "_", "_", "_"],
				["_", "_", "_", "_", "_", "_", "_"]]             
        end
     
        
        def getcolumnvalue(x, y) 
            @matrix[*0][*0]
        end
        
        
        def setmatrixcolumnvalue(c, i, v)
       
            if @matrix[c][i] == "_"   
              @matrix[c][i] = v
            end
                
        end
        
       def displayemptyframe
           c = 0
           i = 0
            title = "  1 2 3 4 5 6 7 "
            rowdivider = " +-+-+-+-+-+-+-+"
            rowAempty = "6|_|_|_|_|_|_|_|"
            rowBempty = "5|_|_|_|_|_|_|_|"
            rowCempty = "4|_|_|_|_|_|_|_|"
            rowDempty = "3|_|_|_|_|_|_|_|"
            rowEempty = "2|_|_|_|_|_|_|_|"
            rowFempty = "1|_|_|_|_|_|_|_|"
            
           @output.puts "#{title}"
          # for @matrix[c][i] in 1..7
              @output.puts "#{rowdivider}"
           #end            
                             
           @output.puts "#{rowAempty}"
           @output.puts "#{rowBempty}"
           @output.puts "#{rowCempty}"
           @output.puts "#{rowDempty}"
           @output.puts "#{rowEempty}"
           @output.puts "#{rowFempty}"
        end
            
        def hotspots
			pos = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42]
				hotspots = []
				for i in 0..41 do
					j = pos.size-1
					r = rand(0..j)
					hotspots.push(pos[r])
					pos.delete_at(r)
					j = j - 1
				end
				@hotspots = hotspots
				num = true
				for i in 0..41 do
					if @hotspots[i].integer? == false then
						num = false						
					end
				end
				s = @hotspots.size
				u = @hotspots.uniq!
				s == 42 && u == nil && num == true
        end
        
        def generatemines
            pos = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42]
				generatemine = []
				for i in 0..41 do
					j = pos.size-1
					r = rand(0..j)
					generatemine.push(pos[r])
					pos.delete_at(r)
					j = j - 1
				end
            @hotspots = generatemine
    end
    
    #def playerturns
	#	g.displayemptyframe
	#	g.generatemines
	#	while playing do
	#		@output.puts "Enter x and y value"
	#	g.getcolumnvalue(x, y)
	#	input = @input.gets.chomp
	]#	end
	#end


        def checkwinner 
            if resulta >= 3 then
                winner = 1
            elsif resultb >= 3
                winner = 2
            else
                winner = nil
            end
                winner
        end
                   
		# Any code/methods aimed at passing the RSpect tests should be added above.

	end
end