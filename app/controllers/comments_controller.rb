class CommentsController < ApplicationController
  before_action :find_authors, only: %(edit create update)
  before_action :find_post
  before_action :find_comments, only: [:edit, :new]
  def new
    @comment = @post.comments.create(comment_params)
  end

  def edit
    @comment = Comment.find(params[:id])
    render 'comments/update_comment'
  end

  def add
    @comment = @post.comments.new
  end

  def create
    @comment = @post.comments.create(comment_params)
    message = if @comment.persisted?
                { notice: 'Commented created successfully'}
              else
                { alert: "Comment was not created. Content can't be blank." }
              end
    render 'comments/post_comment' #or redirect_to post_path(@post)
    end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment_id = @comment.id
    render 'comments/destroy_comment'
    @comment.destroy

  end

  def update
    @comment = @post.comments.find(params[:id])
    #@comment.published!
    @comment.update(comment_params)
    redirect_to post_path(@post)
  end

  def publish
    @comment = @post.comments.find(params[:id])
    @comment.update(status: :published)
    redirect_to post_path(@post), notice: 'Comment was successfully published.'
  end


  private
  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_comments
    @comments = @post.comments
  end

  def find_authors
    @authors = Author.all
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :status, :edited, :parent_id)
  end

  def chang_edit
    params.require(:comment).permit(:edited)
  end
end
