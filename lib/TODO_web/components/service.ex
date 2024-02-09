defmodule TODOWeb.Service do

  def add(port, nums) do
      # integers to a string
      msg =
        nums
        |> Enum.map(&to_string/1)
        |> Enum.join(",")

      #  sending the msg and ending "\n" as iolist
      Port.command(port, [msg, "\n"])

      # receive the result and convert to a string
      receive do
        {^port, {:data, result}} ->
          String.trim(result)
          |> String.to_integer()
      end
    end
end
