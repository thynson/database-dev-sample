
# Setting up environment
* Install PostgreSQL, for example via Homebrew.
	```
	brew install postgresql
	ln -sfv /usr/local/opt/postgres/*.plist  /Library/LaunchAgents
	launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

	createdb sampledb
	```

# Adding new model
Each time you want to define a new model, you should

1. Define its schema
	Here schema means the columns, indexes and relationship between other
	schema, not the meaning of schema in Postgres world. see `schema/account-v1.coffee`

	Your schema file should include be postfixed with a revision number.
	When you schema is changed, write a new schema file, and keep the old one
	there. The one is still useful for migration tasks.

	Since you are adding new model, you just need to write override
	`Schema.define` method.

2. Writing migration task

	See `migrations/20151201-001-create-table-account.coffee`.

3. Writing simple test for this model

	Write a simple unit test for this model no matter how simple it is.
	This simple test may help you debug your migration task.

# Updating an existing model
When you want to update an existing model, you should

1. Define the new version schema and keep the old version

	Your should create a new schema file, e.g. `schema/account-v2`,
	changing the require pathname from `schema/account-v1.coffee` to
	`schema/account-v2` **except for files related to migration**.

	Since you are updating a new schema, you need to override
	`Schema.migrate` and `Schema.rollback` method and properly write the
	operation that change the schema to new version from old as well as
	the corresponding rollback operation.

2. Writing migeration task

	In most situation, it should be as same as what you do when adding a new model



