defmodule DeckTest do
  alias Blackjack.DeckServer, as: DeckServer

	use ExUnit.Case

	setup do
		{:ok, pid} = DeckServer.start
		on_exit fn ->
			DeckServer.stop
		end
		:ok
	end

  test "that we can get the number of remaining cards in the deck" do
    assert DeckServer.count_remaining_cards == 52
  end
end
