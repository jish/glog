require 'sinatra'
require 'grit'
require 'erb'

get '/' do
  'Hello glog'
end

get '/commits' do
  repo = Grit::Repo.new('.')
  @commits = repo.commits('master', 10)
  erb :commits
end
