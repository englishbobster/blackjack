defmodule Blackjack.Deck do
	def deck do
    for suite <- [:spades, :hearts, :clubs, :diamonds],
		rank <-  [:ace, :two, :three, :four, :five, :six, :seven, :eight, :nine,
							:ten, :jack, :queen, :king], do: {suite, rank}
  end

  def shuffle_deck(deck) do
    :random.seed(:os.timestamp)
    Enum.shuffle(deck)
  end

	def deal_cards(deck, count) do
		deal_card([], deck, count)
	end
	defp deal_card(hand, remaining_deck, 0) do
		{hand, remaining_deck}
	end
	defp deal_card(hand, deck, count) do
		[head|remaining_deck] = deck
		deal_card([head|hand], remaining_deck, count - 1)
	end
end
