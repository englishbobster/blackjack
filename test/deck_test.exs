defmodule Blackjack.DeckTest do
	use ExUnit.Case
	alias Blackjack.Deck, as: Deck

	test "that a new deck should have 52 cards" do
		assert length(Deck.deck) == 52
	end

	test "that a card can be dealt from the deck" do
		{hand, remaining_deck} = Deck.deal_cards(Deck.deck, 1)
		assert length(hand) == 1
		assert length(remaining_deck) == 51
	end

	test "that a dealt card is represented by a tuple" do
		{hand, remaining_deck} = Deck.deal_cards(Deck.deck, 1)
		[card|rest] = hand
		assert is_tuple(card) == true
	end

	test "that mulitple cards can be dealt from the deck" do
		{hand, remaining_deck} = Deck.deal_cards(Deck.deck, 5)
		assert length(hand) == 5
		assert length(remaining_deck) == 47
	end

end
