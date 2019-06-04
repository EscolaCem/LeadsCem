class CoursePolicy < ApplicationPolicy
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
      if user.superadmin?
        scope.all
      else
        scope.where(company_id: user.company_id)
      end
    
     end
   end
end
