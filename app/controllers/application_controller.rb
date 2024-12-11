class ApplicationController < ActionController::Base
  # allow_browser versions: :modern
  helper_method :admin?
  helper :ui

  private

  def admin?
    session[:admin]
  end

  def require_admin
    redirect_to login_path, alert: "Você precisa estar logado para acessar esta página." unless admin?
  end
end
