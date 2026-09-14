cask "oracle-instant-client-sdk@19" do
  version "19.16.0.0.0"
  sha256 "0cee3fc7cc427d9503707459b9add0cc146b80c3487940ab6231bdcab702a0eb"

  url "https://download.oracle.com/otn_software/mac/instantclient/#{version.major}#{version.minor}000/instantclient-sdk-macos.x64-#{version}dbru.dmg"
  name "Oracle Instant Client SDK (Intel)"
  desc "Oracle Instant Client headers and makefiles for development"
  homepage "https://www.oracle.com/database/technologies/instant-client.html"

  depends_on arch: :x86_64
  depends_on cask: "oracle-instant-client-basic@19"

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
