IC_BASIC_BINS = %w[adrci genezi uidrvci].freeze
IC_BASIC_LIBS = %w[
  fips.dylib
  legacy.dylib
  libclntsh.dylib
  libclntsh.dylib.10.1
  libclntsh.dylib.11.1
  libclntsh.dylib.12.1
  libclntsh.dylib.18.1
  libclntsh.dylib.19.1
  libclntsh.dylib.20.1
  libclntsh.dylib.21.1
  libclntsh.dylib.22.1
  libclntsh.dylib.23.1
  libclntshcore.dylib
  libclntshcore.dylib.12.1
  libclntshcore.dylib.18.1
  libclntshcore.dylib.19.1
  libclntshcore.dylib.20.1
  libclntshcore.dylib.21.1
  libclntshcore.dylib.22.1
  libclntshcore.dylib.23.1
  libnnz.dylib
  libocci.dylib
  libocci.dylib.10.1
  libocci.dylib.11.1
  libocci.dylib.12.1
  libocci.dylib.18.1
  libocci.dylib.19.1
  libocci.dylib.20.1
  libocci.dylib.21.1
  libocci.dylib.22.1
  libocci.dylib.23.1
  libociei.dylib
  libocijdbc23.dylib
  pkcs11.dylib
].freeze
IC_BASIC_JARS = %w[ojdbc8.jar ojdbc11.jar ucp.jar xstreams.jar].freeze

cask "oracle-instant-client-basic@23" do
  version "23.26.1.0.0"
  sha256 "5dc67a7e1cccd0a01d5bf53d7cf13b56f00999e3c2c1a309d8600cd766d80b41"

  url "https://download.oracle.com/otn_software/mac/instantclient/#{version.major}#{version.minor}#{version.to_s.split(".")[2]}00/instantclient-basic-macos.arm64-#{version}.dmg"
  name "Oracle Instant Client Basic (ARM)"
  desc "Oracle database client libraries for OCI, OCCI, and JDBC-OCI applications"
  homepage "https://www.oracle.com/database/technologies/instant-client.html"

  depends_on arch: :arm64

  ic_dir = "#{HOMEBREW_PREFIX}/instantclient_#{version.major}"

  artifact "network/admin/README", target: "#{ic_dir}/network/admin/README"

  IC_BASIC_BINS.each { |bin| artifact bin, target: "#{ic_dir}/#{bin}" }
  IC_BASIC_LIBS.each { |lib| artifact lib, target: "#{ic_dir}/#{lib}" }
  IC_BASIC_JARS.each { |jar| artifact jar, target: "#{ic_dir}/#{jar}" }
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
    symlink "instantclient_#{version.major}/fips.dylib", "lib/fips.dylib",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/legacy.dylib", "lib/legacy.dylib",
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
    symlink "instantclient_#{version.major}/libclntsh.dylib.20.1", "lib/libclntsh.dylib.20.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libclntsh.dylib.21.1", "lib/libclntsh.dylib.21.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libclntsh.dylib.22.1", "lib/libclntsh.dylib.22.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libclntsh.dylib.23.1", "lib/libclntsh.dylib.23.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libclntshcore.dylib", "lib/libclntshcore.dylib",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libclntshcore.dylib.12.1", "lib/libclntshcore.dylib.12.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libclntshcore.dylib.18.1", "lib/libclntshcore.dylib.18.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libclntshcore.dylib.19.1", "lib/libclntshcore.dylib.19.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libclntshcore.dylib.20.1", "lib/libclntshcore.dylib.20.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libclntshcore.dylib.21.1", "lib/libclntshcore.dylib.21.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libclntshcore.dylib.22.1", "lib/libclntshcore.dylib.22.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libclntshcore.dylib.23.1", "lib/libclntshcore.dylib.23.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libnnz.dylib", "lib/libnnz.dylib",
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
    symlink "instantclient_#{version.major}/libocci.dylib.20.1", "lib/libocci.dylib.20.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libocci.dylib.21.1", "lib/libocci.dylib.21.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libocci.dylib.22.1", "lib/libocci.dylib.22.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libocci.dylib.23.1", "lib/libocci.dylib.23.1",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libociei.dylib", "lib/libociei.dylib",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libocijdbc23.dylib", "lib/libocijdbc23.dylib",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/pkcs11.dylib", "lib/pkcs11.dylib",
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
