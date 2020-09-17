class FormulaPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end


    def show?
      true # Seuls les coachs peuvent voir des formules
    end

    def create?
      return is_coach? # Seuls les coachs peuvent créer des formules
    end

    def update?
      return is_coach? # Seuls les coachs peuvent modifier des formules
    end

    def destroy?
      return is_coach? # Seuls les coachs peuvent supprimer des formules
    end

  private

  def is_coach?
    user.coach?
  end

end
