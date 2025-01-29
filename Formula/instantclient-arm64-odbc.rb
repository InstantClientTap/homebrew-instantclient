# A formula that installs the Instant Client ODBC package.
class InstantclientArm64Odbc < Formula
  desc "Oracle Instant Client ODBC for Apple Silicon"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-arm64-downloads.html"

  url "https://download.oracle.com/otn_software/mac/instantclient/233023/instantclient-odbc-macos.arm64-23.3.0.23.09.dmg"
  sha256 "273a12747ee6241ef4f5c75710bc56ce981a3538ce661607ff02e4773280d8dd"

  option "with-basiclite", "Depend on instantclient-basiclite instead of instantclient-basic."

  depends_on "instantclient-arm64-basic" if build.without?("basiclite")
  depends_on "instantclient-arm64-basiclite" if build.with?("basiclite")

  def install
    lib.install Dir["*.dylib*"]
  end
end
