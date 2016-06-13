require File.expand_path("../../Strategies/cache_wo_download", __FILE__)

# A formula that installs the Instant Client SDK package.
class InstantclientSdk11 < Formula
  desc "Oracle Instant Client SDK x64."
  homepage "http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html"

  url "http://download.oracle.com/otn/mac/instantclient/11204/instantclient-sdk-macos.x64-11.2.0.4.0.zip",
      :using => CacheWoDownloadStrategy
  sha256 "aead0663c206a811cf1f61d3b2a533ff81e6e6109dd31544ad850a7ef6eb5d19"

  version = "11.2.0.4.0"

  conflicts_with "instantclient-basic", because: "Differing versions of same formula"

  def install
    # Ideally should go into includes but ruby-oci8 seems very picky...
    # include.install Dir["sdk/include/*.h"]
    lib.install ["sdk"]
  end
end
