IC_TOOLS_BINS = %w[exp expdp imp impdp sqlldr wrc].freeze
IC_TOOLS_LIBS = %w[libnfsodm.dylib libopcodm.dylib].freeze

cask "oracle-instant-client-tools@23" do
  version "23.26.1.0.0"
  sha256 "76587115ec6aa691ce44ab41b11febee72e13fb49b4d03225fb52776c7c38e34"

  url "https://download.oracle.com/otn_software/mac/instantclient/#{version.major}#{version.minor}#{version.to_s.split(".")[2]}00/instantclient-tools-macos.arm64-#{version}.dmg"
  name "Oracle Instant Client Tools (ARM)"
  desc "Oracle Data Pump, SQL*Loader, and Workload Replay Client"
  homepage "https://www.oracle.com/database/technologies/instant-client.html"

  depends_on arch: :arm64
  depends_on cask: "oracle-instant-client-basic@23"

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
    symlink "instantclient_#{version.major}/libnfsodm.dylib", "lib/libnfsodm.dylib",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/libopcodm.dylib", "lib/libopcodm.dylib",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
  end
end
