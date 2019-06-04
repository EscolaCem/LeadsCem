class SourcePolicy < ApplicationPolicy
  def edit?
     user.superadmin? || record.company_id == user.company_id
   end

  def show?
    edit?
   end

  def update?
     edit?
   end

   class Scope < Scope
    def resolve
      if user.superadmin? || user.manager? || user.salesman?
        scope.all
      else
        scope.where(company_id: user.company_id)
      end
     end
   end
end
