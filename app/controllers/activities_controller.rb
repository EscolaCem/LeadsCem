class ActivitiesController < ApplicationController
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  before_action :set_ticket, only:[:create]
  before_action :authorize_activity, only: [:show, :edit, :update]
  



  def index
    @activities = Activity.all

  end

  def show


  end

  def new
    @activity = Activity.new
    @tickets = Ticket.all

  end

  def edit
      @tickets = Ticket.all
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.ticket = @ticket

    respond_to do |format|
      if @activity.save
        format.html { redirect_to ticket_path(@ticket.id), notice: 'Ação criada com sucesso' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to activities_url, notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def set_options_for_select
    @users = User.all

  end

    def set_activity
      @activity = Activity.find(params[:id])
    end


    def activity_params
      params.require(:activity).permit(:description, :date, :mid, :indication, :ticket_id).merge(user_id: current_user.id)
end
end
