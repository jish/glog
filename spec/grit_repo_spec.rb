require File.dirname(__FILE__) + '/spec_helper'

describe RepoList do
  context "When loading the glog repo" do
    before(:each) do
      @repo = Grit::Repo.new(GLOG_DIR)
    end
    it "provides the proper name" do
      @repo.glog_name.should == 'glog'
    end
  end

  context "When loading a bare repo" do
    before(:all) do
      @repo_dir = File.join(Dir.tmpdir, 'repo1.git')
      FileUtils.mkdir_p @repo_dir
      Grit::Repo.init_bare(@repo_dir)
    end

    before(:each) do
      @repo = Grit::Repo.new(@repo_dir)
    end

    it "provides the proper repo name" do
      @repo.glog_name.should == 'repo1'
    end

  end

end
