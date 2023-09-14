class RanksController < ApplicationController
  
  def rank 
    # 投稿ごとのいいね数をカウントし、降順に並べ替えた投稿IDのリストを取得
    post_ids = Favorite.group(:post_id).select("post_id, MIN(created_at) as earliest_liked_at").order('count(post_id) desc').limit(50).pluck(:post_id)
    
    # 取得した投稿IDのリストを使って投稿を取得
    @post_favorite_ranks = Post.find(post_ids)
  end
  
end
