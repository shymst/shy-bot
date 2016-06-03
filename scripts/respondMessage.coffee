# Description:  respond message

module.exports = (robot) ->
  robot.hear /おつかれ|お疲れ/i, (msg) ->
    msg.send "#{msg.message.user.name} もお疲れさん"

  robot.hear /疲れた/i, (msg) ->
    tired = [
      "お疲れ",
      "がんばれ！"
    ]
    msg.send msg.random tired
