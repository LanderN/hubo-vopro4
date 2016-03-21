# Description:
#   Defines periodic executions

module.exports = (robot) ->
  cronJob = require('cron').CronJob
  tz = 'Europe/Brussels'
  new cronJob('0 0 9 * * 1', remindTimesheets, null, true, tz)

  room = "C0M9L6BTQ"

  everyFiveMinutes = ->
    robot.messageRoom room, 'Vergeet de timesheets niet!'