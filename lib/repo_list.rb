class RepoList

  def self.add_directory(dir)
    repo = Grit::Repo.new(dir)
    repo_map[repo.glog_name] = repo
  end

  def self.list
    repo_map.values
  end

  def self.[](name)
    repo_map[name]
  end

  def self.repo_map
    @repo_map ||= {}
  end

end
