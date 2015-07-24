#Description:
#   proxyart
#
# Notes:
#   doyobot art :4oki: :3oki: SANOKI

module.exports = (robot) ->
  robot.hear /doyobot art ?(.*)/i, (msg) ->
    proxyartFullText = msg.match[0].split(' ')
    background = proxyartFullText[2]
    frontground = proxyartFullText[3]
    proxyartText = proxyartFullText[4]
    robot.logger.info msg.match[0]
    robot.logger.info proxyartFullText
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
