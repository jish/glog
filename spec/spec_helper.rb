require 'rubygems'

require File.join(File.dirname(__FILE__), '..', 'glog')

require 'sinatra'
require 'rack/test'
require 'spec'
require 'spec/autorun'
require 'spec/interop/test'

require 'tmpdir'

GLOG_DIR = File.expand_path(File.join(File.dirname(__FILE__), '..'))

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false
