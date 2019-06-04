class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[show edit update destroy]
  before_action :authorize_ticket, only: %i[ show edit update]
  before_action :set_options_for_select, only: %i[new edit]
  before_action :authenticate_user!, :except => [:create]
require './lib/generate_pdf'

  def index
    if current_user.manager? || current_user.salesman?
    @total_of_tickets = Ticket.where(company_id: current_user.company_id).order(:name).count
    else
    @total_of_tickets = Ticket.count
    end
    @search = policy_scope(Ticket).ransack(params[:q])
    @tickets = @search.result.includes(:client, :user, :company, :responsible)
    @tickets = @tickets.order(id: :desc)

 end
  def show
    @activities = @ticket.activities
    @activity = Activity.new
  end

  def new
    @ticket = Ticket.new
    @client = Client.new
    @user = User.new
    @responsible = Responsible.new

  end

  def edit
    @companies = Company.all.order(:name)
  end

  def create
    if current_user.present?
    
    @ticket = Ticket.new(ticket_params)
    @ticket.user_id = current_user.id
    respond_to do |format|
      if @ticket.save
        
        format.html { redirect_to @ticket, notice: 'Leads criado com sucesso.' }
        format.json { render :index, status: :created, location: @ticket }
      else
        format.html { render  :new }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  else
    @ticket = Ticket.new(ticket_params)
    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Enviado com sucesso! Obrigado por participar!' }
        format.json { render :new, status: :created, location: @ticket }
      else
        format.html { redirect_to new_client_path, notice: 'Está errado! Complete os campos de forma correta!' }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  def update

    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to @ticket, notice: 'Edição concluida com sucesso.' }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket.destroy
    respond_to do |format|
      format.html { redirect_to tickets_url, notice: 'Atendimento deletado com sucesso.' }
      format.json { head :no_content }
    end
  end



  private

  def authorize_ticket
      authorize @ticket
   end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_options_for_select
    @courses = Course.all
    @companies = Company.all.order(:name)
    @clients = Client.all
    @responsibles = Responsible.all.order(:name)

  end
  def ticket_params
    if current_user.superadmin?
    params.require(:ticket).permit(:email, :status, :total, :name, :telephone, :question, :final, :mid, :course_id, :client_id, :responsible_id,:source_id,:company_id)
    else
    params.require(:ticket).permit(:email, :status, :total, :name, :telephone, :question, :final, :mid, :course_id, :client_id, :responsible_id,:source_id).merge(company_id: current_user.company.id)

    end 
  end
end
