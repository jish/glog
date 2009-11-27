require 'sinatra'
require 'grit'
require 'erb'

$: << File.join(File.dirname(__FILE__), 'lib')
require 'grit_ext/repo'
require 'repo_list'

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
