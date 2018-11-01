class CharactersController < ApplicationController
  def index
    @characters = Character.all 

    response = HTTParty.get('https://enigmatic-sea-95747.herokuapp.com/')
      data = response.parsed_response["data"]
      #  puts '!!!!!!!!!!!!!!'
      #  p data[1]["id"]
      #  puts '!!!!!!!!!!!!!!'

         data.each do |item|
           Character.create(
             name: item["name"],
           external_id: item["id"])
           end
  end

  def show
    @character = Character.find(params[:id])
 end

 def new
   @character = Character.new
 end

 def create
  character = Character.create(
     name: params[:character][:name],
     external_id: params[:character][:id]
   )
   
 end

 def update
   character = Character.find(params[:id])
   character.update(
     name: params[:character][:name]
    )
   redirect_to characters_path
 end

end
