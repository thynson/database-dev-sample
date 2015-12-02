
class UnimplementError extends Error

	constructor: (methodName)->
		super("#{methodName} need to be implemented")

module.exports = class Schema
	constructor: (@name)->

	define: (sequelize)->
		throw new UnimplementError 'Schema.define'

	create: (sequelize)->

		yield @define(sequelize).sync()

	destroy: (sequelize)->
		yield sequelize.getQueryInterface().dropTable @name

	migrate: (sequelize)->

		yield from @create sequelize

	rollback: (sequelize)->

		yield from @destroy sequelize

