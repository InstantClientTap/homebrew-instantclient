# This is a custom download strategy. It does not download anything, instead it
# instructs the user to manually download the required files.
#
# The instructions need to indicate the homepage to accept the licence which
# happens to be the homepage of the package. Homebrew does not make the homepage
# visible to the download strategy. Which is why this class is kind of an
# abstract class with the `homepage` method unimplemented. Formulas using this
# strategy need to derive from this class and implement the `homepage` method.
class CacheWoDownloadStrategy < CurlDownloadStrategy
  def initialize(*args)
    super
    @tarball_path = HOMEBREW_CACHE.join(filename)
  end

  def homepage
    raise ArgumentError,
          "You need to override the `homepage` method to return the homepage!"
  end

  def fetch
    unless cached_location.exist?
      odie <<~EOS
        The package file can not be downloaded automatically. Please sign in
        and accept the licence agreement on the Instant Client downloads page:

          #{homepage}

        Then manually download this file:

          #{@url}

        To the homebrew cache directory:

          #{HOMEBREW_CACHE}

        Creating a symlink also works:

          $ ln -sf /path/to/downloaded/#{filename} #{HOMEBREW_CACHE}/
      EOS
    end
    super
  end

  def filename
    @filename ||= File.basename(@url)
  end
end
