# A formula that installs the Instant Client ODBC package.
class InstantclientOdbc < Formula
  desc "Oracle Instant Client ODBC x64"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html"

  url "https://download.oracle.com/otn/mac/instantclient/181000/instantclient-odbc-macos.x64-18.1.0.0.0.zip"
  sha256 "5d0cdd7f9dd2e27affbc9b36ef9fc48e329713ecd36905fdd089366e365ae8a2"

  option "with-basiclite", "Depend on instantclient-basiclite instead of instantclient-basic."

  depends_on "instantclient-basic" if build.without?("basiclite")
  depends_on "instantclient-basiclite" if build.with?("basiclite")

  def install
    lib.install Dir["*.dylib*"]
  end
end
