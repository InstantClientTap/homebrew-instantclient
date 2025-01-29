# A formula that installs the Instant Client SQLPlus package.
class InstantclientArm64Sqlplus < Formula
  desc "Oracle Instant Client SQLPlus for Apple Silicon"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-arm64-downloads.html"

  url "https://download.oracle.com/otn_software/mac/instantclient/233023/instantclient-sqlplus-macos.arm64-23.3.0.23.09.dmg"
  sha256 "9213a399a13101bdebcd613027fa385ef44c42bba2330f9480b16db0e1a7d676"

  option "with-basiclite", "Depend on instantclient-basiclite instead of instantclient-basic."

  depends_on "instantclient-arm64-basic" if build.without?("basiclite")
  depends_on "instantclient-arm64-basiclite" if build.with?("basiclite")

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
