class RidesController < ApplicationController

  #wanted this to be more granular
  before do
    if !logged_in?
      redirect to "/"
    end
  end
  
  get '/rides/add' do
    if current_cyclist.bikes.size == 0 
      flash[:message] = "No bikes available for new ride."
      redirect to "/cyclists"
    end
    erb :"/rides/create"
  end
  
  post '/rides' do
    ride = Ride.new(params)
    if ride.save
      redirect to "/cyclists"
    else
      #flash error
      redirect to "/rides/add"
    end  
  end
  
  get '/rides/:ride_id' do
    @ride = Ride.find(params[:ride_id])
    erb :"/rides/show"
  end

  get '/rides/:ride_id/update' do
     #require login
    @ride = Ride.find(params[:ride_id])
    erb :"/rides/edit"
  end
  
  patch '/rides/:ride_id' do
    #require login
    @ride = Ride.find(params[:ride_id])
    @ride.update({name: params[:name], distance_miles: params[:distance_miles], climbing_feet: params[:climbing_feet], terrain: params[:terrain], ride_date: params[:ride_date], duration_hours: params[:duration_hours]})
    if @ride.save
      flash[:message] = "Ride updated!"
      redirect to "/rides/#{@ride.id}"
    else
      flash[:message] = "There was a problem updating your ride."
      render "/rides/edit"
    end
  end
  
  delete '/rides/:ride_id/delete' do
    @ride = Ride.find(params[:ride_id])
    @ride.destroy
    flash[:message] = "Ride deleted."
    redirect_to "cyclists"
  end
  
end