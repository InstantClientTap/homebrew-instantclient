require File.expand_path("../Strategies/cache_wo_download", __dir__)

# A formula that installs the Instant Client Basic package.
class InstantclientBasic11 < Formula
  desc "Oracle Instant Client Basic x64"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html"
  hp = homepage

  url "http://download.oracle.com/otn/mac/instantclient/11204/instantclient-basic-macos.x64-11.2.0.4.0.zip",
      :using => (Class.new(CacheWoDownloadStrategy) do
                   define_method :homepage do
                     hp
                   end
                 end)
  sha256 "6c079713ab0a65193f7bfcbad6c90e7806fa6634a3828052f8428e1533bb89d3"

  conflicts_with "instantclient-basiclite",
                 :because => "Differing versions of same formula"

  def install
    %w[libclntsh.dylib libocci.dylib].each do |dylib|
      ln_s "#{dylib}.11.1", dylib
    end
    lib.install Dir["*.dylib*"]
  end
end
