# Description:
#   Voegt enkele functies toe met betrekking tot het projet De Lijn van VOP Groep 4.
#
#
# Configuration:
#   HUBOT_DELIJN_USER
#   HUBOT_DELIJN_PASS
#
# Commands:
#   hubot toon de bussen - toont alle bussen die in het systeem zitten
#   hubot toon de depots - toont alle depots die in het systeem zitten
#
# Author:
#   LanderN

username = process.env.HUBOT_DELIJN_USER
password = process.env.HUBOT_DELIJN_PASS

module.exports = (robot) ->  
    robot.respond /toon de bussen/i, (res) ->
        robot.http("https://"+username+":"+password+"@vopro4.ugent.be/dev/api/buses")
            .header('Accept', 'application/json')
            .get() (err, response, body) ->
              # err & response status checking code here
                data = null
                try
                    data = JSON.parse body
                    res.send "De API geeft deze " + data.length + " bussen:"
                    for bus in data
                        res.send "   - " + bus.busNumber + " (" + bus.busType.description + ")"
                catch error
                    res.reply "Ran into an error parsing JSON :("
                    return
    robot.respond /toon de depots/i, (res) ->
        robot.http("https://"+username+":"+password+"@vopro4.ugent.be/dev/api/depots")
            .header('Accept', 'application/json')
            .get() (err, response, body) ->
              # err & response status checking code here
                data = null
                try
                    data = JSON.parse body
                    res.send "De API geeft deze " + data.length + " depots:"
                    for depot in data
                        res.send "   - " + depot.name + " (" + depot.prefix + ")"
                catch error
                    res.reply "Ran into an error parsing JSON :("
                    return