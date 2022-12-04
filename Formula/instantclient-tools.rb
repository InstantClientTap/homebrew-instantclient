# A formula that installs the Instant Client Tools package.
class InstantclientTools < Formula
  desc "Oracle Instant Client Tools x64"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html"

  url "https://download.oracle.com/otn/mac/instantclient/181000/instantclient-tools-macos.x64-18.1.0.0.0.zip"
  sha256 "027eba2291c5372d8e5b54a455b61fe05c6a19f056aa4eecd1e941efb0b39239"

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

    if MacOS.version >= :catalina
      bin.env_script_all_files(libexec, "DYLD_LIBRARY_PATH" => HOMEBREW_PREFIX/"lib")
    end
  end
end
