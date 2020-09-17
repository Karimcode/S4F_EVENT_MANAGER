class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all # Tous les users peuvent voir des events
    end
  end


    def show?
      true # Tous les users peuvent voir des events
    end

    def create?
      return is_coach? # Seuls les coachs peuvent créer des events
    end

    def update?
      return is_coach? # Seuls les coachs peuvent modifier des events
    end

    def destroy?
      return is_coach? # Seuls les coachs peuvent modifier des events
    end

  private

  def is_coach?
    @user.coach?
  end

end
