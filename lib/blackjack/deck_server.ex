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
end
