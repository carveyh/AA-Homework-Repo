class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, cup_idx|
      unless cup_idx == 6 || cup_idx == 13
        4.times{ cup << :stone }
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !(0...14).include?(start_pos)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    #Transpose the position for nums 1-6
    start_pos -= 1 if (1..6).include?(start_pos)

    #Whose turn? Player 1 or 2? Set to local var "current_player"
    current_player_name == @name1 ? current_player = 1 : current_player = 2

    #How many stones are in the starting cup? Then empty starting cup
    num_stones = cups[start_pos].length
    cups[start_pos] = []

    #Until we run out of stones, we distribute one by one, skipping opponent's points cup.
    new_pos = start_pos
    until num_stones == 0
      new_pos = (new_pos + 1) % 14
      unless (new_pos == 6 && current_player == 2) || (new_pos == 13 && current_player == 1) #We're in opponent's points cup
        cups[new_pos] << :stone
        num_stones -= 1
      end
    end

    #Render the board, and determine the return move_result
    self.render
    next_turn(new_pos)
  end

  def next_turn(ending_cup_idx)
    if (ending_cup_idx == 6) || (ending_cup_idx == 13)
      :prompt
    elsif cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    (0..5).all?{ |idx| cups[idx].empty? } || (7..12).all?{ |idx| cups[idx].empty? }
  end

  def winner
    diff = cups[6].length <=> cups[13].length
    case diff
    when 0
      :draw
    when 1
      @name1
    else
      @name2
    end
  end
end

#Note: the following state and playing position '3' with 6 stones causes infinite loop, not sure why:
#        [0, 1, 0, 3, 1, 0]      
# 11 -------------------------- 6
#       [0, 0, 6, 1, 0, 19]      