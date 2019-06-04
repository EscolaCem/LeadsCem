class UserPolicy < ApplicationPolicy
    def index?
      user.superadmin? || user.manager?
    end
    def edit?
      user.superadmin? || record.company_id == user.company_id
   end
    def show?
      edit?
    end
    def new?
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
