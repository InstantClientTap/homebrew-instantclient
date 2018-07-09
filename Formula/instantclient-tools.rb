require File.expand_path("../../Strategies/cache_wo_download", __FILE__)

# A formula that installs the Instant Client Tools package.
class InstantclientTools < Formula
  desc "Oracle Instant Client Tools x64"
  homepage "http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html"
  hp = homepage

  url "http://download.oracle.com/otn/mac/instantclient/122010/instantclient-tools-macos.x64-12.2.0.1.0-2.zip",
      :using => (Class.new(CacheWoDownloadStrategy) do
                   define_method :homepage do
                     hp
                   end
                 end)
  sha256 "dfd2d9a2721d2e2a90d8053a8e4c9d0c9a68e8d47c9c99e1b80e8fa1c2edb99c"

  def install
    if HOMEBREW_PREFIX.to_s != "/usr/local"
      system DevelopmentTools.locate("install_name_tool"), "-add_rpath", HOMEBREW_PREFIX/"lib", "tools"
    end
    lib.install Dir["*.dylib"]
    bin.install %w[impdp expdp exp imp wrc sqlldr]
  end
end
