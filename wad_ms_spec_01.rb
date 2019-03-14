# https://www.primarysite-kidszone.co.uk/kidszone/resources/connect4.htm
# Ruby assignment
# Change the following tests with your own name and student ID.
# NB. Failure to do so will result in marks being deducted.
# IMPORTANT: Ensure you save the file after making the changes. 
# DO notchange the names of the files. Just ensure you backup the files often.

# The file where you are to write code to pass the tests must be present in the same folder.
# See http://rspec.codeschool.com/levels/1 for help about RSpec
# https://en.wikipedia.org/wiki/Wheel_of_Fortune_(UK_game_show)
require "#{File.dirname(__FILE__)}/wad_ms_gen_01"

# predefined method - NOT to be removed
def check_winner
	if @game.resulta >= 3 then
		@game.winner = 1
	elsif @game.resultb >= 3 then
		@game.winner = 2
	else
		@game.winner = nil
	end
	@game.winner
end

module MS_Game
	# RSpec Tests 
	describe Game do
		describe "#start the game" do
			before(:each) do
				@input = double('input').as_null_object
				@output = double('output').as_null_object
				@game = Game.new(@input, @output)
			end
			it "should send a welcome message" do
				@output.should_receive(:puts).with('Welcome to Minesweeper!')
				@game.start
			end
			it "should contain a method created_by which returns the students name" do
				myname = @game.created_by
				myname.should == "Kristoffer Hansen"	# -----Change text to your own name-----
			end
			it "should contain a method student_id which returns the students ID number" do
				studentid = @game.student_id
				studentid.should == 51881686		# -----Change ID to your own student ID number-----
			end
			it "should send a created by message" do
				@output.should_receive(:puts).with("Created by:#{@game.created_by}")
				@game.start
			end
			it "should send a start message" do
				@output.should_receive(:puts).with('Game started.')
				@game.start			
			end
			it "should show instructions" do
				@output.should_receive(:puts).with("Enter a coordinate to uncover if mine found.")
				@game.start
			end
			it "should display begin game message" do
				@output.should_receive(:puts).with('Begin game.')
				@game.displaybegingame			
			end
			it "should display new game created message" do
				@output.should_receive(:puts).with('New game created.')
				@game.displaynewgamecreated			
			end
			it "should send a finish message" do
				@output.should_receive(:puts).with('Game finished.')
				@game.finish			
			end
			it "should display menu" do
				@output.should_receive(:puts).with("Menu: (1)Start | (2)New | (9)Exit\n")
				@game.displaymenu
			end
			it "should clear player scores." do
				@game.clearscores
				p1 = @game.resulta
				p2 = @game.resultb
				p1.should == 0 && p2.should == 0
			end
			it "should show player scores." do
				@game.clearscores
				@output.should_receive(:puts).with("Player 1: 0 and Player 2: 0")
				@game.displayplayerscores
			end
			it "should prompt player 1" do
				@output.should_receive(:puts).with("Player 1 to enter coordinate (0 returns to menu).")
				@game.displayplayer1prompt
			end
			it "should prompt player 2" do
				@output.should_receive(:puts).with("Player 2 to enter coordinate (0 returns to menu).")
				@game.displayplayer2prompt
			end
			it "should display a invalid iput error message" do
				@output.should_receive(:puts).with('Invalid input.')
				@game.displayinvalidinputerror			
			end
			it "should display a no more room error message" do
				@output.should_receive(:puts).with('No more room.')
				@game.displaynomoreroomerror			
			end
			it "should display player 1 wins message" do
				p = 1
				@output.should_receive(:puts).with("Player #{p} wins.")
				@game.displaywinner(p)			
			end
			it "should display player 2 wins message" do
				p = 2
				@output.should_receive(:puts).with("Player #{p} wins.")
				@game.displaywinner(p)			
			end
			it "should set token of player 1 to X" do
				@game.setplayer1
				@game.player1.should eql "X"
			end
			it "should set token of player 2 to X" do
				@game.setplayer2
				@game.player2.should eql "X"
			end
			it "should get token of player 1" do
				@game.setplayer1
				@game.getplayer1.should eql "X"
			end
			it "should get token of player 2" do
				@game.setplayer2
				@game.getplayer2.should eql "X"
			end
			it "should initialise each position in each column in matrix as _" do
				matrix = []
				matrix[0] = ["_", "_", "_", "_", "_", "_", "_"]
				matrix[1] = ["_", "_", "_", "_", "_", "_", "_"]
				matrix[2] = ["_", "_", "_", "_", "_", "_", "_"]
				matrix[3] = ["_", "_", "_", "_", "_", "_", "_"]
				matrix[4] = ["_", "_", "_", "_", "_", "_", "_"]
				matrix[5] = ["_", "_", "_", "_", "_", "_", "_"]
				matrix[6] = ["_", "_", "_", "_", "_", "_", "_"]
				@game.clearcolumns
				@game.matrix.should eql matrix
			end
			it "should get a column value at a given position in matrix" do
				@game.clearcolumns
				value = @game.getcolumnvalue(0,0)
				value.should == "_"
			end
			it "should set a column value at a given position in matrix to 'O' mine found" do
				c = 0
				i = 0
				v = "O"
				@game.clearcolumns
				@game.setmatrixcolumnvalue(c,  i, v)
				@game.matrix[c][i].should == v				
			end
			it "should set a column value at a given position in matrix to 'X' mine not found" do
				c = 0
				i = 0
				v = "X"
				@game.clearcolumns
				@game.setmatrixcolumnvalue(c,  i, v)
				@game.matrix[c][i].should == v				
			end
			it "should only overwrite an empty square containing _ with token mine not found" do
				c = 0
				i = 0
				v1 = "X"
				@game.clearcolumns
				@game.setmatrixcolumnvalue(c,  i, v1)
				@game.matrix[c][i].should == v1				
				c = 0
				i = 0
				v2 = "O"
				@game.setmatrixcolumnvalue(c,  i, v2)
				@game.matrix[c][i].should == v1				
			end
			it "should only overwrite an empty square containing _ with token mine found" do
				c = 0
				i = 0
				v1 = "O"
				@game.clearcolumns
				@game.setmatrixcolumnvalue(c,  i, v1)
				@game.matrix[c][i].should == v1				
				c = 0
				i = 0
				v2 = "X"
				@game.setmatrixcolumnvalue(c,  i, v2)
				@game.matrix[c][i].should == v1				
			end
			it "should display empty matrix as a table 6 rows (x) by 7 columns (y) with row numbers and column numbers" do
				matrix = []
				matrix[0] = ["_", "_", "_", "_", "_", "_","_"]
				matrix[1] = ["_", "_", "_", "_", "_", "_","_"]
				matrix[2] = ["_", "_", "_", "_", "_", "_","_"]
				matrix[3] = ["_", "_", "_", "_", "_", "_","_"]
				matrix[4] = ["_", "_", "_", "_", "_", "_","_"]
				matrix[5] = ["_", "_", "_", "_", "_", "_","_"]
				matrix[6] = ["_", "_", "_", "_", "_", "_","_"]
				@game.clearcolumns
				@game.matrix.should eql matrix
				title = "  1 2 3 4 5 6 7 "
				rowdivider = " +-+-+-+-+-+-+-+"
				rowAempty = "6|_|_|_|_|_|_|_|"
				rowBempty = "5|_|_|_|_|_|_|_|"
				rowCempty = "4|_|_|_|_|_|_|_|"
				rowDempty = "3|_|_|_|_|_|_|_|"
				rowEempty = "2|_|_|_|_|_|_|_|"
				rowFempty = "1|_|_|_|_|_|_|_|"
				@output.should_receive(:puts).with("#{title}")
				for i in 1..7
					@output.should_receive(:puts).with("#{rowdivider}")
				end
				@output.should_receive(:puts).with("#{rowAempty}")
				@output.should_receive(:puts).with("#{rowBempty}")
				@output.should_receive(:puts).with("#{rowCempty}")
				@output.should_receive(:puts).with("#{rowDempty}")
				@output.should_receive(:puts).with("#{rowEempty}")
				@output.should_receive(:puts).with("#{rowFempty}")
				@game.displayemptyframe
			end						
			it "should generate in @hotspots an array of random unique numbers from 1..42 representing mines" do
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
				s.should == 42 && u.should == nil && num.should == true
			end
			it "should call method generate mines to generate in @hotspots an array of random unique numbers from 1..42 representing mines" do
				hotspots = @game.generatemines
				num = true
				for i in 0..41 do
					if hotspots[i].integer? == false then
						num = false						
					end
				end
				s = hotspots.size
				u = hotspots.uniq!
				s.should == 42 && u.should == nil && num.should == true
			end
			# test player 1 winner
			it "should check for player 2 win within row 1 starting at position 1" do
				@game.resulta = 3
				@game.resultb = 0
				@game.winner = nil
				@game.checkwinner.should == check_winner && @game.winner.should == 1
			end

			# test player 2 winner
			it "should check for player 2 win within row 1 starting at position 1" do
				@game.resulta = 0
				@game.resultb = 3
				@game.winner = nil
				@game.checkwinner.should == check_winner && @game.winner.should == 2
			end

		end
	end

end