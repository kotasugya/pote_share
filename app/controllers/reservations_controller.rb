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

  def index
    @reservations = Resevation.all
    @reservation = Resevation.find_by(params[:post_id])
    @post = Post.find_by(params[:id])
    if @reservation.post_id == @post.id
      @post = Post.find(params[:id])
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
