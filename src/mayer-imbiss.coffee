cheerio = require('cheerio')
leet = require('leet');
cool = require('cool-ascii-faces')

module.exports = (robot) ->

    robot.base_url = 'http://www.mayer-imbiss.de/index.htm'
    robot.burrito  = 'http://www.bayareaburrito.de/images/menue/BAB_v_menu.pdf'

    robot.hear /Wie lautet nochmal die Adresse von dem zweiten Metzger auf der Venloer/i, (msg) ->
        msg.emote "Guckst du: " + robot.base_url + " :D"

    robot.hear /Wieviel kosten die Burritos eigentlich?/i, (msg) ->
        msg.emote "Guckst du: " + robot.burrito + " :S"

    robot.hear /:S/i, (msg) ->
        msg.emote ":S"

    robot.respond /leet me (.*)/i, (msg) ->
        text = leet.convert(msg.match[1])
        msg.send(text)

    robot.hear /cool/i, (msg) ->
        msg.emote cool()

    robot.respond /cool/i, (msg) ->
        msg.send(cool())

    robot.respond /metzger/i, (msg) ->

        robot.http(robot.base_url)
            .get() (err, res, body) ->

                if res.statusCode isnt 200
                    msg.send "HTTP 200 erwartet... Die Erwartung wurde nicht erfüllt :S"
                    return

                $ = cheerio.load(body)

                resp = ''

                week = $('html body div#main center blockquote blockquote div center div.fo12 b')
                    .text()
                    .trim()
                    .replace(/\s+/g, ' ')

                resp += "\n" + week + "\n"
                resp += Array(week.length).join("=")

                table = $('html body div#main center blockquote blockquote div div table')

                $(table).find('tr').each (i,o) ->
                    $(o).find('td').each ->
                        val = $(this).text().trim()
                        if val isnt ''
                            if val in ['Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag']
                                resp += "\n\n" + val + "\n" + Array(val.length).join(".") + "\n"
                            else
                                resp += "\n" + val

                msg.send resp
