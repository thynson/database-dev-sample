
class UnimplementError extends Error

	constructor: (methodName)->
		super("#{methodName} need to be implemented")

module.exports = class Schema
	constructor: (@name)->

	###
	# A general function define the columns, indexes and relations
	# for this schema
	###
	define: (sequelize)->
		throw new UnimplementError 'Schema.define'

	###
	# Generator async function that perform create table, according
	# to result of #define function, you don't need to override this
	# function in most situation
	###
	create: (sequelize)->

		yield @define(sequelize).sync()

	###
	# Generator async function that perform destroy table
	###
	destroy: (sequelize)->
		yield sequelize.getQueryInterface().dropTable @name

	###
	# Generator async function that perform migration from previous
	# version
	###
	migrate: (sequelize)->
		yield from @create sequelize

	###
	# Generator async function that perform rollback to previous
	# version
	###
	rollback: (sequelize)->
		yield from @destroy sequelize

