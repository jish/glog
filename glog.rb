require 'sinatra'
require 'grit'
require 'erb'

get '/' do
  erb 'Hello glog'
end

get '/commits' do
  repo = Grit::Repo.new('.')
  @commits = repo.commits('master', 10)
  erb :commits
end

get '/commits/:id' do
  repo = Grit::Repo.new('.')
  @commit = repo.commits(params[:id]).first
  erb :commit
end
