class ValidationsController < ApplicationController
  def create
    puts params
    @reservation = Reservation.find(params[:reservation_id])
    @reservation.validation = true
    @reservation.save

    redirect_to dwarf_path(@reservation.dwarf)
  end

  def skip_pundit?
    true
  end
end
