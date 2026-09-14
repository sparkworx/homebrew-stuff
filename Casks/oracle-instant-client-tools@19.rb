IC_TOOLS_BINS = %w[exp expdp imp impdp sqlldr wrc].freeze
IC_TOOLS_LIBS = %w[libnfsodm19.dylib].freeze

cask "oracle-instant-client-tools@19" do
  version "19.16.0.0.0"
  sha256 "b3b8fa1465b32ccd5fe8ed7356e0b1683bce8a89591cd27157348fbbc1b8fc1a"

  url "https://download.oracle.com/otn_software/mac/instantclient/#{version.major}#{version.minor}000/instantclient-tools-macos.x64-#{version}dbru.dmg"
  name "Oracle Instant Client Tools (Intel)"
  desc "Oracle Data Pump, SQL*Loader, and Workload Replay Client"
  homepage "https://www.oracle.com/database/technologies/instant-client.html"

  depends_on arch: :x86_64
  depends_on cask: "oracle-instant-client-basic@19"

  ic_dir = "#{HOMEBREW_PREFIX}/instantclient_#{version.major}"

  IC_TOOLS_BINS.each { |bin| artifact bin, target: "#{ic_dir}/#{bin}" }
  IC_TOOLS_LIBS.each { |lib| artifact lib, target: "#{ic_dir}/#{lib}" }

  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{HOMEBREW_PREFIX}}/instantclient_#{version.major}"],
        writable_paths: ["instantclient_#{version.major}"],
        writable_base:  :homebrew_prefix,
        must_succeed:   false
    symlink "instantclient_#{version.major}/exp", "bin/exp",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/expdp", "bin/expdp",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/imp", "bin/imp",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/impdp", "bin/impdp",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/sqlldr", "bin/sqlldr",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/wrc", "bin/wrc",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libnfsodm19.dylib", "lib/libnfsodm19.dylib",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
  end
end
