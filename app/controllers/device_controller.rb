class DeviceController < ApplicationController
  def create
    Device.new(:name => params[:name]).save
  end

  def update
  end

  def read
    render json: Device.all
  end
end
