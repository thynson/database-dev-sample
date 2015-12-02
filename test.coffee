require 'co-mocha'
Sequelize = require 'sequelize'
migration = require './migration'
schema = require './schema'


describe 'Database unit test', ->

    sequelizeConfig = [
        'postgres://localhost/sampledb',
        define:
            schema: 'unit_testing'
    ]

    @sequelize = new Sequelize sequelizeConfig...
    migerator = migration @sequelize, sequelizeConfig...

    before =>
        yield @sequelize.createSchema 'unit_testing'
        yield migerator.up()

    after =>
        yield migerator.down()
        yield @sequelize.dropSchema 'unit_testing'

    includeTest = (filename)=>
        require filename
            .call @
    describe 'Model', =>
        before =>
            yield schema @sequelize


        includeTest './test/account'



