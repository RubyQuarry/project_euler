class Player
  def initialize

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

  def compare(opponent)
    if royal_flush?
      return "You win"
    elsif straight_flush?
      if opponent.straight_flush?
        return high_card(opponent)
      end
    end
  end

  def high_card(opponent)
    4.downto(0) do |num|
      if hand[num].value > opponent.hand[num].value
        return "You win"
      end
      if hand[num].value < opponent.hand[num].value
        return "Opponent win"
      end
    end
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

  def full_house
    number_of_pairs(3) && number_of_pairs(2)
  end

  def number_of_pairs(num)
    @pairs.values.include? num
  end

  def straight?
    hand.each_cons(2).all? { |x, y| y.value == x.value + 1 }
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
  File.foreach('poker.txt') do |file|
    a = file.split
    hand1 = Hand.new(a[0..4])
    hand2 = Hand.new(a[5..9])
  end
end

run_poker