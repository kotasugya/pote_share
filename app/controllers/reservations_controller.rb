class ReservationsController < ApplicationController
  def new
    @reservation = Resevation.new
  end

  def show
    @reservation = Resevation.find(params[:id])
  end

  def create
    @reservation = Resevation.new(reservation_params)
    if @reservation.save
      redirect_to reservation_path(@reservation)
      flash[:success] = "予約が完了しました"
    end
  end

  def edit
  end

  def update
  end

  private
    def reservation_params
      params.require(:reservation).permit(:start_date, :end_date, :num_people)
    end
end
