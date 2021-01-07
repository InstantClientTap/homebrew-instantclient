# A formula that installs the Instant Client Basic package.
class InstantclientBasic < Formula
  desc "Oracle Instant Client Basic x64"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html"

  url "https://download.oracle.com/otn_software/mac/instantclient/198000/instantclient-basic-macos.x64-19.8.0.0.0dbru.zip"
  sha256 "57ed4198f3a10d83cd5ddc2472c058d4c3b0b786246baebf6bbfc7391cc12087"

  conflicts_with "instantclient-basiclite"

  def install
    lib.install Dir["*.dylib*"]
  end
end
