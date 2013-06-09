# coding: utf-8

require 'test/unit'
require 'dealer'

class CardTest < Test::Unit::TestCase
  include Dealer

  def test_card
    card = Card.new(:three, :heart)
    assert_equal :three, card.rank
    assert_equal :heart, card.suit
  end

  def test_invalid_rank
    assert_raise Card::InvalidRank do
      card = Card.new(:one, :heart)
    end
  end

  def test_invalid_suit
    assert_raise Card::InvalidSuit do
      card = Card.new(:two, :bogus)
    end
  end

  def test_icons
    assert_equal "♠", Card.new(:two, :spade).icon
    assert_equal "♥", Card.new(:two, :heart).icon
    assert_equal "♦", Card.new(:two, :diamond).icon
    assert_equal "♣", Card.new(:two, :club).icon
  end
end
