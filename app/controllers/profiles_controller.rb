class ProfilesController < ApplicationController
  def index
    #  @character = Character.all
    # @user = User.all
    @users = current_user.character_id
  #  current_user.character_id=User.where(params[:@users]) { |c| [ c[1], c[3]] }
    @user = User.all
    # all_users=User.all
    # @users_to_add=[]
    # all_users.each do |user|
    # @something =  User.where({character_id: current_user.character_id})
    # end

    #   @users_to_add.push(@something.first.first_name)
    #   p @something.first.first_name
    # @users_to_add = @users_to_add
    end 


  def show
    @user = User.find(params[:id])
    # @users_character = UsersCharacter.find(params[:id])
    @users = User.all.map{ |c| [ c.character_id] }
    @character = Character.all.map{ |c| [ c.name] }

    id=current_user.character_id
    response = HTTParty.get("https://enigmatic-sea-95747.herokuapp.com/api/v1/characters/#{id}")
    @data = response.parsed_response["data"]
        @image =@data['character']['image_url']
        @image_url =@data['character']
        puts current_user.character_id

  end

  def new
    @post = Post.new
    @users =User.new
  end

  def create
    users=params[:users_ids]
  #   character_id= params[:users][:chararacter_id]
  #  @post = Post.create(
  #     title: params[:post][:title],
  #     body: params[:post][:body],
  #     user_id: params[:post][:user_id]
  #   )
     
  end


end 