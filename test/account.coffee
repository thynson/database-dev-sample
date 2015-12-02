


module.exports = ->
	it 'should create and destroy account', =>
		x = yield @sequelize.models['account'].create {}
		yield x.destroy()
