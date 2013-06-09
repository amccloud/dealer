
require 'test/unit'
require 'dealer/evaluator/cactuskev'

class PokerHandTest < Test::Unit::TestCase
  include Dealer

  def test_card_to_i
    evaluator = Evaluators::CactusKev::FiveCardEvaluator.new
    assert_equal 134236965, evaluator.card_to_i(Card.new(:king, :diamond))
    assert_equal 529159, evaluator.card_to_i(Card.new(:five, :spade))
    assert_equal 33589533, evaluator.card_to_i(Card.new(:jack, :club))
  end
end
