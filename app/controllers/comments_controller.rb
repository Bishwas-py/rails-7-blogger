class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create, :destroy, :update]
  before_action :set_comment, only: [:destroy, :update]

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment was successfully created"
      redirect_to post_path(@comment)
    else
      flash[:alert] = "Comment was not created"
      redirect_to post_path(@post)
    end
  end

  def destroy
    @comment.destroy
  end

  def update
    if @comment.update(comment_params)
      format_html { redirect_to post_path(@post), notice: "Comment was successfully updated." }
    else
      format_html { redirect_to post_path(@post), alert: "Comment was not updated." }
    end

    redirect_to post_path(@comment)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
