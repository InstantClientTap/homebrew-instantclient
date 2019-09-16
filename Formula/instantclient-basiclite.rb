# A formula that installs the Instant Client Basic Lite package.
class InstantclientBasiclite < Formula
  desc "Oracle Instant Client Basic Lite x64"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html"

  url "https://download.oracle.com/otn_software/mac/instantclient/193000/instantclient-basiclite-macos.x64-19.3.0.0.0dbru.zip"
  sha256 "d7897cef7ad672a5e355aa14e6a447f8e10570ec02a9a2c13b5d5d8272f00ea4"

  conflicts_with "instantclient-basic"

  def install
    lib.install Dir["*.dylib*"]
  end
end
