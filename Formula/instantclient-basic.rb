require File.expand_path("../../Strategies/cache_wo_download", __FILE__)

# A formula that installs the Instant Client Basic package.
class InstantclientBasic < Formula
  desc "Oracle Instant Client Basic x64."
  homepage "http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html"

  url "http://download.oracle.com/otn/mac/instantclient/121020/instantclient-basic-macos.x64-12.1.0.2.0.zip",
      :using => CacheWoDownloadStrategy
  sha256 "ecbf84ff011fcd8981c2cd9355f958ee42b2e452ebaad2d42df7b226903679cf"

  conflicts_with "instantclient-basiclite"

  def install
    %w[libclntsh.dylib libocci.dylib].each do |dylib|
      ln_s "#{dylib}.12.1", dylib
    end
    lib.install Dir["*.dylib*"]
  end
end
