class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  attr_accessor :name, :email, :password, :password_confirmation
  before_action :authorize_user, only: [:show, :edit, :update]

  def index
    @users = policy_scope(User).order(id: :desc)
  end

  def show
    @users = User.find(params[:id])
  end

  def new
    @user = User.new
    @companies = Company.all.order(:name)
    @responsibles = Responsible.all.order(:name)

  end

  def edit
     @companies = Company.all.order(:name)
     @responsibles = Responsible.all.order(:name)

  end

  # POST /users
  # POST /users.json

  def create
    @user = User.create(user_params)
    if @user.save
      redirect_to root_url, :notice => "Inscreveu-se"
    else
      render "new"
    end
  end
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Usuário alterado com sucesso!' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def authorize_user
      authorize @user

    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :name, :company_name, :kind, :company_id, :responsible_id)
    end
end
