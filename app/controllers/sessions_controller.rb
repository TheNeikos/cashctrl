class SessionsController < ApplicationController
  def new
    @session = Session.new
  end

  def create
    @session = Session.new new_session_params

    if @session.save then
      redirect_to :index
    else
      render :new
    end
  end

  def delete
  end

  private

  def new_session_params
    params.require(:session).permit(:email, :password)
  end

end
