# frozen_string_literal: true

# require 'uri'
require 'net/http'
require 'json'

module SlackNotifeable
  extend ActiveSupport::Concern
  SLACK_ENDPOINT = Rails.application.credentials.slack[:notifeable_url]

  included do
    def notify_slack(notification)
      return unless notification[:Type] == 'SpamNotification'

      uri = URI.parse(SLACK_ENDPOINT)
      header = { 'Content-Type:': 'text/json' }
      params = { "text": "#{notification[:Type]}: #{notification[:Email]}" }

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri, header)
      request.body = params.to_json
      response = http.request(request)
    end
  end
end
