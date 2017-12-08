require './config/environment'

class ApplicationController < Sinatra::Base

  use Rack::Flash

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "tubular"
  end

  get "/" do
    flash[:message] = "Welcome to Ride Tracker!"
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
