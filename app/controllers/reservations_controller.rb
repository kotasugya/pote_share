class ReservationsController < ApplicationController
  def new
    @reservation = Resevation.new
  end

  def show
    @reservation = Resevation.find(params[:id])
    @post = @reservation.post
  end

  def create
    @reservation = Resevation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path(@reservation.id)
      flash[:success] = "予約が完了しました"
    end
  end

  def index
    @reservations = Resevation.all
  end

  def edit
  end

  def update
  end

  private
  def reservation_params
    params.permit(:start_date, :end_date, :num_people, :post_id).merge(user_id: @current_user.id)
  end
end