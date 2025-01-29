# A formula that installs the Instant Client Basic package.
class InstantclientArm64Basic < Formula
  desc "Oracle Instant Client Basic for Apple Silicon"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-arm64-downloads.html"

  url "https://download.oracle.com/otn_software/mac/instantclient/233023/instantclient-basic-macos.arm64-23.3.0.23.09-1.dmg"
  sha256 "1bcddb583870f70c232d579edb8a32fd58497028a4eff1ad28ece0397ba8d7fe"

  conflicts_with "instantclient-arm64-basiclite"

  def install
    lib.install Dir["*.dylib*"]
  end
end
