module Players
  class Computer < Player

    WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [0,3,6],
      [1,4,7],
      [2,5,8],
      [0,4,8],
      [6,4,2]]

    def move(board)
      #win(board) || block(board)
      win(board) || first_move(board) || corners(board) || random
    end

    def first_move(board)
      "5" if !board.taken?("5")
    end

    def corners(board)
      all_corners = [1, 3, 7, 9]
      all_corners.find {|corner| !board.taken?(corner)}
    end

    def winning_combo(board)
      WIN_COMBINATIONS.find do |win_combination|
        if board.cells[win_combination[0]] == token && board.cells[win_combination[1]] == token && !board.taken?(win_combination[2]+1)
           win_combination[2]
        elsif board.cells[win_combination[1]] == self.token && board.cells[win_combination[2]] == token && !board.taken?(win_combination[0]+1)
          win_combination[0]
        elsif board.cells[win_combination[0]] == self.token && board.cells[win_combination[2]] == token && !board.taken?(win_combination[1]+1)
          win_combination[1]
        end
      end
    end

    def win(board)
      if winning_combo(board) != nil
        winning_combo(board).find {|cell| board.cells[cell] == " "} + 1
      end
    end

    #def block(board)
    #  WIN_COMBINATIONS.find do |win_combination|
    #    if board.cells[win_combination[0]] == opponent && board.cells[win_combination[1]] == opponent && !board.taken?(win_combination[2]+1)
    #      win_combination[2]
    #    elsif board.cells[win_combination[1]] == opponent && board.cells[win_combination[2]] == opponent && !board.taken?(win_combination[0]+1)
    #      win_combination[0]
    #    elsif board.cells[win_combination[0]] == opponent && board.cells[win_combination[2]] == opponent && !board.taken?(win_combination[1]+1)
    #      win_combination[1]
    #    end
    #  end
    #end

    #def win(board)
    #  winning_combo(board).find {|cell| board.cells[cell] == " "}.to_s unless winning_combo(board) == nil
  #  end

    #def block(board)
  #    blocking_combo(board).find {|cell| board.cells[cell] == " "}.to_s unless blocking_combo(board) == nil
  #  end

    def opponent
      if self.token == "X"
        "O"
      else
        "X"
      end
    end

    def random
      rand(1...10)
    end
  end
end
