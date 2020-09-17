class DailyEmotionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

    def show?
      true # Tous les users peuvent voir des emotions
    end

    def create?
      true # Tous les users peuvent voir des emotions
    end

    def destroy?
      return is_coach? # Seuls les coachs supprimer des emotions
    end

  private

  def is_coach?
    @user.coach?
  end

end
