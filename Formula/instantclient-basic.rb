# A formula that installs the Instant Client Basic package.
class InstantclientBasic < Formula
  desc "Oracle Instant Client Basic x64"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html"

  url "https://download.oracle.com/otn_software/mac/instantclient/193000/instantclient-basic-macos.x64-19.3.0.0.0dbru.zip"
  sha256 "f4335c1d53e8188a3a8cdfb97494ff87c4d0f481309284cf086dc64080a60abd"

  conflicts_with "instantclient-basiclite"

  def install
    lib.install Dir["*.dylib*"]
  end
end
