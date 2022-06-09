class GroupusersController < ApplicationController
  def update
    group = Group.find(params[:id])
    join = current_user.group_users.new(group_id: group.id)
    join.save
    redirect_to groups_path
    # group_user = GroupUser.find(params[:id])
    # group_user.update
    # redirect_to groups_path
  end      
  
  def destroy
    group = Group.find(params[:id])
    join = current_user.group_users.find_by(group_id: group.id)
    join.destroy
    redirect_to groups_path
    # group_user = GroupUser.find(params[:id])
    # group_user.destroy
    # redirect_to groups_path
  end      
end
