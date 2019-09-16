require 'minimax'

describe Minimax do

    it "should return score 1 for winning combination" do
        board = ['X','O','X','X','O','X','O','O','']
        minimax = Minimax.new(board)
        response = minimax.execute({})
        expect(response[:score]).to eq(1)
    end

    it "should return score -1 for losing combination" do
        board = ['','O','X','X','O','X','O','','X']
        minimax = Minimax.new(board)
        response = minimax.execute({})
        expect(response[:score]).to eq(-1)
    end

    it "should return score 0 for draw combination" do
        board = ['O','O','X','X','X','O','O','X','X']
        minimax = Minimax.new(board)
        response = minimax.execute({})
        expect(response[:score]).to eq(0)
    end

    it "should return a winning mark position" do
        board = ['X','O','X','X','O','X','O','','']
        minimax = Minimax.new(board)
        response = minimax.execute({})
        expect(response[:position]).to eq(7)
    end

    it "should return a winning mark position" do
        board = ['X','O','X','X','','X','O','O','']
        minimax = Minimax.new(board)
        response = minimax.execute({})
        expect(response[:position]).to eq(4)
    end

    it "should show the available spaces" do 
        board = ['X','O','X','X','O','X','O','','']
        minimax = Minimax.new(board)
        response = minimax.get_empty_spaces(board)
        expect(response).to eq([7,8])
    end

    it "should choose last remaining space" do 
        board = ['','O','X','X','X','O','O','X','X']
        minimax = Minimax.new(board)
        response = minimax.execute({})
        expect(response[:position]).to eq(0)
    end
end