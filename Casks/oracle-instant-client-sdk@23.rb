cask "oracle-instant-client-sdk@23" do
  version "23.3.0.23.09"
  sha256 "3deadfce089eb6b9c091b1fd213ed7a66685bb22643c7c74be5e050ad8cfccbb"

  url "https://download.oracle.com/otn_software/mac/instantclient/#{version.major}#{version.minor}0#{version.to_s.split('.')[3]}/instantclient-sdk-macos.arm64-#{version}.dmg"
  name "Oracle Instant Client SDK (ARM)"
  desc "Oracle Instant Client headers and makefiles for development"
  homepage "https://www.oracle.com/database/technologies/instant-client.html"

  depends_on arch: :arm64
  depends_on cask: "oracle-instant-client-basic@23"

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
