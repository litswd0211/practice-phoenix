defmodule RealworldWeb.CurrentUserAssign do
  import Phoenix.LiveView

  def on_mount(:user, _prarams, session, socket) do
    token = session["user_token"] || ""
    current_user = Accounts.get_user_by_session_token(token)
    {:cont, assign(socket, :current_user, current_user)}
  end
end
