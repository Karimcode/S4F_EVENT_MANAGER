class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def show?
      true # Tous les users peuvent voir les profils
    end

    def update?
      true # Tous les users peuvent voir les profils
    end


end
