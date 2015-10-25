defmodule PointsTest do
	use ExUnit.Case

	import Blackjack.Points

	setup do
		{:ok, simple: [{:spades, :two}, {:spades, :seven}],
		 with_one_ace: [{:spades,:ace}, {:spades, :two}],
		 with_two_aces: [{:hearts, :ace}, {:spades, :ace}],
		 with_bust_high: [{:hearts, :king}, {:spades, :ace}, {:clubs, :five}],
		 with_bust_high_and_low: [{:hearts, :king}, {:spades, :ace}, {:clubs, :five}, {:diamonds, :jack}],
		 with_four_aces: [{:spades, :ace}, {:hearts, :ace}, {:diamonds, :ace}, {:clubs, :ace}]}
	end

	test "that point tuple can be calculated for a simple hand", context do
		assert calculate_points(context[:simple]) == {9, 9}
	end

	test "that point tuple can be calculated for a hand with an ace", context do
		assert calculate_points(context[:with_one_ace]) == {3, 13}
	end

	test "that point tuple  can be calculated for a hand with two aces", context do
		assert calculate_points(context[:with_two_aces]) == {2, 12}
	end

	test "that point tuple can be calculated for a hand when bust high", context do
		assert calculate_points(context[:with_bust_high]) == {16, nil}
	end

	test "that nil point tuple are given for a hand when bust low and high", context do
		assert calculate_points(context[:with_bust_high_and_low]) == {nil, nil}
	end

	test "that 4 aces will give correct point tuple", context do
		assert calculate_points(context[:with_four_aces]) == {4, 14}
	end

end
