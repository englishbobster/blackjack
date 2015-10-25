defmodule Blackjack.Points do
	defp points do
		%{ace: 1,
			two: 2,
			three: 3,
			four: 4,
			five: 5,
			six: 6,
			seven: 7,
			eight: 8,
			nine: 9,
			ten: 10,
			jack: 10,
			queen: 10,
			king: 10
			}
	end

	def calculate_points(hand) do
		{
			hand_to_points(hand, 0),
			hand_to_points(hand)
		}
	end

	def hand_to_points(hand) do
		case has_aces?(hand) do
			true ->
				hand_to_points(hand, 10)
			false ->
				hand_to_points(hand, 0)
		end
	end

	def hand_to_points(hand, bonus) do
		hand
		|> Enum.reduce(bonus, fn({_suite, rank}, acc) -> acc + points[rank] end)
		|> bust
	end

	def has_aces?(hand) do
		hand |> Enum.any?(fn {_suite, rank} -> rank == :ace end)
	end

	def bust(value) when value > 21, do: nil
	def bust(value), do: value
end
