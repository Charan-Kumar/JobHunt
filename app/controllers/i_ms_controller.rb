class IMsController < ApplicationController
  before_action :set_im, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @ims = Im.all
    respond_with(@ims)
  end

  def show
    respond_with(@im)
  end

  def new
    @im = Im.new
    respond_with(@im)
  end

  def edit
  end

  def create
    @im = Im.new(im_params)
    @im.save
    respond_with(@im)
  end

  def update
    @im.update(im_params)
    respond_with(@im)
  end

  def destroy
    @im.destroy
    respond_with(@im)
  end

  private
    def set_im
      @im = Im.find(params[:id])
    end

    def im_params
      params.require(:im).permit(:im_account_type, :im_account_name, :user_id)
    end
end
