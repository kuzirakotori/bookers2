class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def index
    @user = current_user
    @book = Book.new
    @groups = Group.all
  end
  
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @group = Group.find(params[:id])
    @groups = Group.all
  end

  def create
    @group = Group.new(groups_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to groups_path
    else
      @group = Group.new
      render :edit #保存されてない時（仮）
    end  
  end
  
  def edit
    @group = Group.find(params[:id])
  end  

  def update
    group = Group.find(params[:id])
    group.update(groups_params)
    redirect_to groups_path
  end

  def destroy
  end
  
  private
  def groups_params
    params.require(:group).permit(:name,:group_image,:introduction)
  end  
end
