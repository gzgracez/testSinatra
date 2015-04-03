require 'dm-core'
require 'dm-migrations'

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