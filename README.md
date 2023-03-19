# SlackNotifeable 

* The SlackNotifeable concern is included in this Rails 7 API project to send notifications to a Slack channel when a specific type of notification is triggered. The concern is defined in the concerns directory of the project and is included in the Notification model.
Usage

* Configuration

To configure the Slack webhook URL, add the following line to your config/credentials.yml.enc file:

makefile

slack:
  notifeable_url: "https://hooks.slack.com/services/T0Cs4c27GJTC02UFB6RF20/KjvVJ05qIJ31V88S27AJwJwO"

Replace the URL with the appropriate webhook URL for your Slack channel.

* To use the SlackNotifeable concern, the Notification model should have a Type attribute that indicates the type of notification. When a notification of type SpamNotification is created, the notify_slack method will be triggered and a message will be sent to the configured Slack endpoint.
Configuration

* The SLACK_ENDPOINT constant in the concern should be updated with the appropriate Slack webhook URL. The notify_slack method can also be customized to send a message with different text or format.

* Dependencies

The SlackNotifeable concern requires the uri, net/http, and json libraries to be included. These libraries are already included in the Ruby standard library and do not need to be installed separately.
License
