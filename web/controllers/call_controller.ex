defmodule Clicktocongress.CallController do
  use Clicktocongress.Web, :controller
  
  def call_me(conn, %{"dial_out" => dial_out, "my_number" => to}) do
    {:ok, _} = ExTwilio.Call.create url: "http://eb52c591.ngrok.io/api/connect?t=#{dial_out}",
                         to: to,
                         from: System.get_env "TWILIO_NUMBER"
    text conn, :ok
  end
  
  def dial_out(conn, %{"t" => to_call}) do
    resp = Twiml.dial_out to_call
    conn
    |> put_resp_content_type("text/xml")
    |> text(resp)
  end
end
