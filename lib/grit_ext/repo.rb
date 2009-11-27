class Grit::Repo
  def glog_name
    basename = File.basename(path, ".git")
    if basename == ".git"
      basename = File.basename(File.expand_path(File.join(path, '..')), ".git")
    end
    basename
  end
end
