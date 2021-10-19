# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Post

    return unless user.present?

    can :manage, Post, user_id: user.id # if the user is logged in can manage it's own posts
  end
end
