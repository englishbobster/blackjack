defmodule Blackjack.DeckServer do
	use GenServer

	import Blackjack.Deck

	#interface functions
	def start do
		GenServer.start(Blackjack.DeckServer, nil, name: Deck_Server)
	end

	def stop do
		GenServer.call(Deck_Server, :stop)
	end

	def count_remaining_cards do
		GenServer.call(Deck_Server, :cards_remaining)
	end

	def deal_hand_of(count) do
		GenServer.call(Deck_Server, {:deal_cards, count})
	end

	#callbacks
	def init(_) do
		{:ok, deck |> shuffle_deck}
	end

	def handle_call(:stop, _from, deck) do
		{:stop, :normal, :ok, deck}
	end
	def handle_call(:cards_remaining, _, deck) do
		{:reply, length(deck), deck}
	end
	def handle_call({:deal_cards, count}, _, deck) do
		{hand, remaining_deck} = deal_cards(deck, count)
		{:reply, hand, remaining_deck}
	end
end
