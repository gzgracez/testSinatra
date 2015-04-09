require 'dm-core'
require 'dm-migrations'

DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")

class Tasks
	include DataMapper::Resource
	property :id, Serial
	property :name, String
	property :date, Date
	property :details, String

	def date=date
	    super Date.strptime(date, '%m/%d/%Y')
	end
end

DataMapper.finalize