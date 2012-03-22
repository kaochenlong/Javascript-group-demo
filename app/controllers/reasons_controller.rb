class ReasonsController < ApplicationController

  respond_to :json

  def index
    respond_with Reason.all
  end

  def create
    respond_with Reason.create reason: params[:reason]
  end

end
