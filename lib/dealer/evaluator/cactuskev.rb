require 'prime'
require 'dealer/evaluator'
require 'dealer/evaluator/lookup/cactuskev'
require 'dealer/evaluator/lookup/senzee'

module Dealer
  module Evaluators
    module CactusKev
      # From http://www.suffecool.net/poker/evaluator.html
      class FiveCardEvaluator < Evaluator
        include SenzeeLookup

        def rank hand
          hands_score = score hand

          RANK_BUCKETS.each do |bucket, rank|
            return rank if hands_score > bucket
          end
        end

        def score hand
          cards_as_i = hand.map { |c| card_to_i c }
          key = (cards_as_i.reduce :|) >> 16

          if (cards_as_i.reduce 0xf000, :&) != 0
            # Hand is a flush.
            return lookup_flushes key
          end

          if s = (lookup_unique5 key) and s != 0
            # Hand is a straight or high-card hand.
            return s
          end

          # Hand is everything else.
          key = cards_as_i.reduce(1) { |u, c| u *= c & 0xff }
          lookup_last key
        end

        def compare hand, other_hand
          score(other_hand) <=> score(hand)
        end

        def card_to_i card
          rank = RANK_VALUES[card.rank]
          suit = SUIT_VALUES[card.suit]
          prime = PRIME_VALUES[rank]

          i = 1 << 16 + rank
          i |= 1 << 11 + suit
          i |= rank << 8
          i |= prime
        end

        protected
        PRIME_VALUES = Prime.first 13
        RANK_VALUES = Hash[[:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace].zip 0..12]
        SUIT_VALUES = Hash[[:spade, :heart, :diamond, :club].zip 1..4]
        RANK_BUCKETS = {
          6185 => :high_card,
          3325 => :pair,
          2467 => :two_pair,
          1609 => :three_of_a_kind,
          1599 => :straight,
          322 => :flush,
          166 => :full_house,
          10 => :four_of_a_kind,
          0 => :straight_flush
        }
      end
    end
  end
end
