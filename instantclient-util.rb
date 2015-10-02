module InstantclientUtil
  ORACLE_LIBRARIES = [
    "libclntsh.dylib.11.1",
    "libnnz11.dylib",
    "libocci.dylib.11.1",
    "libociei.dylib",
    "libociicus.dylib",
    "libocijdbc11.dylib",
    "libsqlplus.dylib",
    "libsqlplusic.dylib",
  ]

  # Fix dependent Oracle library paths
  def fix_oracle_lib_path(file)
    file = Pathname.new(file)
    file.ensure_writable do
      if file.basename.to_s == ORACLE_LIBRARIES[0] # libclntsh.dylib
        system MacOS.locate("install_name_tool"), "-add_rpath",
                 HOMEBREW_PREFIX/"lib", file
      end
      file.dynamically_linked_libraries.each do |fname|
        next if fname[0] == "@"
        if ORACLE_LIBRARIES.include? File.basename(fname)
          system MacOS.locate("install_name_tool"), "-change", fname,
                 HOMEBREW_PREFIX/"lib"/File.basename(fname), file
        end
      end
    end
  end
end
