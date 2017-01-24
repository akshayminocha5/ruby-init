# app.rb
require 'sinatra'
require './key_server_entity.rb'
require 'json'
$key_server = KeyServerEntity.new

Thread.new do
  while true do
    sleep 60
    $key_server.clean_job  # All blocked keys should get released automatically within 60 secs if E3 is not called.
  end
end

class KeyServerApp < Sinatra::Base
  get '/keys/?:num?' do
    num = Integer(params[:num])
    keys = $key_server.generate_bunch(num, 300, 30)
    keys.to_json
  end

  get '/key/get' do
    $key_server.get
    res = $key_server.get
    if !res.nil?
      res.to_json
    else
      status 404
      body 'No Keys are available'
    end
  end

  get '/key/release/:keyId' do
    key = params[:keyId]
    $key_server.release(key).to_json
  end

  get '/key/delete/:keyId' do
    key = params[:keyId]
    $key_server.delete(key).to_json
  end

  get '/key/refresh/:keyId' do
    key = params[:keyId]
    $key_server.refresh(key).to_json
  end
end