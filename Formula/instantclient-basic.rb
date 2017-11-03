require File.expand_path("../../Strategies/cache_wo_download", __FILE__)

# A formula that installs the Instant Client Basic package.
class InstantclientBasic < Formula
  desc "Oracle Instant Client Basic x64."
  homepage "http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html"

  url "http://download.oracle.com/otn/mac/instantclient/122010/instantclient-basic-macos.x64-12.2.0.1.0.zip",
      :using => CacheWoDownloadStrategy
  sha256 "04a84542b5bd0a04bc45445e220a67c959a8826ce987000270705f9a1d553157"

  conflicts_with "instantclient-basiclite"

  def install
    %w[libclntsh.dylib libocci.dylib].each do |dylib|
      ln_s "#{dylib}.12.1", dylib
    end
    lib.install Dir["*.dylib*"]
  end
end
