class GroupsController < ApplicationController
  before_action :logged_in_user, only: %i[create destroy index new edit]
  before_action :correct_user, only: :destroy
  before_action :set_group, only: %i[show edit update destroy]

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:success] = 'Group created!'
      redirect_to groups_path
    else
      flash.now[:danger] = 'Failed to create a group!'
      render 'new'
    end
  end

  def destroy
    @group.destroy
    flash.now[:notice] = 'Group is deleted'
    redirect_to groups_path
  end

  def index
    @groups = Group.all.order(created_at: :desc)
  end

  def update
    if @group.update(group_params)
      flash[:notice] = 'Group is updated!'
      redirect_to groups_path
    else
      flash.now[:danger] = 'Group failed to be updated'
      redirect_to 'edit'
    end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end

  def correct_user
    @group = current_user.groups.find_by(id: params[:id])
  end
end
