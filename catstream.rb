require 'rubygems'
require 'sinatra'
require 'instagram'
require 'bundler'
require 'tilt/haml'
require 'dotenv'

Bundler.require
Dotenv.load

Instagram.configure do |config|
  config.client_id = ENV["CLIENT_ID"]
  config.client_secret = ENV["CLIENT_SECRET"]
end

get "/" do
  @photos = Instagram.tag_recent_media('cats')
  haml :index
end
