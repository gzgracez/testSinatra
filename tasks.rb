require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

class Tasks
	include DataMapper::Resource
	property :id, Serial
	property :name, String
	property :details, String
end

DataMapper.finalize