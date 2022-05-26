class CurrentUser::DwarvesController < ApplicationController
  def index
    @dwarves = current_user.dwarves

    render 'dwarves/index'
  end
end
