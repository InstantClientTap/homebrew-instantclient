require File.expand_path("../../Strategies/cache_wo_download", __FILE__)
require File.expand_path("../../instantclient-util", __FILE__)

# A formula that installs the Instant Client SQLPlus package.
class InstantclientSqlplus < Formula
  desc "Oracle Instant Client SQLPlus x64."
  homepage "http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html"

  url "http://download.oracle.com/otn/mac/instantclient/11204/instantclient-sqlplus-macos.x64-11.2.0.4.0.zip",
      :using => CacheWoDownloadStrategy
  sha256 "127d2baaa4c72d8591af829f00dea5e2a77c0e272ce8fc091dd853e9406845b9"

  option "with-basiclite", "Depend on instantclient-basiclite instead of instantclient-basic."

  depends_on "instantclient-basic" unless build.with?("basiclite")
  depends_on "instantclient-basiclite" if build.with?("basiclite")

  include InstantclientUtil

  def install
    Dir["*.dylib"].each do |file|
      fix_oracle_lib_path(file)
    end
    fix_oracle_lib_path("sqlplus")
    lib.install Dir["*.dylib"]
    bin.install ["sqlplus"]
  end
end
