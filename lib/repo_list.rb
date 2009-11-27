class RepoList
  def self.base_dir(dir=nil)
    @base_dir = dir if dir
    @base_dir
  end

  def self.list
    repo_map.values
  end

  def self.[](name)
    repo_map[name]
  end

  def self.repo_map
    unless @repo_map
      @repo_map = {}
      Dir[File.join(RepoList.base_dir, '*.git')].each do |p|
        r = Grit::Repo.new(p)
        @repo_map[r.glog_name] = r
      end
    end
    @repo_map
  end

end
