class TicketPolicy < ApplicationPolicy
  def index?
    if user.present?
       user.superadmin?
     else
    end
  end
  def edit?
    if user.present?
       user.superadmin? || user.manager? || user.salesman?
     else
     end
   end
  def show?
    user.superadmin? || user.manager? || user.salesman?
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
       elsif user.email == "cleiton.goncalves@escolacem.com.br" || user.email == "paloma.vieira@escolacem.com.br" || user.email == "jusselma.campos@escolacem.com.br" || 
        user.email == "nova@escolacem.com.br" 
       scope.where(company_id: user.company_id) && scope.where(responsible_id: user.responsible_id)
       elsif user.email == "italo.volotao@escolacem.com.br" 
        scope.where(:company_id => [1,4] ) && scope.where(:responsible_id => [1,2,3])
       elsif user.email == "sabrina.paiva@escolacem.com.br" 
        scope.where(:company_id => [2,4]) && scope.where(:responsible_id => [4,5,6] )
       elsif user.email == "sabrina.pazeli@escolacem.com.br" || user.email==  "manuela.xavier@escolacem.com.br"
        scope.where(:company_id => [3,4]) && scope.where(:responsible_id => [7,8])
       elsif user.email == "fabia.vargas@escolacem.com.br"  || user.email == "gabi.lacerda@escolacem.com.br"
        scope.where(user_id: user.id)
        
    
       end
      end
     end
   end

