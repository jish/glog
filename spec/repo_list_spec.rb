require File.dirname(__FILE__) + '/spec_helper'

require 'tmpdir'

describe RepoList do
  before(:all) do
    @base_dir = File.join(Dir.tmpdir, 'repo_test_dir')
    FileUtils.mkdir_p @base_dir
    %w(repo1.git repo2.git).each do |r|
      Grit::Repo.init_bare(File.join(@base_dir, r))
    end
    RepoList.base_dir @base_dir
  end

  it "should return an item for each repo" do
    RepoList.list.size.should == 2
  end

  it "should return Grit Repos" do
    RepoList.list.each { |r| r.should be_an_instance_of(Grit::Repo) }
  end

end
