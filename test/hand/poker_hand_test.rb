require 'test/unit'
require 'dealer/hand/poker'

class PokerHandTest < Test::Unit::TestCase
  include Dealer

  def test_rank_hand
    assert_equal :high_card, high_card_hand.rank
    assert_equal :pair, pair_hand.rank
    assert_equal :two_pair, two_pair_hand.rank
    assert_equal :three_of_a_kind, three_of_a_kind_hand.rank
    assert_equal :straight, straight_hand.rank
    assert_equal :flush, flush_hand.rank
    assert_equal :full_house, full_house_hand.rank
    assert_equal :four_of_a_kind, four_of_a_kind_hand.rank
    assert_equal :straight_flush, straight_flush_hand.rank
  end

  def test_compare_hands
    assert_operator pair_hand, :>, high_card_hand
    assert_operator two_pair_hand, :>, pair_hand
    assert_operator three_of_a_kind_hand, :>, two_pair_hand
    assert_operator straight_hand, :>, three_of_a_kind_hand
    assert_operator flush_hand, :>, straight_hand
    assert_operator full_house_hand, :>, flush_hand
    assert_operator four_of_a_kind_hand, :>, full_house_hand
    assert_operator straight_flush_hand, :>, four_of_a_kind_hand
  end

  def high_card_hand
    Hands::PokerHand.new [
      Card.new(:nine, :spade),
      Card.new(:jack, :heart),
      Card.new(:queen, :diamond),
      Card.new(:king, :club),
      Card.new(:ace, :club)
    ]
  end

  def pair_hand
    Hands::PokerHand.new [
      Card.new(:two, :spade),
      Card.new(:three, :heart),
      Card.new(:king, :diamond),
      Card.new(:ace, :club),
      Card.new(:ace, :heart)
    ]
  end

  def two_pair_hand
    Hands::PokerHand.new [
      Card.new(:queen, :heart),
      Card.new(:king, :spade),
      Card.new(:king, :diamond),
      Card.new(:ace, :heart),
      Card.new(:ace, :club)
    ]
  end

  def three_of_a_kind_hand
    Hands::PokerHand.new [
      Card.new(:queen, :spade),
      Card.new(:king, :heart),
      Card.new(:ace, :heart),
      Card.new(:ace, :diamond),
      Card.new(:ace, :club)
    ]
  end

  def straight_hand
    Hands::PokerHand.new [
      Card.new(:ten, :spade),
      Card.new(:jack, :heart),
      Card.new(:queen, :diamond),
      Card.new(:king, :club),
      Card.new(:ace, :heart)
    ]
  end

  def flush_hand
    Hands::PokerHand.new [
      Card.new(:nine, :heart),
      Card.new(:jack, :heart),
      Card.new(:queen, :heart),
      Card.new(:king, :heart),
      Card.new(:ace, :heart)
    ]
  end

  def full_house_hand
    Hands::PokerHand.new [
      Card.new(:king, :spade),
      Card.new(:king, :heart),
      Card.new(:ace, :heart),
      Card.new(:ace, :diamond),
      Card.new(:ace, :club)
    ]
  end

  def four_of_a_kind_hand
    Hands::PokerHand.new [
      Card.new(:queen, :heart),
      Card.new(:king, :spade),
      Card.new(:king, :heart),
      Card.new(:king, :diamond),
      Card.new(:king, :club)
    ]
  end

  def straight_flush_hand
    Hands::PokerHand.new [
      Card.new(:ten, :heart),
      Card.new(:jack, :heart),
      Card.new(:queen, :heart),
      Card.new(:king, :heart),
      Card.new(:ace, :heart)
    ]
  end
end
