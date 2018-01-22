require File.expand_path("../../Strategies/cache_wo_download", __FILE__)

# A formula that installs the Instant Client Basic package.
class InstantclientBasic < Formula
  desc "Oracle Instant Client Basic x64."
  homepage "http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html"

  url "http://download.oracle.com/otn/mac/instantclient/122010/instantclient-basic-macos.x64-12.2.0.1.0-2.zip",
      :using => CacheWoDownloadStrategy
  sha256 "3ed3102e5a24f0da638694191edb34933309fb472eb1df21ad5c86eedac3ebb9"

  conflicts_with "instantclient-basiclite"

  def install
    lib.install Dir["*.dylib*"]
  end
end
