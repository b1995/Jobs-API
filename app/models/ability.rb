# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

      can :read, JobPost
      can :create, JobApplication
    return unless user.admin
      can :manage, JobPost
      can :read, JobApplication
  end
end
