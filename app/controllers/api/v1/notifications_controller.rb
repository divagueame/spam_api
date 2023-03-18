class Api::V1::NotificationsController < ApplicationController
  before_action :set_notification, only: %i[ show update destroy ]

  # GET /notifications
  def index
    @notifications = Notification.all

    render json: @notifications
  end

  # GET /notifications/1
  def show
    render json: @notification
  end

  def create
    @notification = Notification.new(notification_params)

    if @notification.save
      render json: @notification, status: :created
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
      params.require(:notification).permit(:RecordType, :TypeType, :TypeCode, :Name, :Tag, :MessageStream, :Description, :Email, :From, :BouncedAt)
    end
end
