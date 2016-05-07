class RequestsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @requests = Request.active.page(params[:page])
  end

  def new
    @request = current_user.requests.build
  end

  def create
    @request = current_user.requests.build(model_params)

    if @request.save
      redirect_to @request, notice: 'You have successfully created a Request!'
    else
      render :new
    end
  end

  def edit
    @request = current_user.requests.find(params[:id])
  end

  def update
    @request = current_user.requests.find(params[:id])

    if @request.update(model_params)
      redirect_to @request, notice: 'You have successfully updated a Request!'
    else
      render :edit
    end
  end

  def show
    @request = Request.find(params[:id])
  end

  def destroy
    @request = current_user.requests.find(params[:id])
    @request.destroy

    redirect_to requests_path
  end

  private

  def model_params
    params.require(:request).permit(:title, :content, :state, :zipcode, :image_url, :user_id)
  end
end
