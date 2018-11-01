class CommentsController < ApplicationController
    def index
      @comments = Comment.all
    end
  
    def show
       @comment = Comment.find(params[:id])
    end
  
    def new
      @comment = Comment.new
    end
  
    def create
     comment = Comment.create(
        title: params[:comment][:title],
        body: params[:comment][:body]
      )
       
      if session[:comment_id] = comment.id 
      redirect_to comments_path, notice: 'Comment successfully created!'    
      else 
      redirect_to new_comment_path, alert: 'Something went wrong!, missing information for some fields'
      end 
    end
  
  
    def edit
      @comment = Comment.find(params[:id])
      # redirect_to comments_path
    end
  
    def update
      comment = Comment.find(params[:id])
      comment.update(
        title: params[:post][:title],
        body: params[:post][:body]
      )
      redirect_to  comments_path
    end
  
     def destroy
       @comment = Comment.find(params[:id])
       @comment.destroy 
        respond_to do |format|
        format.html 
        format.js
        end  
    end
  
  end
  