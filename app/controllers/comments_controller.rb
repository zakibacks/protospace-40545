class CommentsController < ApplicationController
  before_action :set_prototype, only: [:create]

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.new(comment_params.merge(user_id: current_user.id))
    if @comment.save
      redirect_to prototype_path(@prototype), notice: 'Comment was successfully created.'
    else
      redirect_to prototype_path(@prototype), alert: 'Failed to create comment.'
    end
  end
  

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end