# A formula that installs the Instant Client SDK package.
class InstantclientArm64Sdk < Formula
  desc "Oracle Instant Client SDK for Apple Silicon"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-arm64-downloads.html"

  url "https://download.oracle.com/otn_software/mac/instantclient/233023/instantclient-sdk-macos.arm64-23.3.0.23.09.dmg"
  sha256 "3deadfce089eb6b9c091b1fd213ed7a66685bb22643c7c74be5e050ad8cfccbb"

  def install
    lib.install ["sdk"]
    # Header files can not be moved out of sdk/include because some software
    # (e.g. ruby-oci8) expects to find them there. Link the header files
    # instead.
    Dir[lib.join("sdk/include/*.h")].each do |header_file|
      include.install_symlink header_file
    end
  end

  test do
    (testpath/"test.c").write <<~EOS
      #include <oci.h>

      int main()
      {
        ub4 od = OCI_DEFAULT;
        return 0;
      }
    EOS
    system ENV.cc, "test.c", "-I#{include}", "-o", "test"
    system "./test"
  end
end
