class RidesController < ApplicationController

  get '/rides/add' do
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
  
  delete '/rides/:ride_id/delete' do
    @ride = Ride.find(params[:ride_id])
    @ride.destroy
    redirect_to "cyclists"
  end
  
end