defmodule NumGuess do
  def process_number() do

    IO.puts("Guess the number!")

    max_tries = 3
    answer = :rand.uniform(10);
    get_input(max_tries,answer)

  end

  # recursive loop as elixir has no loops
  defp get_input(tries,answer) do

    if tries == 0 do
      IO.puts("Sorry, you have reached the max tries of 3 times.")
      :ok
    else
      guess = IO.gets("Please input a number. (below 10) : ");

      if Integer.parse(String.trim(guess)) == :error do
        IO.puts("The input is not a valid integer")
        get_input(tries - 1,answer)

      else

        guessInt = guess |> String.trim |> String.to_integer
        if 0 < guessInt and guessInt< 11 do
          if not compare_vals(guessInt,answer) do
            get_input(tries,answer)
          end
        else
          IO.puts("Please enter a number below 10")
          get_input(tries - 1,answer)
        end

      end

    end

  end

  # compare guess to real
  defp compare_vals(guessInt,answer) do
    # IO.puts(["Correct number is #{correct}"])
    IO.puts("Your guess is #{guessInt}")
    # IO.puts("You guessed: #{guessInt}, the correct is #{correct}.")

    case {guessInt, answer} do
      {guess, guess} ->
        IO.puts("Your answer is correct")
        true
      {guess, answer} when guess > answer ->
        IO.puts("Guess too big!")
        false
      _ ->
        IO.puts("Guess too small!")
        false
    end

  end

end


# NumGuess.process_number()
