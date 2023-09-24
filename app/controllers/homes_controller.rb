class HomesController < ApplicationController
  def top  # 最新の投稿を取得 & ページネーション
    @posts = Post.order(created_at: :desc).page(params[:page])
  end

  def about
  end
end
