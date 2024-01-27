# frozen_string_literal: true

# Users Controller
class UsersController < ApplicationController
  before_action :set_user, except: %i[index]

  def index
    @users = User.all
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'User updated successfully'
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: 'User destroyed successfully'
    else
      redirect_to users_path, alert: 'User not destroyed successfully'
    end
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
