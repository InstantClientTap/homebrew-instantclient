# A formula that installs the Instant Client Tools package.
class InstantclientTools < Formula
  desc "Oracle Instant Client Tools x64"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html"

  url "https://download.oracle.com/otn_software/mac/instantclient/193000/instantclient-tools-macos.x64-19.3.0.0.0dbru.zip"
  sha256 "b2bc474f98da13efdbc77fd05f559498cd8c08582c5b9038f6a862215de33f2c"

  option "with-basiclite", "Depend on instantclient-basiclite instead of instantclient-basic."

  depends_on "instantclient-basic" if build.without?("basiclite")
  depends_on "instantclient-basiclite" if build.with?("basiclite")

  def install
    lib.install Dir["*.dylib"]

    bins = %w[impdp expdp exp imp wrc sqlldr]
    if HOMEBREW_PREFIX.to_s != "/usr/local"
      bins.each do |bin_f|
        system DevelopmentTools.locate("install_name_tool"), "-add_rpath", HOMEBREW_PREFIX/"lib", bin_f
      end
    end
    bin.install bins
  end
end
