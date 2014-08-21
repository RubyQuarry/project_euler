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
end