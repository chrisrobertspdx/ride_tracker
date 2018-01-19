class CyclistsController < ApplicationController

  get '/cyclists' do
    #binding.pry
    if !logged_in?
      redirect to '/login'
    end
    
    @cyclist = current_cyclist
    erb :"/cyclists/show"
  end
  
  get '/signup' do
    #flash[:notice] = "Hooray, Flash is working!"
    erb :"/cyclists/create"
  end
  
  post '/signup' do
    #make sure username is not taken
    #make sure passwords match
    
    cyclist = Cyclist.new(params)
    #binding.pry
    if cyclist.save
      
      session[:cyclist_id] = cyclist.id
      #binding.pry
      redirect to "/cyclists"
    else
      binding.pry
      #add error message
      redirect to "/signup"
    end
  end
  
  get '/login' do
    #binding.pry
    
    if logged_in?
      redirect to '/cyclists'
    end
    erb :'/cyclists/login'
  end

  post '/login' do
    @cyclist = Cyclist.find_by(:username => params[:username])
    if @cyclist && @cyclist.authenticate(params[:password])
      session[:cyclist_id] = @cyclist.id
      redirect "/cyclists"
    else
      #need error message
      flash[:notice] = "Username/Password combo is incorrect."
      redirect "/login"
    end
  end
  
  get '/logout' do
    #binding.pry
    if !logged_in?
      redirect to '/login'
    end
    session[:cyclist_id] = nil
    flash[:notice] = "You have been logged out."
    erb :'/cyclists/login'
  end  
  
  
end