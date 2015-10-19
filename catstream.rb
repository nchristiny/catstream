require 'rubygems'
require 'sinatra'
require 'instagram'
require 'bundler'
require 'haml'
require 'figaro'

Bundler.require

Instagram.configure do |config|
  config.client_id = ENV["client_id"]
  config.client_secret = ENV["client_secret"]
end

get "/" do
  @photos = Instagram.tag_recent_media('cats')
  haml :index
end
