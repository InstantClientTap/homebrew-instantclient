require File.expand_path("../../Strategies/cache_wo_download", __FILE__)

# A formula that installs the Instant Client SDK package.
class InstantclientSdk < Formula
  desc "Oracle Instant Client SDK x64."
  homepage "http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html"

  url "http://download.oracle.com/otn/mac/instantclient/122010/instantclient-sdk-macos.x64-12.2.0.1.0-2.zip",
      :using => CacheWoDownloadStrategy
  sha256 "e0befca9c4e71ebc9f444957ffa70f01aeeec5976ea27c40406471b04c34848b"

  def install
    # Ideally should go into includes but ruby-oci8 seems very picky...
    # include.install Dir["sdk/include/*.h"]
    lib.install ["sdk"]
  end
end
