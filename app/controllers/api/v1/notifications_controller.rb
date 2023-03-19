class Api::V1::NotificationsController < ApplicationController
  before_action :set_notification, only: %i[ show update destroy ]

  def create
    @notification = Notification.new(notification_params)
    @notification.TypeType =  params[:Type]
    if @notification.save
      render json: @notification, status: :created, location: api_v1_notifications_url(@notification)
    else
      render json: @notification.errors, status: :unprocessable_entity
    end
  end 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_notification
      @notification = Notification.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def notification_params
      params.require(:notification).permit(:RecordType, :Type, :TypeType, :TypeCode, :Name, :Tag, :MessageStream, :Description, :Email, :From, :BouncedAt)
    end
end
