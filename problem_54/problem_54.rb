class Match
  attr_reader :hand
  def initialize(hands = nil)
  end

  def best_hand(hand1, hand2)
    return hand1.hand_combination <=> hand2.hand_combination
  end
end

class Hand
  attr_reader :hand, :pairs
  def initialize(hand)
    @hand = handify(hand)
    @pairs = pairify
  end

  def handify(hand)
    hand.map { |card| Card.new(card) }.sort { |x, y| x.value <=> y.value }
  end

  def pairify
    hand.each_with_object(Hash.new(0)) { |o, h| h[o.value] += 1 }
  end

  # Suits are irrelavent for this problem, but can be added to be more realistic
  def hand_combination
    if royal_flush?
      [9, 14, hand[0].suit]
    elsif straight_flush?
      [8, high_card, hand[0].suit]
    elsif four_pair
      [7, high_pair(4), 0]
    elsif full_house
      [6, high_pair(3), 0]
    elsif flush?
      [5, high_cards, hand[0].suit].flatten
    elsif straight?
      [4, high_cards, hand[0].suit].flatten
    elsif three_pair
      [3, high_cards, 0]
    elsif two_pairs_count(2)
      [2, high_cards, 0 ].flatten
    elsif two_pairs_count(1)
      [1, high_cards, 0].flatten
    else
      [0, high_cards, 0 ].flatten
    end
  end

  private

  def high_cards
    cards = hand.map{ |card| card.value }.reverse
    cards.sort { |x, y| [cards.count(y), y] <=> [cards.count(x), x] }
  end

  def royal_flush?
    hand.map { |card| card.value } == (10..14).to_a && flush?
  end

  def straight_flush?
    straight? && flush?
  end

  def four_pair
    number_of_pairs(4)
  end

  def two_pairs_count(num, pair_num = 2)
    return true if pairs.count { |k, v| v == 2 } == num
    return false
  end

  def high_pair(num)
    high_pair = pairs.invert
    high_pair[num]
  end

  def full_house
    number_of_pairs(3) && number_of_pairs(2)
  end

  def three_pair
    number_of_pairs(3)
  end

  def number_of_pairs(num)
    pairs.values.include? num
  end

  def straight?
    hand.each_cons(2).all? { |x, y| y.value == x.value + 1 } || high_cards ==  [14, 5, 4 ,3 , 2]
  end

  def flush?
    hand.all? { |card| card.suit == hand[0].suit  }
  end
end

class Card
  attr_reader :value, :suit
  def initialize(hand)
    hand = hand.split('')
    @value = hand[0]
    @suit = hand[1]
  end

  def value
    cards = { "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9,
              "T" => 10, "J" => 11, "Q" => 12, "K" => 13, "A" => 14 }
    cards[@value]
  end

  def suit
    suits = { "C" => 0, "D" => 1, "H" => 2, "S" => 3 }
    suits[@suit]
  end
end

def run_poker
  player1_count = 0
  m = Match.new
  File.foreach('poker.txt') do |file|

    a = file.split
    hand1 = Hand.new(a[0..4])
    hand2 = Hand.new(a[5..9])
    if m.best_hand(hand1, hand2) == 1
      player1_count += 1
    end
  end
  puts player1_count
end

run_poker