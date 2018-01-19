class BikesController < ApplicationController

  get '/bikes/:bike_id' do
     #require login
    @bike = Bike.find(params[:bike_id])
    erb :"/bikes/show"
  end
  
  get '/bikes/add' do
     #require login
    erb :"/bikes/create"
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
    @bike.update(params)
    if @bike.save
      redirect_to "cyclists"
    else
      #error message
      render "/bikes/edit"
    end
  end
  
  delete '/bikes/:bike_id/delete' do
   
    @bike = Bike.find(params[:bike_id])
    @bike.destroy
    redirect_to "cyclists"
  end
  
end