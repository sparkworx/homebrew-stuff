cask "oracle-instant-client-sdk@23" do
  version "23.26.1.0.0"
  sha256 "6a101a8c6651a76055a3222b1860dcdabdc7c14c82759daa8ca11c5d13c8d1eb"

  url "https://download.oracle.com/otn_software/mac/instantclient/#{version.major}#{version.minor}#{version.to_s.split(".")[2]}00/instantclient-sdk-macos.arm64-#{version}.dmg"
  name "Oracle Instant Client SDK (ARM)"
  desc "Oracle Instant Client headers and makefiles for development"
  homepage "https://www.oracle.com/database/technologies/instant-client.html"

  depends_on arch: :arm64
  depends_on cask: "oracle-instant-client-basic@23"

  ic_dir = "#{HOMEBREW_PREFIX}/instantclient_#{version.major}"

  artifact "sdk", target: "#{ic_dir}/sdk"

  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{HOMEBREW_PREFIX}}/instantclient_#{version.major}/sdk"],
        writable_paths: ["instantclient_#{version.major}/sdk"],
        writable_base:  :homebrew_prefix,
        must_succeed:   false
    symlink "instantclient_#{version.major}/sdk/include", "include/oracle",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/sdk/demo", "share/oracle/sdk/demo",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/sdk/admin", "share/oracle/sdk/admin",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/sdk/ottclasses.zip", "share/oracle/sdk/ottclasses.zip",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
    symlink "instantclient_#{version.major}/sdk/ott", "bin/ott",
            source_base: :homebrew_prefix, target_base: :homebrew_prefix, overwrite: true, remove_on_uninstall: true
  end

  zap rmdir: "#{HOMEBREW_PREFIX}/share/oracle/sdk"
end
