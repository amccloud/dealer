# coding: utf-8

module Dealer
  class Card
    attr_reader :rank, :suit

    RANKS = [:two, :three, :four, :five, :six, :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace]
    SUITS = [:spade, :heart, :diamond, :club]
    ICONS = %w(♠ ♥ ♦ ♣)

    InvalidRank = Class.new StandardError
    InvalidSuit = Class.new StandardError

    def initialize rank, suit
      if not rank.is_a? Symbol or not RANKS.include? rank
        raise InvalidRank
      end

      if not suit.is_a? Symbol or not SUITS.include? suit
        raise InvalidSuit
      end

      @rank = rank
      @suit = suit
    end

    def icon
      return ICONS[SUITS.index(suit)]
    end
  end
end
