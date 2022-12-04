# A formula that installs the Instant Client Basic Lite package.
class InstantclientBasiclite < Formula
  desc "Oracle Instant Client Basic Lite x64"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html"

  url "https://download.oracle.com/otn/mac/instantclient/181000/instantclient-basiclite-macos.x64-18.1.0.0.0.zip"
  sha256 "027eba2291c5372d8e5b54a455b61fe05c6a19f056aa4eecd1e941efb0b39239"

  conflicts_with "instantclient-basic"

  def install
    lib.install Dir["*.dylib*"]
  end
end
