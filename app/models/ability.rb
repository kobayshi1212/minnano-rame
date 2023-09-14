# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)  #管理者権限を持つユーザに管理画面へのアクセスと全てのモデルに対しての全ての操作（新規保存、編集、削除など）」を許可する設定です。
    if user.try(:admin?)
      can :access, :rails_admin
      can :manage, :all
    end
  end

end
