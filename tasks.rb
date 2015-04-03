require 'dm-core'
require 'dm-migrations'

configure :development do
	DataMapper.setup(:default, "sqlite3://#{Dir.pwd}/development.db")
end

class Tasks
	include DataMapper::Resource
	property :id, Serial
	property :name, String
	property :date, Date
	property :details, String
end

def date=date
    super Date.strptime(date, '%m/%d/%Y')
end

DataMapper.finalize