defmodule Twiml do
  import ExTwiml
  
  def dial_out(phone_number) do
    twiml do: dial phone_number
  end
end
