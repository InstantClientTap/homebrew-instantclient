# A formula that installs the Instant Client ODBC package.
class InstantclientOdbc < Formula
  desc "Oracle Instant Client ODBC x64"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html"

  url "https://download.oracle.com/otn_software/mac/instantclient/198000/instantclient-odbc-macos.x64-19.8.0.0.0dbru.zip"
  sha256 "4bafb93f875a2bffa75f0a0798e923e032241edc1dccee463a408223ad766d16"

  option "with-basiclite", "Depend on instantclient-basiclite instead of instantclient-basic."

  depends_on "instantclient-basic" if build.without?("basiclite")
  depends_on "instantclient-basiclite" if build.with?("basiclite")

  def install
    lib.install Dir["*.dylib*"]
  end
end
