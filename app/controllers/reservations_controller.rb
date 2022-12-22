class ReservationsController < ApplicationController
  def index
    @user = current_user
    @reservations = Reservation.all
  end
  
  #確認画面
  def confirm
    @user = current_user
    @stay = Stay.find(params[:format])
    @reservation = Reservation.new(reservation_paramas)
    if @reservation.invalid?    #入力項目に空のものがあれば入力画面に遷移する
      @stay = @reservation.stay
      render "new" 
    else
      @reservation.totaldays = (@reservation.enddate - @reservation.startdate).to_i
      @reservation.total_amount = (@stay.price * @reservation.totaldays * @reservation.number).to_i
    end
  end
  
  def new
    @user = current_user
    @stay = Stay.find(params[:id])
    @reservation = Reservation.new
  end
  
  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:stay_id, :user_id, :startdate, :enddate, :number,:total_amount, :totaldays))
     if params[:back] || !@reservation.save  #戻るボタンを押したときまたは、@reservationが保存されなかったらnewアクションを実行
        render "new"
     else
       redirect_to  reservation_path(@reservation), notice: "予約が完了しました"
     end
  end
  
  def show
    @user = current_user
    @reservation = Reservation.find(params[:id])
  end
 
  def edit
  end
 
  def update
  end
 
  def destroy
  end
  
  private
  def reservation_paramas
     params.permit(:stay_id, :user_id, :startdate, :enddate, :number)
  end
end
