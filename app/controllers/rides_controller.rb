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
  
end