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
    expect(@robot.respond).to.have.been.calledWith(/metzger/)

  it 'registers a hear listener', ->
    expect(@robot.hear).to.have.been.calledWith(/Wie lautet nochmal die Adresse von dem zweiten Metzger auf der Venloer/i)