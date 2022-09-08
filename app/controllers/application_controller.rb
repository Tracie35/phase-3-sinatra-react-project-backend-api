class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end
  # get all airlines
  # get '/airlines' do
  #   all_airlines = Airline.find(params[:id])
  #   all_airlines.to_json
  # end
  
  get '/airlines/:id' do
    airline = Airline.find(params[:id])

    # include associated reviews in the JSON response
    airline.to_json(only: [:id, :name, :slug, :image_url], include: {
      reviews: { only: [:tittle, :description, :score], include: {
        user: { only: [:name] }
      } }
    })
    airline.to_json
  end


post  '/airlines/:id' do
  airline = Airline.find(params[:id])

  # include associated reviews in the JSON response
  airline.to_json(only: [:id, :name, :slug, :image_url], include: {
    reviews: { only: [:tittle, :description, :score], include: {
      user: { only: [:name] }
    } }
  })
  airline.to_json
  
end
end 