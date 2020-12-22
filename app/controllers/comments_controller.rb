class CommentsController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    @autors = Author.all
    @comment = @post.comments.create(comment_params)
    @comments = @post.comments
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    message = if @comment.persisted?
                { notice: 'Commented created successfully'}
              else
                { alert: "Comment was not created. Content can't be blank." }
              end
    redirect_to post_path(@post), message
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

  def publish
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.update(status: :published)
    redirect_to post_path(@post), notice: 'Comment was successfully published.'
  end


  private
  def comment_params
    params.require(:comment).permit(:body, :user_id, :status)
  end
end
