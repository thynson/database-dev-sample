
Sequelize = require 'sequelize'
co = require 'co'


module.exports = co.wrap (hostname, database, username, password)->
	sequelize = new Sequelize database, username, password,
		hostname: hostname
		dialect: 'postgres'
		define:
			freezeTableName: true
			underscored: true


	metadata = sequelize.define 'metadata',
		name:
			type: Sequelize.STRING(128)
			primaryKey: true
	yield sequelize.sync force: false
	return metadata


