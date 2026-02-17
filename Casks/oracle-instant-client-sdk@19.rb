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

  postflight do
    system_command "/bin/ln", args: ["-sfn", "#{ic_dir}/sdk/include", "#{HOMEBREW_PREFIX}/include/oracle"]
    system_command "/bin/mkdir", args: ["-p", "#{HOMEBREW_PREFIX}/share/oracle/sdk"]
    system_command "/bin/ln", args: ["-sfn", "#{ic_dir}/sdk/demo", "#{HOMEBREW_PREFIX}/share/oracle/sdk/demo"]
    system_command "/bin/ln", args: ["-sfn", "#{ic_dir}/sdk/admin", "#{HOMEBREW_PREFIX}/share/oracle/sdk/admin"]
    system_command "/bin/ln", args: ["-sf", "#{ic_dir}/sdk/ottclasses.zip", "#{HOMEBREW_PREFIX}/share/oracle/sdk/ottclasses.zip"]
    system_command "/bin/ln", args: ["-sf", "#{ic_dir}/sdk/ott", "#{HOMEBREW_PREFIX}/bin/ott"]
  end

  uninstall_preflight do
    system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/include/oracle"]
    system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/share/oracle/sdk/demo"]
    system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/share/oracle/sdk/admin"]
    system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/share/oracle/sdk/ottclasses.zip"]
    system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/bin/ott"]
  end

  zap rmdir: ["#{HOMEBREW_PREFIX}/share/oracle/sdk"]
end
