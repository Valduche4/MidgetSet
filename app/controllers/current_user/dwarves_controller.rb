class CurrentUser::DwarvesController < ApplicationController
  def index
    @dwarves = current_user.dwarves
    @dwarves = Dwarf.where(user: current_user)
  end
end
