# # Description:  分報チャンネル作成時にメンバーを自動追加
#
# var RtmClient = require('@slack/client').RtmClient;
# var token = process.env.SLACK_API_TOKEN || '';
# var rtm = new RtmClient(token, {logLevel: 'debug'});
# rtm.start();
#
# var RTM_EVENTS = require('@slack/client').RTM_EVENTS;
#
#
# module.exports = (robot) ->
#
#   rtm.on(RTM_EVENTS.CHANNEL_CREATED, function (message) {
#     // Listens to all `channel_created` events from the team
#
#
#   });
#
#
# request = require('request')
# request.get
#   url: "https://slack.com/api/users.list?token=#{process.env.HUBOT_SLACK_TOKEN}"
#   , (err, response, body) ->
#     console.log JSON.parse(body)
# members = (member_raw["name"] \
#           for member_raw in JSON.parse(body)["members"])
#
# # forで/invite
#
# for i in [1 .. 10]
#   console.log ()
#
# members = [user.name ]
#
# for member in members
#   console.log(member)
