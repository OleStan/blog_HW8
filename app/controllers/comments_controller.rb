class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @autors = Author.all
    @comment = @post.comments.create(comment_params)
    @comments = @post.comments
  end

  def create
    @post = Post.find(params[:post_id])
    $temp = @post
    @comment = @post.comments.create(comment_params)
    if(@comment.save)
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.published!
    redirect_to post_path(@post)
  end



  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :status)
  end
end
