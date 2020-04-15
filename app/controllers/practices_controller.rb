class PracticesController < ApplicationController
  before_action :set_practice, only: %i[show edit update destroy]

  def new
    @practice = Practice.new
  end

  def index
    @practices = current_user.practices
  end

  def create
    @practice = current_user.practices.build(practice_params)
    if @practice.save
      if params[:practice][:group_ids]
        flash[:notice] = "Created with group"
        redirect_to practices_path
      else
        flash[:notice] = "Created without a group"
        redirect_to not_group_path
      end
    else
      flash[:danger] = "Creation failed"
      render 'new'
    end
  end

  def not_group
    @practice_not_group = current_user.practices.includes(:practice_groups).where(practice_groups: { group_id: nil })
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

  def edit ;end

  def show ;end

  def destroy
    @practice.destroy
    flash[:success] = "Practice is deleted"
    redirect_to practices_path
  end

  private

  def practice_params
    params.require(:practice).permit(:name, :hours, :coach_id, :group_ids)
  end

  def set_practice
    @practice = Practice.find(params[:id])
  end
end
