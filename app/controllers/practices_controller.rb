class PracticesController < ApplicationController
  before_action :set_practice, only: %i[show edit update destroy]

  def new
    @practice = Practice.new
  end

  def index
    @practices = current_user.practices.with_group
  end

  def search
    if params[:search].blank?
      redirect_to(practices_path, alert: "Empty field!") and return
    else
      @practice = params[:search].downcase
      @results = Practice.all.where("lower(name) LIKE :search", search: @practice)
    end
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
      flash.now[:danger] = "Not Created!"
      render 'new'
    end
  end

  def update
    @practice.groups << Group.find(params[:practice][group_ids]) if params[:practice][:group_ids]
    if @practice.update(practice_params)
      flash[:notice] = "Practice updated"
      if params[:practice][:group_ids]
        redirect_to practices_path
      else
        redirect_to not_group_path
      end
    else
      flash.now[:danger] = 'Update failed'
      redirect_to 'edit'
    end
  end

  def edit;
  end

  def show;
  end

  def destroy
    @practice.destroy
    flash.now[:success] = "Practice is deleted"
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
