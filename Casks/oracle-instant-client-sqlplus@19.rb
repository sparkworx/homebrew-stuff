IC_SQLPLUS_BINS = %w[sqlplus].freeze
IC_SQLPLUS_LIBS = %w[libsqlplus.dylib libsqlplusic.dylib].freeze

cask "oracle-instant-client-sqlplus@19" do
  version "19.16.0.0.0"
  sha256 "d4a219be20b660dab6d5306280a2436e97c7e96e79efcfd3fc147a32441a697d"

  url "https://download.oracle.com/otn_software/mac/instantclient/#{version.major}#{version.minor}000/instantclient-sqlplus-macos.x64-#{version}dbru.dmg"
  name "Oracle Instant Client SQLPlus (Intel)"
  desc "Oracle SQL*Plus command-line interface for Oracle Database"
  homepage "https://www.oracle.com/database/technologies/instant-client.html"

  depends_on arch: :x86_64
  depends_on cask: "oracle-instant-client-basic@19"

  ic_dir = "#{HOMEBREW_PREFIX}/instantclient_#{version.major}"

  IC_SQLPLUS_BINS.each { |bin| artifact bin, target: "#{ic_dir}/#{bin}" }
  IC_SQLPLUS_LIBS.each { |lib| artifact lib, target: "#{ic_dir}/#{lib}" }
  artifact "glogin.sql", target: "#{ic_dir}/glogin.sql"

  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{HOMEBREW_PREFIX}}/instantclient_#{version.major}"],
        writable_paths: ["instantclient_#{version.major}"],
        writable_base:  :homebrew_prefix,
        must_succeed:   false
    symlink "instantclient_#{version.major}/sqlplus", "bin/sqlplus",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libsqlplus.dylib", "lib/libsqlplus.dylib",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libsqlplusic.dylib", "lib/libsqlplusic.dylib",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/glogin.sql", "share/oracle/glogin.sql",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
  end
end
