class SearchesController < ApplicationController
  def show
    @listings =
      Listing.where(zipcode: params[:zipcode]).active.page(params[:page])
  end
end
