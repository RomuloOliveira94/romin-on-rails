class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: :destroy
  before_action :check_first_comment, only: :create

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      @stream << turbo_stream.prepend("comments", @comment)
      respond_to do |format|
        format.turbo_stream do
            render turbo_stream: @stream
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
    @post = Post.friendly.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def check_first_comment
    @stream = []
    unless @post.comments.any?
      @stream << turbo_stream.prepend("comments", "<div id=\"bar\" class=\"divider divider-error\">Comentários</div>")
      @stream << turbo_stream.remove("message")
    end
  end
end
