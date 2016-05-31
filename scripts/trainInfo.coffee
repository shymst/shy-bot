# Description:  Announce train information

cronJob = require('cron').CronJob
cheerio = require 'cheerio-httpcli'
baseUrl = 'http://transit.loco.yahoo.co.jp/traininfo/gc/13/'

module.exports = (robot) ->
  robot.respond /電車/i, (msg) ->

    cheerio.fetch baseUrl, (err, $, res) ->
      if $('.elmTblLstLine.trouble').find('a').length == 0
        msg.send "事故や遅延情報はありません:train:"
        return

      $('.elmTblLstLine.trouble a').each ->
        url = $(this).attr('href')
        cheerio.fetch url, (err, $, res) ->
          title = ":train::warning:#{$('h1').text()} #{$('.subText').text()}"
          result = ""
          $('.trouble').each ->
            trouble = $(this).text().trim()
            result += "- " + trouble + "\r\n"
          msg.send "#{title}\r\n#{result}"

  sendSlack = (title, result) ->
    data =
      content:
        fallback: "#{title}\r\n#{result}"
        text: "#{title}\r\n#{result}"
        color: "#e84050"
      channel: "bot"
    robot.emit "slack.attachment", data

  cronJob = new cronJob('00 */15 19,20 * * 1-5', () ->
    cheerio.fetch baseUrl, (err, $, res) ->
      if $('.elmTblLstLine.trouble').find('a').length == 0
        return

      $('.elmTblLstLine.trouble a').each ->
        url = $(this).attr('href')
        cheerio.fetch url, (err, $, res) ->
          title = ":train::warning:#{$('h1').text()} #{$('.subText').text()}"
          result = ""
          $('.trouble').each ->
            trouble = $(this).text().trim()
            result += "- " + trouble + "\r\n"
            sendSlack title, result
  )
  cronJob.start()
