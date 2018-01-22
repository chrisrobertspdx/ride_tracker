class BikesController < ApplicationController

  #wanted this to be more granular
  before do
    if !logged_in?
      redirect to "/"
    end
  end
  
  get '/bikes/add' do
     #require login
    erb :"/bikes/create"
  end
  
  get '/bikes/:bike_id' do
     #require login
    @bike = Bike.find(params[:bike_id])
    erb :"/bikes/show"
  end
  
  post '/bikes' do
     #require login
    bike = Bike.new(params)
    if bike.save
      current_cyclist.bikes << bike
    else
      #flash error
    end  
    redirect to "/cyclists"
  end
  
  get '/bikes/:bike_id/update' do
     #require login
    @bike = Bike.find(params[:bike_id])
    erb :"/bikes/edit"
  end
  
  patch '/bikes/:bike_id' do
    #require login
    @bike = Bike.find(params[:bike_id])
    @bike.update({make: params[:make], model: params[:model], frame_size: params[:frame_size], bike_type: params[:bike_type], maintenance_log: params[:maintenance_log]})
    if @bike.save
      flash[:message] = "Bike updated!"
      redirect to "/bikes/#{@bike.id}"
    else
      flash[:message] = "There was a problem updating your bike."
      render "/bikes/edit"
    end
  end
  
  delete '/bikes/:bike_id/delete' do
    @bike = Bike.find(params[:bike_id])
    @bike.destroy
    flash[:message] = "Bike deleted."
    redirect to "cyclists"
  end
  
end