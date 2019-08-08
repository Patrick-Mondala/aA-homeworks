class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq, :highscore

  def initialize
    @sequence_length = 0
    @game_over = false
    @seq = []
    @highscore = 0
  end

  def play
    self.take_turn until self.game_over?
    self.game_over_message
    self.reset_game
  end

  def game_over?
    self.game_over
  end

  def take_turn
    self.show_sequence
    self.require_sequence
    unless self.game_over?
      self.round_success_message
    end
  end

  def show_sequence
    self.add_random_color
    self.seq.each_with_index do |color, idx|
      puts "color #{idx + 1} out of #{self.sequence_length}"
      puts color.to_s
      sleep(1)
      system "clear"
    end
  end

  def valid_color?(color)
    return true if COLORS.include?(color)
    raise "invalid color, try again"
  end

  def require_sequence
    puts "what was the new sequence? (one color at a time)"
    answer = []
    until answer.length == self.sequence_length
      begin
      response = gets.chomp
      valid_color?(response)
      rescue => e
        puts e
        retry
      end
      answer << response
      puts "your guess: #{answer.join(" ")}"
      if answer.last != self.seq[answer.length - 1]
        self.game_over = true
        return
      end
    end
  end

  def add_random_color
    self.seq << COLORS.sample
    self.sequence_length += 1
  end

  def round_success_message
    puts "success!"
    sleep(2)
    system "clear"
  end

  def game_over_message
    self.highscore = self.sequence_length if self.sequence_length > self.highscore
    (10).downto(1).each do |num|
      puts "game over!"
      puts "the sequence was #{self.seq.join(" ")}"
      puts "highscore: #{self.highscore}"
      puts "next game starting in #{num}.."
      sleep(1)
      system "clear"
    end
  end

  def reset_game
    self.sequence_length = 0
    self.game_over = false
    self.seq = []
    self.play
  end
end

simon = Simon.new
simon.play