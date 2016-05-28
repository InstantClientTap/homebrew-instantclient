require File.expand_path("../../Strategies/cache_wo_download", __FILE__)

# A formula that installs the Instant Client SQLPlus package.
class InstantclientSqlplus < Formula
  desc "Oracle Instant Client SQLPlus x64."
  homepage "http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html"

  url "http://download.oracle.com/otn/mac/instantclient/121020/instantclient-sqlplus-macos.x64-12.1.0.2.0.zip",
      :using => CacheWoDownloadStrategy
  sha256 "8eb5bc4da372c6d58de3b3af30a5736a392278272ea04d4400e0b3926a9bf6b8"

  option "with-basiclite", "Depend on instantclient-basiclite instead of instantclient-basic."

  depends_on "instantclient-basic" unless build.with?("basiclite")
  depends_on "instantclient-basiclite" if build.with?("basiclite")

  def install
    if HOMEBREW_PREFIX.to_s != "/usr/local"
      system MacOS.locate("install_name_tool"), "-add_rpath", HOMEBREW_PREFIX/"lib", "sqlplus"
    end
    lib.install Dir["*.dylib"]
    bin.install ["sqlplus"]
  end
end
