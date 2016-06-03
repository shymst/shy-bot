# Description:  respond help message

help = [
  "`yagi wiki <項目>`     - wikiで検索するよ:point_up:",
  "`yagi 電車`              - 電車の遅延情報を教えるよ:point_up:",
  "`yagi map me <地名>`   - 周辺地図を表示するよ:point_up:",
  "`yagi youtube <項目>`  - Youtubeで検索するよ:point_up:",
  "`task:<タスク名>`          - タスクを記録するよ:point_up:",
  "`@yagi 集計して`         - タスクを集計するよ:point_up:",
]

module.exports = (robot) ->
  robot.hear /help|へるぷ|ヘルプ/i, (msg) ->
    for h in help
      msg.send h
