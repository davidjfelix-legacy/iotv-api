defmodule ApiWeb.OptionsController do
    use ApiWeb, :controller

    def send_options(conn, _params) do
        conn
        |> put_resp_header("allow", "GET, HEAD, OPTIONS, POST")
        |> send_resp(200, "")
    end
end