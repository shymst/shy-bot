# Description:  A hubot script for hubot hello-bye notification.
# Author:  chiguniiita

# module.exports = (robot) ->
#   cid = setInterval ->
#     return if typeof robot?.send isnt 'function'
#     robot.send {room: "bot"}, "おはようございます:goat::goat::goat:"
#     clearInterval cid
#   , 1000
#
#   ## 終了時に通知してからexitする
#   on_sigterm = ->
#     robot.send {room: "bot"}, 'おやすみなさい:bed::zzz:'
#     setTimeout process.exit, 1000
#
#   if process._events.SIGTERM?
#     process._events.SIGTERM = on_sigterm
#   else
#     process.on 'SIGTERM', on_sigterm
