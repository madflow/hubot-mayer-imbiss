chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'mayer-imbiss', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/mayer-imbiss')(@robot)

  it 'registers a respond listener', ->
    expect(@robot.respond).to.have.been.calledWith(/metzger/i)

  it 'registers a respond listener leet extension', ->
    expect(@robot.respond).to.have.been.calledWith(/leet me (.*)/i)

  it 'registers a hear listener', ->
    expect(@robot.hear).to.have.been.calledWith(/Wie lautet nochmal die Adresse von dem zweiten Metzger auf der Venloer/i)

  it 'registers another hear listener', ->
    expect(@robot.hear).to.have.been.calledWith(/Wieviel kosten die Burritos eigentlich?/i)

  it 'registers very important hear listener', ->
    expect(@robot.hear).to.have.been.calledWith(/:S/i)
