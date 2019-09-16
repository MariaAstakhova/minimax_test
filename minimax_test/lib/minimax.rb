class Minimax

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

    def initialize(board)
        @board = board
    end

    def execute(hash)
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
            temp_board[space] = 'O'
            return space if calculate_score(temp_board) == 1
            return space if calculate_score(temp_board) == 0
        end
    end



end