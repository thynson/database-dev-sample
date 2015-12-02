Umzug = require 'umzug'
path = require 'path'

module.exports = (sequelize, args...)->
	migration = sequelize.getQueryInterface()
	DataTypes = sequelize.constructor
	new Umzug
		storage: 'sequelize'
		storageOptions:
			sequelize: sequelize
			modelName: 'metadata'
			columnName: 'migration'
		migrations:
			params: [args...],
			path: path.resolve __dirname, './migrations'
			pattern: /^.*\.coffee$/




