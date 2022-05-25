class DwarvesController < ApplicationController
  before_action :set_dwarf, only: [:show, :edit, :update, :destroy]
  def index
    @dwarves = policy_scope(Dwarf.all)
  end

  def show
  end

  def new
    @dwarf = Dwarf.new
    authorize @dwarf
  end

  def create
    p dwarf_params
    @dwarf = Dwarf.new(dwarf_params)
    @dwarf.user = current_user

    authorize @dwarf
    if @dwarf.save
      redirect_to dwarves_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dwarf.update(dwarf_params)
      redirect_to dwarf_path(@dwarf)
    else
      render :new
    end
  end

  def destroy
    @dwarf.destroy

    redirect_to dwarves_path
  end

  private

  def dwarf_params
    params.require(:dwarf).permit(:name, :sexe, :origin, :age, :size, :description, :price, :city, :photo, job_ids: [])
  end

  def set_dwarf
    @dwarf = Dwarf.find(params[:id])
    authorize @dwarf
  end
end
