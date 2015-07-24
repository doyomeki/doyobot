# Description:
#   Express proxyart
#
# Commands:
#   hubot proxyart me <text>
#   hubot proxyart me <text> <bg> <fg>
#
# Author:
#   @shiraco

class Proxyart
  proxyartme: (msg, text, bg=":white_circle:", fg=":black_circle:") ->
    request = msg.http("https://texttobinary.herokuapp.com/proxyart")
                          .query(text: text, bg: bg, fg: fg)
                          .get()
    request (err, res, body) ->
      return msg.send body

module.exports = (robot) ->
  proxyart = new Proxyart

  robot.respond /proxyart me (.+)/i, (msg) ->
    args = msg.match[1].split(' ')
    text = encodeURIComponent args[0]

    if args.length == 3
      bg = args[1]
      fg = args[2]
      msg.send proxyart.proxyartme(msg, text, bg, fg)

    else
      msg.send proxyart.proxyartme(msg, text)
