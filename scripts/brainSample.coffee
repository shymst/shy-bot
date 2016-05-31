# Description:  brain sample

# module.exports = (robot) ->
#   robot.hear /tired/, (msg) ->
#     robot.brain.data.count = 0 unless robot.brain.data.count
#     robot.brain.data.count += 1
#     robot.brain.save
#     if robot.brain.data.count < 3 then msg.send "Let's take a short break." else msg.send "You must take a break."
#   robot.hear /fine/, (msg) ->
#     robot.brain.data.count = 0
#     robot.brain.save
#     msg.send "Good."
