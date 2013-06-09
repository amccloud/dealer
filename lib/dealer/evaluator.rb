module Dealer
  module Evaluators
    class Evaluator
      def score hand; end
      def rank hand; end
      def compare hand, other_hand; end
    end
  end

  module Hands
    module Evaluable
      def evaluator
        Evaluators::Evaluator.new
      end
    end
  end
end
