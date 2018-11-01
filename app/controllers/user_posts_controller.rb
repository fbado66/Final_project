class UserPostsController < ApplicationController
  def index
    @user_post = UserPost.all
    @videos_per_character=Array.new()
    for i in (1..11) do 
    response = HTTParty.get("https://enigmatic-sea-95747.herokuapp.com/api/v1/characters/#{i}")
    @datas = response.parsed_response["data"]
    @data_1 =@datas['character']['videos_url'][0]['video_url']
    @videos_per_character.push(@data_1)
    puts @videos_per_character

end 
  end

  def show
   
    @user_posts = UserPost.find(current_user.id)
   
  end

  def edit
    @user_post = UserPost.find(params[:id])
  end

  def destroy
     
  end

  def create
     

     @user_post = UserPost.create(
    
     user_id: params[:user_post][:user_id],
     post_id: params[:user_post][:post_id]
     )
    

    
end 

  def update
  
  end
  

  def new
    @user_post = UserPost.new
    @post = Post.all.map{ |c| [c.id] }
    @user = User.all.map{ |c| [c.id] }
  end

end
