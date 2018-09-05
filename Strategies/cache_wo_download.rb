# This is a custom download strategy. It does not download anything, instead it
# instructs the user to manually download the required files.
#
# The instructions need to indicate the homepage to accept the licence which
# happens to be the homepage of the package. Homebrew does not make the homepage
# visible to the download strategy. Which is why this class is kind of an
# abstract class with the `homepage` method unimplemented. Formulas using this
# strategy need to derive from this class and implement the `homepage` method.
class CacheWoDownloadStrategy < AbstractFileDownloadStrategy
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

        To this location (a specific filename in homebrew cache directory):

          #{cached_location}

        An example command to rename and move the file into the homebrew cache:

          $ cd /path/to/downloads && mv #{filename} #{cached_location}

        Instead of renaming and moving you can create a symlink:

          $ cd /path/to/downloads && ln -sf $(PWD)/#{filename} #{cached_location}

        Then re-run the installation:

          $ brew install #{name}
      EOS
    end
    super
  end

  def filename
    @filename ||= File.basename(@url)
  end
end
