# A formula that installs the Instant Client Basic Lite package.
class InstantclientBasiclite < Formula
  desc "Oracle Instant Client Basic Lite x64"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html"

  url "https://download.oracle.com/otn_software/mac/instantclient/198000/instantclient-basiclite-macos.x64-19.8.0.0.0dbru.zip"
  sha256 "82fcc280726dafad0254f31a5dc7361c8ebce18e5eb4ed676a4143dda8aab9af"

  conflicts_with "instantclient-basic"

  def install
    lib.install Dir["*.dylib*"]
  end
end
