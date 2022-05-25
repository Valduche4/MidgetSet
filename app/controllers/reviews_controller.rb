class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @dwarf = Dwarf.find(params[:dwarf_id])
    @review = Review.new
    authorize @review
  end

  def create

    @review = Review.new(review_params)

    @dwarf = Dwarf.find(params[:dwarf_id])
    @review.dwarf = @dwarf
    @review.user = current_user
    authorize @review
    if @review.save
      redirect_to dwarf_path(@dwarf)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    authorize @review
    @review.destroy

    redirect_to dwarf_path(@review.dwarf)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
