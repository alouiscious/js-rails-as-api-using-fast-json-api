class SightingsController < ApplicationController
  
  def index
    @sightings = Sighting.all
    render json: SightingSerializer.new(@sightings)

     # without serializer
    # render json: @sightings.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])

    
  end
  
  def show
    @sighting = Sighting.find(params[:id])
    options = {
      include: [:bird, :location]
    }
    render json: SightingSerializer.new(@sighting,options)
    
    
    # without serializer
    # render json: @sighting.to_json(:include => {:bird => {:only =>[:name, :species]}, :location => {:only =>[:latitude, :longitude]}}, :except => [:updated_at])
  end
end