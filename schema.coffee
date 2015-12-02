

module.exports = (sequelize, opt...)->

	require('./schema/account-v1').define sequelize
	yield sequelize.sync opt...

