class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:username] == ENV["BLOG_USERNAME"] && params[:password] == ENV["BLOG_PASSWORD"]
      session[:admin] = true
      redirect_to posts_path, notice: "Login realizado com sucesso!"
    else
      flash[:error] = "Credenciais inválidas"
      redirect_to login_path
    end
  end

  def destroy
    session.delete(:admin)
    redirect_to posts_path, notice: "Logout realizado com sucesso!"
  end
end
