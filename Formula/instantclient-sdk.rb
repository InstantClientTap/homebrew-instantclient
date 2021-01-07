# A formula that installs the Instant Client SDK package.
class InstantclientSdk < Formula
  desc "Oracle Instant Client SDK x64"
  homepage "https://www.oracle.com/database/technologies/instant-client/macos-intel-x86-downloads.html"

  url "https://download.oracle.com/otn_software/mac/instantclient/198000/instantclient-sdk-macos.x64-19.8.0.0.0dbru.zip"
  sha256 "0fa8ae4c4418aa66ce875cf92e728dd7a81aeaf2e68e7926e102b5e52fc8ba4c"

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
