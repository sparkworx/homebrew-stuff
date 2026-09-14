IC_BASIC_BINS = %w[adrci genezi uidrvci].freeze
IC_BASIC_LIBS = %w[
  libclntsh.dylib
  libclntsh.dylib.10.1
  libclntsh.dylib.11.1
  libclntsh.dylib.12.1
  libclntsh.dylib.18.1
  libclntsh.dylib.19.1
  libclntshcore.dylib.19.1
  libnnz19.dylib
  libocci.dylib
  libocci.dylib.10.1
  libocci.dylib.11.1
  libocci.dylib.12.1
  libocci.dylib.18.1
  libocci.dylib.19.1
  libociei.dylib
  libocijdbc19.dylib
  liboramysql19.dylib
].freeze

cask "oracle-instant-client-basic@19" do
  version "19.16.0.0.0"
  sha256 "725eeb7c00041e926b57c3db508ea7439a1935a37f480c0ac6d46eddc4205331"

  url "https://download.oracle.com/otn_software/mac/instantclient/#{version.major}#{version.minor}000/instantclient-basic-macos.x64-#{version}dbru.dmg"
  name "Oracle Instant Client Basic (Intel)"
  desc "Oracle database client libraries for OCI, OCCI, and JDBC-OCI applications"
  homepage "https://www.oracle.com/database/technologies/instant-client.html"

  depends_on arch: :x86_64

  ic_dir = "#{HOMEBREW_PREFIX}/instantclient_#{version.major}"

  artifact "network/admin/README", target: "#{ic_dir}/network/admin/README"

  IC_BASIC_BINS.each { |bin| artifact bin, target: "#{ic_dir}/#{bin}" }
  IC_BASIC_LIBS.each { |lib| artifact lib, target: "#{ic_dir}/#{lib}" }
  preflight_steps do
    mkdir_p "instantclient_#{version.major}/network/admin", base: :homebrew_prefix
  end

  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{HOMEBREW_PREFIX}}/instantclient_#{version.major}"],
        writable_paths: ["instantclient_#{version.major}"],
        writable_base:  :homebrew_prefix,
        must_succeed:   false
    symlink "instantclient_#{version.major}/adrci", "bin/adrci",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/genezi", "bin/genezi",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/uidrvci", "bin/uidrvci",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libclntsh.dylib", "lib/libclntsh.dylib",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libclntsh.dylib.10.1", "lib/libclntsh.dylib.10.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libclntsh.dylib.11.1", "lib/libclntsh.dylib.11.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libclntsh.dylib.12.1", "lib/libclntsh.dylib.12.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libclntsh.dylib.18.1", "lib/libclntsh.dylib.18.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libclntsh.dylib.19.1", "lib/libclntsh.dylib.19.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libclntshcore.dylib.19.1", "lib/libclntshcore.dylib.19.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libnnz19.dylib", "lib/libnnz19.dylib",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libocci.dylib", "lib/libocci.dylib",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libocci.dylib.10.1", "lib/libocci.dylib.10.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libocci.dylib.11.1", "lib/libocci.dylib.11.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libocci.dylib.12.1", "lib/libocci.dylib.12.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libocci.dylib.18.1", "lib/libocci.dylib.18.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libocci.dylib.19.1", "lib/libocci.dylib.19.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libociei.dylib", "lib/libociei.dylib",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libocijdbc19.dylib", "lib/libocijdbc19.dylib",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/liboramysql19.dylib", "lib/liboramysql19.dylib",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/network", "share/oracle/network",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
  end

  uninstall_postflight_steps do
    run "/usr/bin/find",
        args:           ["{{HOMEBREW_PREFIX}}/instantclient_#{version.major}", "-type", "d", "-empty", "-delete"],
        writable_paths: ["instantclient_#{version.major}"],
        writable_base:  :homebrew_prefix,
        must_succeed:   false
  end

  zap trash: ic_dir,
      rmdir: "#{HOMEBREW_PREFIX}/share/oracle"
end
