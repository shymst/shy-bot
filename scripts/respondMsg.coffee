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

  # robot.hear /今日/i, (msg) ->
  #   date = new Date
  #   day = today(date)
  #   msg.send day
  #
  # today = (d) ->
  #   year  = d.getFullYear()
  #   month = d.getMonth() + 1
  #   date  = d.getDate()
  #   return "#{year}年#{month}月#{date}日"
