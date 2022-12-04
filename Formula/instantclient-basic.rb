# A formula that installs the Instant Client Basic package.
class InstantclientBasic < Formula
  desc "Oracle Instant Client Basic x64"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html"

  url "https://download.oracle.com/otn_software/mac/instantclient/181000/instantclient-basic-macos.x64-18.1.0.0.0.zip"
  sha256 "fac3cdaaee7526f6c50ff167edb4ba7ab68efb763de24f65f63fb48cc1ba44c0"

  conflicts_with "instantclient-basiclite"

  def install
    lib.install Dir["*.dylib*"]
  end
end
