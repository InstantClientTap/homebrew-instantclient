require File.expand_path("../../Strategies/cache_wo_download", __FILE__)
require File.expand_path("../../instantclient-util", __FILE__)

# A formula that installs the Instant Client Basic package.
class InstantclientBasic < Formula
  desc "Oracle Instant Client Basic x64."
  homepage "http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html"

  url "http://download.oracle.com/otn/mac/instantclient/11204/instantclient-basic-macos.x64-11.2.0.4.0.zip",
      :using => CacheWoDownloadStrategy
  sha256 "6c079713ab0a65193f7bfcbad6c90e7806fa6634a3828052f8428e1533bb89d3"

  # Use files provided by basiclite except NLS data.
  depends_on "instantclient-basiclite"

  include InstantclientUtil

  def install
    # NLS data only.
    # All other files are same with basiclite.
    fix_oracle_lib_path("libociei.dylib")
    lib.install ["libociei.dylib"]
  end
end
