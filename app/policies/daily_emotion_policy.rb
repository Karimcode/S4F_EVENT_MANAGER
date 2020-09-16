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
end
