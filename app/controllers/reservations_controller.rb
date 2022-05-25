class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @dwarf = Dwarf.find(params[:dwarf_id])
    @reservation = Reservation.new
    authorize @reservation
  end

  def create
    @dwarf = Dwarf.find(params[:dwarf_id])
    @reservation = Reservation.new(reservation_params)
    @reservation.dwarf = @dwarf
    @reservation.user = current_user
    authorize @reservation
    if @reservation.save
      redirect_to dwarf_path(@reservation.dwarf)
    else
      render :new
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    authorize @reservartion
    @reservation.destroy

    redirect_to dwarf_path(@reservation.dwarf)
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_time, :end_time, :validation)
  end
end
