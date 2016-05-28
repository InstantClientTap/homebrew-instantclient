require File.expand_path("../../Strategies/cache_wo_download", __FILE__)

# A formula that installs the Instant Client Basic package.
class InstantclientBasic < Formula
  desc "Oracle Instant Client Basic x64."
  homepage "http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html"

  url "http://download.oracle.com/otn/mac/instantclient/121020/instantclient-basic-macos.x64-12.1.0.2.0.zip",
      :using => CacheWoDownloadStrategy
  sha256 "8c72abe1ee29c6f85c82851cfe5cdfc31bff09e162438aa755fc76f7a78bd1b6"

  conflicts_with "instantclient-basiclite"

  def install
    %w[libclntsh.dylib libocci.dylib].each do |dylib|
      ln_s "#{dylib}.12.1", dylib
    end
    lib.install Dir["*.dylib*"]
  end
end
