require "byebug"

class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq, :player_input

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
    @player_input = []
  end

  def play
    self.take_turn
    until @game_over
      self.take_turn
    end
    self.game_over_message
    self.reset_game
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    if !@game_over
      self.round_success_message
      @sequence_length += 1
      sleep(0.4)
    end
  end

  def show_sequence
    system("clear")
    self.add_random_color
    @seq.each do |color|
      print color
      sleep(0.5)
    end
    sleep(0.5)
    system("clear")
  end

  def require_sequence
    until @player_input.length == @sequence_length || @game_over
      puts "Enter sequence: "
      @player_input << gets.chomp
      self.check_player_input
    end
    @player_input = []
    sleep(0.2)
    system("clear")
  end

  def check_player_input
    (0...@seq.length).each do |idx|
      # debugger
      @game_over = true if @seq[idx] != @player_input[idx] && !@player_input[idx].nil?
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    puts "Nice. You've surrounded #{@sequence_length} rounds"
  end

  def game_over_message
    puts "Gg! Your streak was #{@sequence_length}"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end