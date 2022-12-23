class StaysController < ApplicationController
  def index
    @user = current_user
    @stays = Stay.all
  end
  
  def search
   @user = current_user
   @stays = Stay.where('stays.address LIKE(?)',"%#{params[:address]}%")
   if params[:keyword].present?
     @stays = Stay.where([ 'stays.address LIKE ? OR stays.room LIKE ? OR stays.price LIKE ? ', "%#{params[:keyword]}%","%#{params[:keyword]}%","%#{params[:keyword]}%" ])
   end
  end
  
  def insear
    @user = current_user
    @stays = Stay.all
  end
    
  def new
    @user = current_user
    @stay = Stay.new
  end
 
  def create
    @user = current_user
    @stay = Stay.new(params.require(:stay).permit(:room, :introduction, :price, :address ,:img, :user_id))
    if @stay.save
      flash[:notice] = "新規登録をしました"
      redirect_to stays_insear_path
    else
      render "new"
    end
  end
  
  def show
  end
 
  def edit
  end
 
  def update
  end

  def destroy
  end
  
 private
 def reservation_paramas
   params.permit(:room, :introduction, :price, :address ,:img, :user_id)
 end 
end

