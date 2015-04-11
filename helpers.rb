require 'rubygems'
require 'sinatra'
require 'erb'
require 'sass'
require 'sinatra/reloader' if development?
require 'sinatra/flash'

require 'dm-core'
require 'dm-migrations'