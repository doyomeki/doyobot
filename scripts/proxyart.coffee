# Description:
#   proxyart
#
# Notes:
#   doyobot proxyart :4oki: :3oki: SANOKI

module.exports = (robot) ->
  robot.hear /doyobot proxyart :(.*): :(.*): ?(.*)/i, (msg) ->
    if msg.match[1] == '4oki'
      background = 0
    else if msg.match[1] == '3oki'
      background = 1
    else
      background = 0

    if msg.match[2] == '4oki'
      frontground = 0
    else if msg.match[2] == '3oki'
      frontground = 1
    else
      frontground = 0
    proxyartText = msg.match[3]
    robot.logger.info msg.match[0]
    robot.http('https://texttobinary.herokuapp.com/proxyart')
      .query(
        text : proxyartText
        bg : background
        fg : frontground
        )
        .get() (err, res, body) ->
          if err
            msg.reply 'error proxyart'
          robot.logger.info body
          msg.send "#{body}"
