# A formula that installs the Instant Client SQLPlus package.
class InstantclientSqlplus < Formula
  desc "Oracle Instant Client SQLPlus x64"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html"

  url "https://download.oracle.com/otn_software/mac/instantclient/193000/instantclient-sqlplus-macos.x64-19.3.0.0.0dbru.zip"
  sha256 "f7565c3cbf898b0a7953fbb0017c5edd9d11d1863781588b7caf3a69937a2e9e"

  option "with-basiclite", "Depend on instantclient-basiclite instead of instantclient-basic."

  depends_on "instantclient-basic" if build.without?("basiclite")
  depends_on "instantclient-basiclite" if build.with?("basiclite")

  def install
    if HOMEBREW_PREFIX.to_s != "/usr/local"
      system DevelopmentTools.locate("install_name_tool"), "-add_rpath", HOMEBREW_PREFIX/"lib", "sqlplus"
    end
    lib.install Dir["*.dylib"]
    bin.install ["sqlplus"]
  end
end
