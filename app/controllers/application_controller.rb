class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end
  
  
  get '/airline/:id' do
    airline = Airline.find_by(slug: params[:slug])

    # include associated reviews in the JSON response
    airline.to_json(only: [:id, :name, :slug, :image_url], include: {
      reviews: { only: [:tittle, :description, :score], include: {
        user: { only: [:name] }
      } }
    })
  end
  