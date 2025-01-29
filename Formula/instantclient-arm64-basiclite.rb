# A formula that installs the Instant Client Basic Lite package.
class InstantclientArm64Basiclite < Formula
  desc "Oracle Instant Client Basic Lite for Apple Silicon"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-arm64-downloads.html"

  url "https://download.oracle.com/otn_software/mac/instantclient/233023/instantclient-basiclite-macos.arm64-23.3.0.23.09-1.dmg"
  sha256 "5c0fb1748594d8beff9d0bf9c410436c1b9839ca2f8cb4150f759b23d84dde5d"

  conflicts_with "instantclient-arm64-basic"

  def install
    lib.install Dir["*.dylib*"]
  end
end
