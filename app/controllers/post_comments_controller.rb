class PostCommentsController < ApplicationController
    def index
      @post_comment = PostComment.all
    end
  
    def show
       @post_comment = PostComment.find(params[:id])
    end
  
    def edit
      @post_comment = PostComment.find(params[:id])
      # @cohort = Cohort.all.map{ |c| [c.id] }
    end
  
    def destroy
       post_comment = PostComment.find(params[:id])
       post_comment.destroy 
       redirect_to post_comments_path
    end
  
    def create
        array = params[:post_comment][:post_id]
        # array.map!(&:to_i)
        array = array[1..-1]
  
       post_comment = PostComment.create
       array.each do |post_id|
       post_comment = PostComment.create(
       comment_id: params[:post_comment][:comment_id],
       post_id: post_id
       )
      end 
  
      if session[:post_comment_id] = post_comment.id
      redirect_to post_comments_path, notice: 'Comment on Post successfully created!'
    else 
      redirect_to new_post_comments_path, alert: 'Something went wrong!, missing information for some fields'
    end 
  end 
  
    def update
    post_comment = PostComment.find(params[:id])
      post_comment.update(
      post_id: params[:post_comment][:post_id],
      comment_id: params[:post_comment][:comment_id]
      )
      redirect_to post_comment_path(post_comment)
    end
    
  
    def new
      @post_comment = PostComment.new
      @post = Post.all.map{ |c| [c.id] }
      @comment = Comment.all.map{ |c| [c.id] }
    end
  
  end
  