defmodule ApiWeb.InfoController do
    use ApiWeb, :controller

    def health(conn, _params) do
        send_resp(conn, :ok, "ok")
    end
end