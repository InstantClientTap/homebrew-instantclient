require File.expand_path("../../Strategies/cache_wo_download", __FILE__)

# A formula that installs the Instant Client SDK package.
class InstantclientSdk < Formula
  desc "Oracle Instant Client SDK x64."
  homepage "http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html"

  url "http://download.oracle.com/otn/mac/instantclient/122010/instantclient-sdk-macos.x64-12.2.0.1.0.zip",
      :using => CacheWoDownloadStrategy
  sha256 "fe149f4febcdcd6b836a3ee68df958ff324ebd70e99d3bffdfd0652fe15b19dd"

  def install
    # Ideally should go into includes but ruby-oci8 seems very picky...
    # include.install Dir["sdk/include/*.h"]
    lib.install ["sdk"]
  end
end
