require 'rspec'
require_relative 'problem_54'

describe 'Poker problem' do

  it 'should do something' do

    c = Card.new('5C')
    expect(c.value).to eq(5)
    expect(c.suit).to eq(0)

    c = Card.new('QC')

    expect(c.value).to eq(12)
  end

  it "be a royal flush" do
    file = "TC JC QC KC AC"
    a = file.split
    hand1 = Hand.new(a[0..4])
    expect(hand1.royal_flush?).to eq(true)
  end

  it "not be a royal flush" do
    file = "9C JC QC KC AC"
    a = file.split
    hand1 = Hand.new(a[0..4])
    expect(hand1.royal_flush?).to eq(false)
  end

  it "be a straight flush" do
    file = "9C TC JC QC KC"
    a = file.split
    hand1 = Hand.new(a[0..4])
    expect(hand1.straight_flush?).to eq(true)
  end

  it "be 4 of a kind" do
    file = "9C 9C 9C 9C KC"
    a = file.split
    hand1 = Hand.new(a[0..4])
    expect(hand1.four_pair).to eq(true)
  end

  it "high card challenge" do
    file = "5C 2D 6D AC 9C 7C 5H 8D TD AS"
    a = file.split
    hand1 = Hand.new(a[0..4])
    hand2 = Hand.new(a[5..9])
    expect(hand1.high_card(hand2)).to eq("You win")
  end
end