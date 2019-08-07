class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1, @name2 = name1, name2
    @cups = Array.new(14) {[]}
    @cups.each_with_index {|cup, idx| 4.times {cup << :stone} if !(idx == 6 || idx == 13)}
  end

  # wrote different method called distribute_from_cup
  # def place_stones
  #   # helper method to #initialize every non-store cup with four stones each
    
  # end

  def valid_move?(start_pos)
    raise 'Invalid starting cup' if start_pos > 12
    raise 'Starting cup is empty' if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    collected_stones = collect_from_cup(start_pos)
    empty_cup(start_pos)
    end_pos = distribute_from_cup(start_pos, current_player_name, collected_stones)
    ensure
    render
    next_turn(end_pos)
    return :prompt if current_players_store?(current_player_name, end_pos)
    return :switch if @cups[end_pos].length == 1
  end

  def distribute_from_cup(pos, current_player_name, stones)
    until stones.empty?
      pos += 1
      pos = 0 if pos > 13
      if !opponent_players_store?(current_player_name, pos)
        stones.pop
        add_stone(pos)
      end
    end
    pos
  end

  def current_players_store?(current_player_name, pos)
    return true if current_player_name == @name1 && pos == 6
    return true if current_player_name == @name2 && pos == 13
    false
  end

  def opponent_players_store?(current_player_name, pos)
    return true if (current_player_name == @name1 && pos == 13) || (current_player_name == @name2 && pos == 6)
    false
  end

  def add_stone(pos)
    @cups[pos] << :stone
    rescue ArgumentError
      raise "#{@cups} : #{@cups[pos]} : #{pos}"
  end

  def collect_from_cup(pos)
    @cups[pos].dup
  end

  def empty_cup(pos)
    @cups[pos] = []
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all? {|cup| cup.empty? } || @cups[7..12].all? {|cup| cup.empty?}
    false
  end

  def winner
    case @cups[6] <=> @cups[13]
    when 0
      :draw
    when 1
      @name1
    else
      @name2
    end
  end
end
