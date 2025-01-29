# A formula that installs the Instant Client Tools package.
class InstantclientArm64Tools < Formula
  desc "Oracle Instant Client Tools for Apple Silicon"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-arm64-downloads.html"

  url "https://download.oracle.com/otn_software/mac/instantclient/233023/instantclient-tools-macos.arm64-23.3.0.23.09-1.dmg"
  sha256 "800f926e05d7a58d764e27699e3073b74a16439ccb260eb0529ce949dfcde56e"

  option "with-basiclite", "Depend on instantclient-basiclite instead of instantclient-basic."

  depends_on "instantclient-arm64-basic" if build.without?("basiclite")
  depends_on "instantclient-arm64-basiclite" if build.with?("basiclite")

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
