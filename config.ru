require 'glog'

repo_dir = File.expand_path('../repos', __FILE__)
Dir["#{repo_dir}/*.git"].each { |dir| RepoList.add_directory(dir) }

run Sinatra::Application
