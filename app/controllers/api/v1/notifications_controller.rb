# frozen_string_literal: true

module Api
  module V1
    class NotificationsController < ApplicationController
      include SlackNotifeable

      def create
        @notification = Notification.new(notification_params)
        @notification.TypeType = params[:Type]
        if @notification.save
          render json: @notification, status: :created, location: api_v1_notifications_url(@notification)
          notify_slack(params)
        else
          render json: @notification.errors, status: :unprocessable_entity
        end
      end

      private

      def notification_params
        params.require(:notification).permit(:RecordType, :Type, :TypeType, :TypeCode, :Name, :Tag, :MessageStream,
                                             :Description, :Email, :From, :BouncedAt)
      end
    end
  end
end
