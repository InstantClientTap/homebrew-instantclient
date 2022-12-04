# A formula that installs the Instant Client SQLPlus package.
class InstantclientSqlplus < Formula
  desc "Oracle Instant Client SQLPlus x64"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html"

  url "https://download.oracle.com/otn/mac/instantclient/181000/instantclient-sqlplus-macos.x64-18.1.0.0.0.zip"
  sha256 "02e66dc52398fced75e7efcb6b4372afcf617f7d88344fb7f0f4bb2bed371f3b"

  option "with-basiclite", "Depend on instantclient-basiclite instead of instantclient-basic."

  depends_on "instantclient-basic" if build.without?("basiclite")
  depends_on "instantclient-basiclite" if build.with?("basiclite")

  def install
    if HOMEBREW_PREFIX.to_s != "/usr/local"
      system DevelopmentTools.locate("install_name_tool"), "-add_rpath", HOMEBREW_PREFIX/"lib", "sqlplus"
    end
    lib.install Dir["*.dylib"]
    bin.install ["sqlplus"]
    if MacOS.version >= :catalina
      bin.env_script_all_files(libexec, "DYLD_LIBRARY_PATH" => HOMEBREW_PREFIX/"lib")
    end
  end
end
