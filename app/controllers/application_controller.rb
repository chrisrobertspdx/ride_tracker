require './config/environment'

class ApplicationController < Sinatra::Base

  use Rack::Flash, :sweep => true

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "tubular"
  end

  get "/" do
    flash.now[:message] = "Welcome to Ride Tracker!"
    @cyclists = Cyclist.all
    #@cyclists.order(:rides.sum(:distance_miles))
    @cyclists = @cyclists.sort_by{|m| m.rides.sum(:distance_miles)}.reverse!
    erb :index
  end

  get '/logout' do
    if logged_in?
      session.clear
      flash[:message] = "You have been logged out."
    end
    redirect '/login'
  end

  helpers do
    def logged_in?
      !!session[:cyclist_id]
    end

    def current_cyclist
      Cyclist.find(session[:cyclist_id])
    end
  end

end
