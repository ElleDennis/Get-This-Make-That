class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @listings = Listing.active.page(params[:page])
  end

  def new
    @listing = current_user.listings.build
  end

  def create
    @listing = current_user.listings.build(model_params)

    if @listing.save
      redirect_to @listing, notice: 'You have successfully created a Listing!'
    else
      render :new
    end
  end

  def edit
    @listing = current_user.listings.find(params[:id])
  end

  def update
    @listing = current_user.listings.find(params[:id])

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
    @listing = current_user.listings.find(params[:id])
    @listing.destroy

    redirect_to listings_path
  end

  private

  def model_params
    params.require(:listing).permit(:title, :content, :state, :zipcode, :image_url, :user_id)
  end
end
