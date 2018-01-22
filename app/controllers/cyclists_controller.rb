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

    cyclist = Cyclist.new(params);
    #binding.pry
    if cyclist.save
      
      session[:cyclist_id] = cyclist.id
      #binding.pry
      redirect to "/cyclists"
    else
      #binding.pry
      #how do i display multiple messages - can I make flash an array
      # flash[:notices] = []
      cyclist.errors.messages.keys.each { |e| 
        flash[:notice] = "#{e.to_s} #{cyclist.errors.messages[e][0]}"
      }
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
  
  get '/cyclists/update' do
     #require login
    if !logged_in?
      redirect to '/login'
    end
    @cyclist = current_cyclist
    erb :"/cyclists/edit"
  end
  
  patch '/cyclists/update' do
    #require login
    if !logged_in?
      redirect to '/login'
    end
    @cyclist = current_cyclist
    @cyclist.update(params[:cyclist])
    if @cyclist.save
      flash[:message] = "Account updated!"
      redirect to "/cyclists"
    else
      #would be nice to give better message
      flash[:message] = "There was a problem updating your account."
      #should update @cyclist with params of current entry
      erb :"/cyclists/edit"
    end
  end
  
  delete '/cyclists/delete' do
    if !logged_in?
      redirect to '/login'
    end
    @cyclist = current_cyclist
    @cyclist.destroy
    flash[:message] = "Account has been deleted."
    redirect_to "/"
  end
  
end