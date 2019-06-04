class PagesController < ApplicationController
  before_action :authenticate_user!

  def main
    
        if current_user.email == "jusselma.campos@escolacem.com.br" || current_user.email == "paloma.vieira@escolacem.com.br" || current_user.email == "cleiton.goncalves@escolacem.com.br" ||
        current_user.email == "nova@escolacem.com.br" 
        @total_of_dayattended = Ticket.where("created_at > ?", Date.today).where(responsible_id: current_user.responsible_id,status: "NãoAtende").count
        @total_of_daynew = Ticket.where("created_at > ?", Date.today).where(responsible_id: current_user.responsible_id,status: "Novo").count
        @total_of_daycontact = Ticket.where("created_at > ?", Date.today).where(responsible_id: current_user.responsible_id,status: "Negociação").count
        @total_of_dayregistration = Ticket.where("created_at > ?", Date.today).where(responsible_id: current_user.responsible_id,status: "Matriculado").count
        @total_of_daypotential = Ticket.where("created_at > ?", Date.today).where(responsible_id: current_user.responsible_id,status: "SemPotencial").count
        @total_of_dayagend = Ticket.where("created_at > ?", Date.today).where(responsible_id: current_user.responsible_id,status: "Agendado").count
        @total_of_daysubscription = Ticket.where("created_at > ?", Date.today).where("created_at > ?", Date.today).where(responsible_id: current_user.responsible_id,status: "Inscrição").count
        @total_of_attended = Ticket.where(responsible_id: current_user.responsible_id,status: "NãoAtende").count
        @total_of_subscription = Ticket.where(responsible_id: current_user.responsible_id,status: "NãoAtende").count
        @total_of_new = Ticket.where(responsible_id: current_user.responsible_id,status: "Novo").count
        @total_of_contact = Ticket.where(responsible_id: current_user.responsible_id,status: "Negociação").count
        @total_of_registration = Ticket.where(responsible_id: current_user.responsible_id,status: "Matriculado").count
        @total_of_potential = Ticket.where(responsible_id: current_user.responsible_id,status: "SemPotencial").count
        @total_of_agend = Ticket.where(responsible_id: current_user.responsible_id,status: "Agendado").count
        @total_of_subscription = Ticket.where(responsible_id: current_user.responsible_id,status: "Inscrição").count
        @tickets  = Ticket.where(responsible_id: current_user.responsible_id).order(id: :desc)
        elsif current_user.email == "italo.volotao@escolacem.com.br"
        @tickets  = Ticket.where(:company_id => [1,4],:responsible_id => [1,2,3,9,10]).order(id: :desc)
        @total_of_dayattended = Ticket.where("created_at > ?", Date.today).where(:company_id => [1,4],:responsible_id => [1,2,3,9],status: "NãoAtende").count
        @total_of_daynew = Ticket.where("created_at > ?", Date.today).where(:company_id => [1,4],:responsible_id => [1,2,3,9],status: "Novo").count
        @total_of_daycontact = Ticket.where("created_at > ?", Date.today).where(:company_id => [1,4],:responsible_id => [1,2,3,9],status: "Negociação").count
        @total_of_dayregistration = Ticket.where("created_at > ?", Date.today).where(:company_id => [1,4],:responsible_id => [1,2,3,9],status: "Matriculado").count
        @total_of_daypotential = Ticket.where("created_at > ?", Date.today).where(:company_id => [1,4],:responsible_id => [1,2,3,9],status: "SemPotencial").count
        @total_of_dayagend = Ticket.where("created_at > ?", Date.today).where(:company_id => [1,4],:responsible_id => [1,2,3,9],status: "Agendado").count
        @total_of_attended = Ticket.where(:company_id => [1,4],:responsible_id => [1,2,3,9],status: "NãoAtende").count
        @total_of_new = Ticket.where(:company_id => [1,4],:responsible_id => [1,2,3,9],status: "Novo").count
        @total_of_contact = Ticket.where(:company_id => [1,4],:responsible_id => [1,2,3,9],status: "Negociação").count
        @total_of_registration = Ticket.where(:company_id => [1,4],:responsible_id => [1,2,3,9],status: "Matriculado").count
        @total_of_potential = Ticket.where(:company_id => [1,4],:responsible_id => [1,2,3,9],status: "SemPotencial").count
        @total_of_agend = Ticket.where(:company_id => [1,4],:responsible_id => [1,2,3,9],status: "Agendado").count
      elsif current_user.email == "sabrina.paiva@escolacem.com.br"
        @tickets  = Ticket.where(:company_id => [3,4],:responsible_id => [4,5,6,9,10]).order(id: :desc)
        @total_of_dayattended = Ticket.where("created_at > ?", Date.today).where(:company_id => [3,4],:responsible_id => [4,5,6,9],status: "NãoAtende").count
        @total_of_daynew = Ticket.where("created_at > ?", Date.today).where(:company_id => [3,4],:responsible_id => [4,5,6,9],status: "Novo").count
        @total_of_daycontact = Ticket.where("created_at > ?", Date.today).where(:company_id => [3,4],:responsible_id => [4,5,6,9],status: "Negociação").count
        @total_of_dayregistration = Ticket.where("created_at > ?", Date.today).where(:company_id => [3,4],:responsible_id => [4,5,6,9],status: "Matriculado").count
        @total_of_daypotential = Ticket.where("created_at > ?", Date.today).where(:company_id => [3,4],:responsible_id => [4,5,6,9],status: "SemPotencial").count
        @total_of_dayagend = Ticket.where("created_at > ?", Date.today).where(:company_id => [3,4],:responsible_id => [4,5,6,9],status: "Agendado").count
        @total_of_daysubscription = Ticket.where("created_at > ?", Date.today).where(:company_id => [3,4],:responsible_id => [4,5,6,9],status: "Inscrição").count
        @total_of_attended = Ticket.where(:company_id => [3,4],:responsible_id => [4,5,6,9],status: "NãoAtende").count
        @total_of_new = Ticket.where(:company_id => [3,4],:responsible_id => [4,5,6,9],status: "Novo").count
        @total_of_contact = Ticket.where(:company_id => [3,4],:responsible_id => [4,5,6,9],status: "Negociação").count
        @total_of_registration = Ticket.where(:company_id => [3,4],:responsible_id => [4,5,6,9],status: "Matriculado").count
        @total_of_potential = Ticket.where(:company_id => [3,4],:responsible_id => [4,5,6,9],status: "SemPotencial").count
        @total_of_agend = Ticket.where(:company_id => [3,4],:responsible_id => [4,5,6,9],status: "Agendado").count
        @total_of_subscription = Ticket.where(:company_id => [3,4],:responsible_id => [4,5,6,9],status: "Inscrição").count

      elsif current_user.email == "sabrina.pazeli@escolacem.com.br" || current_user.email == "manuela.xavier@escolacem.com.br"
        @tickets  = Ticket.where(:company_id => [2,4],:responsible_id => [7,8,9,10]).order(id: :desc)
        @total_of_dayattended = Ticket.where("created_at > ?", Date.today).where(:company_id => [2,4],:responsible_id => [7,8,9],status: "NãoAtende").count
        @total_of_daynew = Ticket.where("created_at > ?", Date.today).where(:company_id => [2,4],:responsible_id => [7,8,9],status: "Novo").count
        @total_of_daycontact = Ticket.where("created_at > ?", Date.today).where(:company_id => [2,4],:responsible_id => [7,8,9],status: "Negociação").count
        @total_of_dayregistration = Ticket.where("created_at > ?", Date.today).where(:company_id => [2,4],:responsible_id => [7,8,9],status: "Matriculado").count
        @total_of_daypotential = Ticket.where("created_at > ?", Date.today).where(:company_id => [2,4],:responsible_id => [7,8,9],status: "SemPotencial").count
        @total_of_dayagend = Ticket.where("created_at > ?", Date.today).where(:company_id => [2,4],:responsible_id => [7,8,9],status: "Agendado").count
        @total_of_attended = Ticket.where(:company_id => [2,4],:responsible_id => [7,8,9],status: "NãoAtende").count
        @total_of_new = Ticket.where(:company_id => [2,4],:responsible_id => [7,8,9],status: "Novo").count
        @total_of_contact = Ticket.where(:company_id => [2,4],:responsible_id => [7,8,9],status: "Negociação").count
        @total_of_registration = Ticket.where(:company_id => [2,4],:responsible_id => [7,8,9],status: "Matriculado").count
        @total_of_potential = Ticket.where(:company_id => [2,4],:responsible_id => [7,8,9],status: "SemPotencial").count
        @total_of_agend = Ticket.where(:company_id => [2,4],:responsible_id => [7,8,9],status: "Agendado").count
        elsif current_user.superadmin?
        @tickets  = Ticket.where(:company_id => [1,2,3,4]).order(id: :desc)
        @total_of_dayattended = Ticket.where("created_at > ?", Date.today).where(:company_id => [1,2,3,4],status: "NãoAtende").count
        @total_of_daynew = Ticket.where("created_at > ?", Date.today).where(:company_id => [1,2,3,4],status: "Novo").count
        @total_of_daycontact = Ticket.where("created_at > ?", Date.today).where(:company_id => [1,2,3,4],status: "Negociação").count
        @total_of_dayregistration = Ticket.where("created_at > ?", Date.today).where(:company_id => [1,2,3,4],status: "Matriculado").count
        @total_of_daypotential = Ticket.where("created_at > ?", Date.today).where(:company_id => [1,2,3,4],status: "SemPotencial").count
        @total_of_dayagend = Ticket.where("created_at > ?", Date.today).where(:company_id => [1,2,3,4],status: "Agendado").count
        @total_of_attended = Ticket.where(:company_id => [1,2,3,4],status: "NãoAtende").count
        @total_of_new = Ticket.where(:company_id => [1,2,3,4],status: "Novo").count
        @total_of_contact = Ticket.where(:company_id => [1,2,3,4],status: "Negociação").count
        @total_of_registration = Ticket.where(:company_id => [1,2,3,4],status: "Matriculado").count
        @total_of_potential = Ticket.where(:company_id => [1,2,3,4],status: "SemPotencial").count
        @total_of_agend = Ticket.where(:company_id => [1,2,3,4],status: "Agendado").count
        elsif  current_user.email == "fabia.vargas@escolacem.com.br" || current_user.email == "gabi.lacerda@escolacem.com.br"
          @tickets = Ticket.where(user_id: current_user.id).order(id: :desc)
        
    end 
  
  end 
end
