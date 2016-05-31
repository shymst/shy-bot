# Description:  Aggregation of task

request = require('request')
# fs      = require('fs')
# body = fs.readFileSync('./scripts/body.json').toString()

module.exports = (robot) ->
  robot.hear /task:(.*)/i, (msg) ->
    msg.send "#{msg.match[1]} が記録されたよ:writing_hand:"


  robot.respond /集計して/i, (msg) ->
    date = new Date
    # 1日を計算
    oneday = Math.floor((date.getTime() - 86400000) / 1000)

    options = {
      url: 'https://slack.com/api/channels.history'
      qs: {
        'token': process.env.HUBOT_SLACK_TOKEN
        'channel': msg.message.rawMessage.channel
        # １日前からの履歴を取得
        'oldest': oneday
      }
    }
    request.get options, (err, res, body) ->
      if err or res.statusCode != 200
        return msg.send "取得できなかったよ:troll:"

      histories = JSON.parse(body).messages
      tasks = {}
      done = 0

      # robot.logger.info histories

      for history in histories
        # メッセージと時間を変数へ追加
        text = history.text
        ts = Math.floor(history.ts)

        # indexOf - 文字列が見つからなければ -1を返す。
        if text.indexOf("集計して") isnt -1
          done++

          # 2つ目の"集計して"終了
          if done == 2
            break
          before_time = ts

        else if text.indexOf("task:") isnt -1
          time = ts - before_time
          before_time = ts

          if text of tasks
            w_task = tasks[text] + -time
            tasks[text] = w_task
          else
            tasks[text] = -time

      # robot.logger.info tasks

      # tasksが空か
      if Object.keys(tasks).length == 0
        return msg.send "集計するタスクがないよ:troll:"

      tasks = reverse_array tasks
      robot.logger.info tasks

      day = today(date)
      msg.send ":calendar:#{day}"

      for key, value of tasks
        t_time = ""
        taskName = key.substr(5)
        diffs = value
        days = parseInt(diffs/(24*60*60), 10)
        diffs -= days * 24 * 60 * 60
        hours = parseInt(diffs/(60*60), 10)
        diffs -= hours * 60 * 60
        minutes = parseInt(diffs/60, 10)
        diffs -= minutes * 60
        sec = parseInt(diffs, 10)

        t_time += hours + "h " if hours isnt 0
        t_time += minutes + "m " if minutes isnt 0
        t_time += sec + "s " if sec isnt 0

        if taskName.indexOf("トイレ") != -1
          msg.send "#{taskName} : #{t_time}"
        else if taskName.indexOf("ランチ") != -1
          msg.send "#{taskName} : #{t_time}"
        else
          msg.send "#{taskName} : #{t_time}"

    # 連想配列を逆順入れ替え
    reverse_array = (arr) ->
      key = []
      for i of arr
        key.push(i)
      key.reverse()
      ret = []
      for i of key
        ret[key[i]] = arr[key[i]]
      return ret

    # 日付を取得
    today = (d) ->
      year  = d.getFullYear()
      month = d.getMonth() + 1
      date  = d.getDate()
      return "#{year}年#{month}月#{date}日"
