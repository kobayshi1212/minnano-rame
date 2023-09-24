# frozen_string_literal: true

class Ability
  include CanCan::Ability

  #管理者権限を持つユーザに管理画面へのアクセスと（新規保存、編集、削除など）許可する設定
  def initialize(user)  
    if user.try(:admin?)
      can :access, :rails_admin
      can :manage, :all
    end
  end
end
