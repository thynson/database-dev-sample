
AccountSchema = require '../schema/account-v1'
Sequelize = require 'sequelize'
co = require 'co'

module.exports =
	up: co.wrap (args...)->
		sequelize = new Sequelize args...
		yield from AccountSchema.create(sequelize)

	down: co.wrap (args...)->
		sequelize = new Sequelize args...
		yield from AccountSchema.destroy(sequelize)
