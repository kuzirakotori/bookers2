class UsersController < ApplicationController

  def show
    @user=User.find(params[:id])
    @book=Book.new
    @books=@user.books
  end

  def edit
    @user=User.find(params[:id])
    redirect_to(user_path(current_user.id)) unless @user == current_user
  end

  def index
    @user=current_user
    @book=Book.new
    @users=User.all
  end

  def update
    @user=User.find(params[:id])
    if @user.update(books_params)
      redirect_to user_path(@user.id),notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private
  def books_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end

end
