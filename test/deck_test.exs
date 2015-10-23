defmodule Blackjack.DeckTest do
	use ExUnit.Case
	alias Blackjack.Deck, as: Deck

	test "that a new deck should have 52 cards" do
		assert length(Deck.deck) == 52
	end

	test "that a card can be dealt from the deck" do
		{[card], remaining_deck} = Deck.deal_cards(Deck.deck, 1)
		assert is_tuple(card) == true
		assert length(remaining_deck) == 51
	end

end
