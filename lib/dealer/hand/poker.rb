require 'dealer/hand'
require 'dealer/evaluator/cactuskev'

module Dealer
  module Hands
    class PokerHand < Hand
      # Evaluators are indexed by length of hand.
      EVALUATORS = {
        5 => Evaluators::CactusKev::FiveCardEvaluator.new
      }

      def evaluator
        EVALUATORS[self.length] || Evaluators::Evaluator
      end

      def score
        evaluator.score self
      end

      def rank
        evaluator.rank self
      end

      def <=> other
        evaluator.compare self, other
      end
    end
  end
end
