# Description:  respond help message

help = [
  "yagi wiki <query>     - wikiで検索するよ",
  "yagi 電車              - 電車の遅延情報を教えるよ",
  "yagi map me <query>   - 周辺地図を表示するよ",
  "yagi youtube <query>  - Youtubeで検索するよ",
  "task:タスク名          - タスクを記録するよ",
  "yagi 集計して          - タスクを集計するよ",
]

module.exports = (robot) ->
  robot.hear /help|へるぷ|ヘルプ/i, (msg) ->
    for h in help
      msg.send h
