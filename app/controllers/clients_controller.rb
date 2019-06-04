class ClientsController < ApplicationController
  before_action :set_client, only: %i[show edit update destroy]
  before_action :authorize_client, only: %i[show edit update destroy]
  before_action :authenticate_user!, :except => [:new,:show,:index,:edit]


  layout "leads"


  def index
    @search = policy_scope(Client).ransack(params[:q])
    @clients = @search.result.includes(:user, :company)
    @clients = @clients.order(id: :desc)
    @ticket = Ticket.new

  end

  def show
   end

  def new
    @client = Client.new
    @users = User.all
    @companies = Company.all
    @ticket = Ticket.new

  end

  def edit
    @users = User.all
    @companies = Company.all

  end

  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to root_path, notice: 'My Notice.' }
        format.json { render :new, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Edição concluida com sucesso.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Cliente removido com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  def authorize_client
    authorize @client
  end

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:name, :email, :matricula, :department, :phone,:company_id).merge(user_id: current_user.id)
  end
end
