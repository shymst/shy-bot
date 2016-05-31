# Description:  Search in Wikipedia

request = require('request')

module.exports = (robot) ->
  robot.hear /wiki (.*)/i, (msg) ->
    keyword = encodeURIComponent msg.match[1]
    request.get("https://ja.wikipedia.org/w/api.php?action=query&format=json&prop=extracts&redirects=1&exchars=300&explaintext=1&titles=#{keyword}", (err, res, body) ->
      if err or res.statusCode != 200
        return msg.send "アクセスできなかったよ:troll:"

      data = JSON.parse(body)
      for id, value of data.query.pages
        msg.send "#{value.extract}" )
