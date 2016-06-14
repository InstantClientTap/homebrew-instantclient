require File.expand_path("../../Strategies/cache_wo_download", __FILE__)

# A formula that installs the Instant Client Basic Lite package.
class InstantclientBasiclite11 < Formula
  desc "Oracle Instant Client Basic Lite x64."
  homepage "http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html"

  url "http://download.oracle.com/otn/mac/instantclient/11204/instantclient-basiclite-macos.x64-11.2.0.4.0.zip",
      :using => CacheWoDownloadStrategy
  sha256 "d51c5fb67d1213c9b3c6301c6f73fe1bef45f78197e1bae7804df4c0abb468a7"

  version = "11.2.0.4.0"

  conflicts_with "instantclient-basic", because: "Differing versions of same formula"

  def install
    %w[libclntsh.dylib libocci.dylib].each do |dylib|
      ln_s "#{dylib}.11.1", dylib
    end
    lib.install Dir["*.dylib*"]
  end
end
