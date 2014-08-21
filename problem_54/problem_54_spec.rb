require 'rspec'
require_relative 'problem_54'

describe 'Poker problem' do



    it "should be a tw pair" do
      file = "AC 2D 3D 4C 5C 7C 5H 8D TD KS"
      a = file.split
      hand1 = Hand.new(a[0..4])
      hand2 = Hand.new(a[5..9])
      puts hand1.hand_combination.to_s
      m = Match.new
      expect(m.best_hand(hand1, hand2)).to eq(1)
    end
end