require File.expand_path("../../Strategies/cache_wo_download", __FILE__)

# A formula that installs the Instant Client SQLPlus package.
class InstantclientSqlplus11 < Formula
  desc "Oracle Instant Client SQLPlus x64."
  homepage "http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html"

  url "http://download.oracle.com/otn/mac/instantclient/11204/instantclient-sqlplus-macos.x64-11.2.0.4.0.zip",
      :using => CacheWoDownloadStrategy
  sha256 "127d2baaa4c72d8591af829f00dea5e2a77c0e272ce8fc091dd853e9406845b9"

  version = "11.2.0.4.0"

  option "with-basiclite", "Depend on instantclient-basiclite instead of instantclient-basic."

  conflicts_with "instantclient-sqlplus", because: "Differing versions of same formula"

  depends_on "instantclient-basic11" if build.without?("basiclite11")
  depends_on "instantclient-basiclite11" if build.with?("basiclite11")

  def install
    if HOMEBREW_PREFIX.to_s != "/usr/local"
      system MacOS.locate("install_name_tool"), "-add_rpath", HOMEBREW_PREFIX/"lib", "sqlplus"
    end
    lib.install Dir["*.dylib"]
    bin.install ["sqlplus"]
  end
end
