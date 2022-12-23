class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def  update
    @user = User.find(params[:id])
    if @user.update(params.require(:user).permit(:image, :name, :self_introduction))
      flash[:notice] = "更新しました"
      redirect_to :edit_user
    else
    flash.now[:notice]="更新に失敗しました。もう一度入力し直してください"
      redirect_to :edit_user
    end
  end
end
