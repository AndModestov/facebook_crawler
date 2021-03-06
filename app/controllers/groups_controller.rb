class GroupsController < ApplicationController
  before_action :find_group, only: [:show, :destroy]

  respond_to :json, only: :destroy

  def index
    respond_with(@groups = Group.all)
  end

  def show
    respond_with(@group)
  end

  def new
    respond_with(@group = Group.new)
  end

  def create
    respond_with(@group = Group.create(group_params))
  end

  def destroy
    @group.destroy
    render json:{ group_id: @group.id }
  end

  private

  def find_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :url, :auth_login, :auth_password, :start_time, :end_time)
  end
end
