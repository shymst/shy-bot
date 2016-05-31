# Description:  Remind lunch time at AM11:30

cronJob = require('cron').CronJob # cronJobのの読み込み

lunch = [
  "松屋",
  "てんや",
  "ほっともっと",
  "カップラーメン",
  "マクド:hamburger:",
  "カレー",
  "中華",
  "米:rice:"
]

module.exports = (robot) ->
  robot.hear /昼飯|ランチ|おひる/i, (msg) ->
    msg.send "今日は#{msg.random lunch}にしよう"

  # cronJob = new cronJob('00 30 11 * * 1-5', () ->
  #   envelope = room: "random"
  #   robot.send envelope, "お昼の時間や、今日は#{robot.random lunch}なんてどう？"
  # )
  # cronJob.start() # cronJobの実行


# cronによるjobの設定、new cronJob('* * * * * *', function(){})で行います。引数の'* * * * * *'には、左から、jobを実行させたい 秒、分、時、日付、月、曜日を指定できます。秒、分、時、日付、月はそれぞれ2桁の整数を指定し、曜日には、0,1,2,3,4,5,6(日,月,火,水,木,金,土)を指定できます。複数指定する場合は、曜日であれば、1-5(月から金まで)や、1,3,5(月または水または金)のように指定ができます。
