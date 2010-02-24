begin
  # Try to require the preresolved locked set of gems.
  require File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  # Fall back on doing an unlocked resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup
end
Bundler.require(:default, :test)

require File.join(File.dirname(__FILE__), '..', 'glog')

GLOG_DIR = File.expand_path(File.join(File.dirname(__FILE__), '..'))
RepoList.add_directory(GLOG_DIR)

require 'spec'
require 'spec/autorun'
require 'spec/interop/test'

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false
