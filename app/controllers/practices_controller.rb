class PracticesController < ApplicationController
  before_action :set_practice, only: %i[show edit update destroy]

  def new
    @practice = Practice.new
  end

  def index
    @practices = current_user.practices.with_group
  end

  def not_group
    @practices = current_user.practices.without_group
  end

  def create
    @practice = current_user.practices.build(practice_params)
    @practice.groups << Group.find(params[:practice][:group_ids]) if params[:practice][:group_ids]
    if @practice.save
      flash[:notice] = "Practice Created"
      if params[:practice][:group_ids]
        redirect_to practices_path
      else
        redirect_to not_group_path
      end
    else
      flash[:notice] = "Not Created!"
      render 'new'
    end
  end

  def update
    if @practice.update(practice_params)
      if params[:practice][:group_ids]
        redirect_to practices_path, notice: 'Updated'
      else
        redirect_to not_group_path, notice: 'project updated!'
      end
    else
      redirect_to 'edit', danger: 'project update failed.'
    end
  end

  def edit;
  end

  def show;
  end

  def destroy
    @practice.destroy
    flash[:success] = "Practice is deleted"
    redirect_to practices_path
  end

  private

  def practice_params
    params.require(:practice).permit(:name, :hours, :coach_id, :start_time, :end_time, group_ids: [])
  end

  def set_practice
    @practice = Practice.find(params[:id])
  end
end
