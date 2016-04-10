require 'pry'

module ConvertPosition
	def convert (str_pos)
		arr_pos = Array.new
		arr_pos[0] = 8 - str_pos[1].to_i
		arr_pos[1] = str_pos[0].ord - 97
		arr_pos
	end
end

module ConvertPieces
	def type_piece (piece, start_pos)
		type = ""
		case piece[1]
			when "R"
				type = Rook.new start_pos
			when "N"
				type = Knight.new start_pos
			when "B"
				type = Bishop.new start_pos
			when "Q"
				type = Queen.new start_pos
			when "K"
				type = King.new start_pos
			when "P"
				type = Pawn.new start_pos,piece[0] #piece[0] = color
			else
				puts "ILLEGAL"
				type = nil
		end
	end
end

module WriteFile
  def write (value)
    open("simple_results.txt", "a") do |f|
      f << value
    end
  end
end

class Files
	def board
		"simple_board.txt"
	end
	def moves
		"simple_moves.txt"
	end
end

class Grid
 	def initialize
 		@grid = IO.readlines(Files.new.board)
 	end
 	def load_grid
 		@grid
 	end
end

class Moves
	def initialize
		@moves = IO.readlines(Files.new.moves)
	end
	def load_moves
		@moves
	end
end

class Game #God Class :S Improve it!
	include ConvertPosition
	include ConvertPieces
	include WriteFile

	def initialize
		@board = Grid.new.load_grid
		@list_moves = Moves.new.load_moves
		f = File.new "simple_results.txt","a+"
	end
	def list_initial_pos
		initial_pos = Array.new
		@list_moves.each do |move|
			initial_pos.push(convert(move[0..1]))
		end
		initial_pos
	end
	def list_final_pos
		final_pos = Array.new
		@list_moves.each do |move|
			final_pos.push(convert(move[3..4]))
		end
		final_pos
	end
	def list_pieces
		pieces = Array.new
		list_initial_pos.each do |x|
			pieces.push(@board[x[0]].split(" ")[x[1]])
		end
		pieces
	end
	def check (pieces, start, final)
		type_piece(pieces, start).check_move(start, final)
	end
	def play
		#binding.pry
		start_pos = list_initial_pos
		final_pos = list_final_pos
		pieces = list_pieces
		(0..start_pos.length-1).each do |x|
			if @board[final_pos[x][0]].split(" ")[final_pos[x][1]] != "--" #check if final pos is busy
				write ("ILLEGAL\n")
			else
				check(pieces[x],start_pos[x], final_pos[x])
			end
		end
	end
end

class Piece
	include ConvertPosition
	include WriteFile
	def initialize (start_pos)
		@start_pos = start_pos
	end
end

class Rook < Piece
	def check_move (start, final)
		if final[0] == start[0] || final[1] == start[1]
			write ("LEGAL\n")
		else
			write ("ILLEGAL\n")		end
	end
end

class Knight < Piece
	def check_move (start, final)
		if ((final[0] - start[0]).abs == 1 || (final[0] - start[0]).abs == 2) && ((final[1] - start[1]).abs == 1 || (final[1] - start[1]).abs == 2) && (((final[0] - start[0]).abs + (final[1] - start[1]).abs) == 3)
			write ("LEGAL\n")
		else
			write ("ILLEGAL\n")
		end
	end
end

class Bishop < Piece
	def check_move (start, final)
		if (final[0] - start[0]).abs == (final[1] - start[1]).abs
			write ("LEGAL\n")
		else
			write ("ILLEGAL\n")
		end
	end
end

class King < Piece
	def check_move (start, final)
		if (final[0] - start[0]).abs <= 1 && (final[1] - start[1]).abs <= 1
			write ("LEGAL\n")
		else
			write ("ILLEGAL\n")
		end
	end
end

class Queen < Piece
	def check_move (start, final)
		if (final[0] == start[0] || final[1] == start[1]) || ((final[0] - start[0]).abs == (final[1] - start[1]).abs)
			write ("LEGAL\n")
		else
			write ("ILLEGAL\n")
		end
	end
end

class Pawn < Piece
	def initialize (start_pos, color)
		super (start_pos)
		@color = color
	end

	def check_move (start, final)
		#binding.pry
		if @color == "b"
			if final[1] == start[1] && (final[0] - start[0]) <= 2
				write ("LEGAL\n")
			else
				write ("ILLEGAL\n")
			end
		elsif @color == "w"
			if final[1] == start[1] && ((final[0] - start[0]) == -1 || (final[0] - start[0]) == -2)
				write ("LEGAL\n")
			else
				write ("ILLEGAL\n")
			end
		end
	end
end

game = Game.new.play