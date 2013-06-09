require 'dealer/evaluator'

module Dealer
  module Hands
    class Hand < Array
      include Comparable
      include Evaluable
    end
  end
end
