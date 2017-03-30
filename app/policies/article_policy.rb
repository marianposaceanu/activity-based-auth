class ArticlePolicy < ApplicationPolicy
  # def index?
  #   user.role == 'admin'
  # end

  class Scope < Struct.new(:user, :scope)
    def resolve
      scope
    end
  end
end
