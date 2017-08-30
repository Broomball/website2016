class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def index
    @carousel_pictures = CarouselPicture.all
    render('layouts/index')
  end

  protect_from_forgery with: :exception
  helper_method :current_user, :current_player, :current_player_teams

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  #TODO improve effieciency of queries in navigation
  def current_player
    @current_player ||= Player.where(mtu_id: current_user.mtu_id).first if current_user
  end

  def current_player_teams
    @current_player_teams ||= Team.joins(:player_teams).where('player_teams.player_id=?', current_player.id) if current_player
  end

end
