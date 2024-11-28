class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: :destroy

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.prepend("comments", @comment)
        end
      end
    else
      redirect_to @post, alert: "Não foi possível adicionar o comentário."
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(@comment) }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user, :content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end
end
