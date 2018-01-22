class CacheWoDownloadStrategy < CurlDownloadStrategy
  def initialize(*args)
    super
    @tarball_path = HOMEBREW_CACHE.join(filename)
  end

  def fetch
    unless cached_location.exist?
      odie <<~EOS
        The following file can not be downloaded automatically:
          #{@url}

        Please download it to the homebrew cache directory:
          #{HOMEBREW_CACHE}

        Creating a symlink also works:
          ln -sf /path/to/downloaded/#{filename} #{HOMEBREW_CACHE}/
      EOS
    end
    super
  end

  def filename
    @filename ||= File.basename(@url)
  end
end
