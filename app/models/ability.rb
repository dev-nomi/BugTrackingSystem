# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

      user ||= User.new # guest user (not logged in)
      if user.user_type=="Manager"
        can :manage,User
        can :create,Project
        can :read, :all
        can :update,Project do |project|
          project.users.find_all{|favor| favor==user}[0]==user
        end
        can :destroy,Project do |project|
          project.users.find_all{|favor| favor==user}[0]==user
        end
        
      elsif user.user_type=="Qa"
        can :read, :all
        can :create, Bug
        can :update, Bug do |bug|
          bug.users.find_all{|favor| favor==user}[0]==user
        end
        can :destroy, Bug do |bug|
          bug.users.find_all{|favor| favor==user}[0]==user
        end
        
      else
        can :read, :all
      end

  end
end
