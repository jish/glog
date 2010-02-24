require File.dirname(__FILE__) + '/spec_helper'

require 'tmpdir'

describe RepoList do
  before(:all) do
    RepoList.repo_map.clear
    @base_dir = File.join(Dir.tmpdir, 'repo_test_dir')
    FileUtils.mkdir_p @base_dir
    %w(repo1.git repo2.git).each do |r|
      dir = File.join(@base_dir, r)
      Grit::Repo.init_bare dir
      RepoList.add_directory dir
    end
  end

  it "should return an item for each repo" do
    RepoList.list.size.should == 2
  end

  it "should return Grit Repos" do
    RepoList.list.each { |r| r.should be_an_instance_of(Grit::Repo) }
  end

  it "should return the repo for the name" do
    RepoList.list.should include(RepoList['repo1'])
  end

end
