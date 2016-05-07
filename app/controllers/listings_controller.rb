class ListingsController < ApplicationController
  def index
    @listings = Listing.active.page(params[:page])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(params.require(:listing).permit(:title, :content, :state, :zipcode, :image_url))

    if @listing.save
      redirect_to @listing, notice: 'You have successfully created a Listing!'
    else
      render :new
    end
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy

    redirect_to listings_path
  end
end
