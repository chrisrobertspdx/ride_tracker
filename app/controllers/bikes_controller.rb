class BikesController < ApplicationController

  get '/bikes/add' do
    erb :"/bikes/create"
  end
  
  post '/bikes' do
    bike = Bike.new(params)
    if bike.save
      current_cyclist.bikes << bike
    else
      #flash error
    end  
    redirect to "/cyclists"
  end
  
end