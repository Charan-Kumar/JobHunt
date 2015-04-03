class PhoneNosController < ApplicationController
  before_action :set_phone_no, only: [:show, :edit, :update, :destroy]

  respond_to :json

  
  def edit
  end

  def update
    @phone_no.update(phone_no_params)
    respond_with(@phone_no)
  end

  def destroy
    @phone_no.destroy
    respond_with(@phone_no)
  end

  private
    def set_phone_no
      @phone_no = PhoneNo.find(params[:id])
    end

    def phone_no_params
      params.require(:phone_no).permit(:phone_type, :phone_number, :user_id)
    end
end
