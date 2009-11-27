require 'sinatra'
require 'grit'
require 'erb'

$: << File.join(File.dirname(__FILE__), 'lib')
require 'grit_ext/repo'
require 'repo_list'

RepoList.base_dir File.join(File.dirname(__FILE__), 'repos')

get '/' do
  erb :home
end

get '/:repo/commits' do
  @repo = RepoList[params[:repo]]
  @commits = @repo.commits('master', 10)
  erb :commits
end

get '/:repo/commits/:id' do
  @repo = RepoList[params[:repo]]
  @commit = @repo.commits(params[:id]).first
  erb :commit
end
