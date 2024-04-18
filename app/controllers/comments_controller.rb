class CommentsController < ApplicationController
  before_action :set_prototype, only: [:create]

  def create
    @comment = @prototype.comments.build(comment_params)  # プロトタイプに関連付けてコメントを作成
    if @comment.save
      redirect_to prototype_path(@prototype)  # プロトタイプの詳細ページにリダイレクト
    else
      # エラーが発生した場合の処理を追加する（任意）
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end