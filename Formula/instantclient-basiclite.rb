require File.expand_path("../../Strategies/cache_wo_download", __FILE__)

# A formula that installs the Instant Client Basic Lite package.
class InstantclientBasiclite < Formula
  desc "Oracle Instant Client Basic Lite x64."
  homepage "http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html"

  url "http://download.oracle.com/otn/mac/instantclient/122010/instantclient-basiclite-macos.x64-12.2.0.1.0.zip",
      :using => CacheWoDownloadStrategy
  sha256 "299e0f97ef64a16454ee9ef094a4771cbbe07d7f93e495995da318010d4e2071"

  conflicts_with "instantclient-basic"

  def install
    lib.install Dir["*.dylib*"]
  end
end
