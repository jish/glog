class RepoList
  def self.base_dir(dir=nil)
    @base_dir = dir if dir
    @base_dir
  end

  def self.list
    Dir[File.join(RepoList.base_dir, '*.git')].map do |p|
      Grit::Repo.new(p)
    end
  end

end
