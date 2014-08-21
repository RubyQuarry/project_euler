class Player
  def initialize

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
              "10" => 10, "J" => 11, "Q" => 12, "K" => 13, "A" => 14 }
    cards[@value]
  end

  def suit
    suits = { "C" => 0, "D" => 1, "H" => 2, "S" => 3 }
    suits[@suit]
  end
end