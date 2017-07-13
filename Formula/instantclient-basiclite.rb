require File.expand_path("../../Strategies/cache_wo_download", __FILE__)

# A formula that installs the Instant Client Basic Lite package.
class InstantclientBasiclite < Formula
  desc "Oracle Instant Client Basic Lite x64."
  homepage "http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html"

  url "http://download.oracle.com/otn/mac/instantclient/121020/instantclient-basiclite-macos.x64-12.1.0.2.0.zip",
      :using => CacheWoDownloadStrategy
  sha256 "c39d498fa6eb08d46014283a3a79bcaf63060cdbd0f58f97322da012350d4c39"

  conflicts_with "instantclient-basic"

  def install
    %w[libclntsh.dylib libocci.dylib].each do |dylib|
      ln_s "#{dylib}.12.1", dylib
    end
    lib.install Dir["*.dylib*"]
  end
end
