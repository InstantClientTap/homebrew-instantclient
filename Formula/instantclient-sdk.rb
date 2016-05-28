require File.expand_path("../../Strategies/cache_wo_download", __FILE__)

# A formula that installs the Instant Client SDK package.
class InstantclientSdk < Formula
  desc "Oracle Instant Client SDK x64."
  homepage "http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html"

  url "http://download.oracle.com/otn/mac/instantclient/121020/instantclient-sdk-macos.x64-12.1.0.2.0.zip",
      :using => CacheWoDownloadStrategy
  sha256 "0e6d7cd228d9dc40e98a012fc450b47ca39263815b8842c6ede0a033e39927fd"

  def install
    # Ideally should go into includes but ruby-oci8 seems very picky...
    # include.install Dir["sdk/include/*.h"]
    lib.install ["sdk"]
  end
end
