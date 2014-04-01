class ThingsController < ApplicationController

  def root
    redirect_to "/ads" and return
  end

  def index
    @houses = House.order(:id)
    render :index and return
  end

  def show
    @house = House.where(id: params[:id]).first
    render :show and return
  end

end
