class ListingsController < ApplicationController
  def index
    @listings = Listing.active.page(params[:page])
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(model_params)

    if @listing.save
      redirect_to @listing, notice: 'You have successfully created a Listing!'
    else
      render :new
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])

    if @listing.update(model_params)
      redirect_to @listing, notice: 'You have successfully updated a Listing!'
    else
      render :edit
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

  private

  def model_params
    params.require(:listing).permit(:title, :content, :state, :zipcode, :image_url)
  end
end
