require File.expand_path("../../Strategies/cache_wo_download", __FILE__)

# A formula that installs the Instant Client SDK package.
class InstantclientSdk < Formula
  desc "Oracle Instant Client SDK x64."
  homepage "http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html"

  url "http://download.oracle.com/otn/mac/instantclient/121020/instantclient-sdk-macos.x64-12.1.0.2.0.zip",
      :using => CacheWoDownloadStrategy
  sha256 "63582d9a2f4afabd7f5e678c39bf9184d51625c61e67372acdbc7b42ed8530ac"

  def install
    # Ideally should go into includes but ruby-oci8 seems very picky...
    # include.install Dir["sdk/include/*.h"]
    lib.install ["sdk"]
  end
end
