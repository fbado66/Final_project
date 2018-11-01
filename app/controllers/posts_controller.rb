class PostsController < ApplicationController
    
  
 
  def index
      @posts = Post.all
      @comments = Comment.all
      @user = User.find(current_user.id)
      @character = Character.all.map{ |c| [ c.id, c.name] }

      # @datas = Character.find(params[:id])
      # @character = Character.find(params[:id])
    
    
      response = HTTParty.get('https://enigmatic-sea-95747.herokuapp.com/api/v1/characters/5')
      data = response.parsed_response["data"]
        puts '!!!!!^^^^^^^^!!!'      
        # puts data['character']['powers']
        # puts data['character']['videos_url']

      response = HTTParty.get('https://enigmatic-sea-95747.herokuapp.com/api/v1/videos')
      data = response.parsed_response["data"]
      puts '!!!!!!!!!!!!!!'
        data.each do |item|
        # puts item['video_url']
        # puts item['id']
        end
    
        
      response = HTTParty.get('https://enigmatic-sea-95747.herokuapp.com/api/v1/character_videos')
      data = response.parsed_response["data"]
        data.each do |item|
        # puts item['video_id']
        # puts item['id']
        end

        @videos_per_character=Array.new()
        for i in (1..11) do 
        response = HTTParty.get("https://enigmatic-sea-95747.herokuapp.com/api/v1/characters/#{i}")
        @datas = response.parsed_response["data"]
        @data_1 =@datas['character']['videos_url'][0]['video_url']
        @videos_per_character.push(@data_1)
        # puts @videos_per_character

  end 
    end
    
  





    def show

       @user = User.find(current_user.id)
       @posts = Post.find(current_user.id)

    end
  
    def new
      @post = Post.new
    end
  
    def create
     post = Post.create(
        title: params[:post][:title],
        body: params[:post][:body],
        user_id: params[:post][:user_id]
      )
       
      if session[:post_id] = post.id 
      redirect_to posts_path, notice: 'Post successfully created!'    
      else 
      redirect_to new_post_path, alert: 'Something went wrong!, missing information for some fields'
      end 
    end
  
  
    def edit
      @post = Post.find(params[:id])
      # redirect_to posts_path
    end
  
    def update
      post = Post.find(params[:id])
      post.update(
        title: params[:post][:title],
        body: params[:post][:body],
        user_id: params[:post][:user_id]
      )
      redirect_to posts_path
    end
  
     def destroy
       @post = Post.find(params[:id])
       @post.destroy 
        respond_to do |format|
        format.html 
        format.js
        end  
    end
  
  end
  