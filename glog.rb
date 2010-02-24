begin
  # Try to require the preresolved locked set of gems.
  require File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  # Fall back on doing an unlocked resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup
end
Bundler.require

require 'erb'

$: << File.join(File.dirname(__FILE__), 'lib')
require 'grit_ext/repo'
require 'repo_list'

set :root, File.dirname(__FILE__)

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
