class Minimax
    attr_accessor :player
    WINNING_SETS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
      ].freeze
      @player = false

    def initialize(board)
        @board = board
    end

    def execute(hash)
        puts "running new test"
        {score: calculate_score(@board), position: generate_position(@board)}
    end

    def calculate_score(any_board)
        WINNING_SETS.each do |combination|
            return -1 if any_board.values_at(*combination).all?('X')
            return 1 if any_board.values_at(*combination).all?('O')
        end
        0
    end

    def get_empty_spaces(any_board)
        any_board.each_index.select{|i| any_board[i] == ''} 
    end

    def generate_position(any_board)
       
        spaces = get_empty_spaces(any_board)

        spaces.each do |space|
            temp_board = any_board.dup
            mark = @player ? 'X' : 'O'
            temp_board[space] = mark
            output = temp_board
            print output
            puts ""
            if (calculate_score(temp_board) == 1 && !@player) || 
               (calculate_score(temp_board) == -1 && @player)
                return space    
            end

            @player = !@player
            generate_position(temp_board)
        end
        spaces[0]
    end
end