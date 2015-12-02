###
#	Example schema definetion for account v1
###
Schema = require './schema'
Sequelize = require 'sequelize'


COLUMNS =
	id:
		type: Sequelize.BIGINT,
		primaryKey: true,
		autoIncrement: true
	name:
		type: Sequelize.STRING(64),
		unique: 'unique_account_name',
		allowNull: true
		validate:
			is: /^[-a-zA-Z0-9.]{6,64}/

	secret: Sequelize.STRING(256),

	email:
		type: Sequelize.STRING(128),
		unique: 'unique_account_email',
		allowNull: true
		validate:
			isEmail:true
	weibo_id:
		type: Sequelize.STRING(64),
		unique: true,
		allowNull: true
	wechat_id:
		type: Sequelize.STRING(64),
		unique: true,
		allowNull: true
	phone_zone:
		type: Sequelize.STRING(8),
		unique: 'unique_account_phone',
		allowNull: true
	phone_number:
		type: Sequelize.STRING(12),
		unique: 'unique_account_phone',
		allowNull: true

###
# Schema class for Account
#
# #create and #destroy must be implmeented
# use implementation of#migrate and #revert from super class
###
class AccountSchema extends Schema

	constructor: ->
		super('account')

	define: (sequelize)->
		Sequelize = sequelize.Sequelize
		model = sequelize.define @name, COLUMNS


	destroy: (sequelize)->
		yield sequelize.getQueryInterface().dropTable @name


module.exports = new AccountSchema
