class PostPolicy < ApplicationPolicy
  def index?
    user.present?
  end

  class Scope
    attr_reader :user, :scope
    
    def initialize(user, scope)
      @user = user
      @scope = scope
    end
    
    def resolve 
      if user.present?
        if user.admin? || user.moderator? 
          scope.all
        else
          scope.where(:id => user.id)
        end
      else
        scope.none
      end
    end
  end 

end


