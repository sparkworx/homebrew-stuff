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

  preflight do
    system_command "/bin/mkdir", args: ["-p", ic_dir], sudo: true
    system_command "/usr/sbin/chown", args: ["#{Process.uid}:#{Process.gid}", ic_dir], sudo: true
    system_command "/bin/mkdir", args: ["-p", "#{ic_dir}/network/admin"]
  end

  IC_BASIC_BINS.each { |bin| artifact bin, target: "#{ic_dir}/#{bin}" }
  IC_BASIC_LIBS.each { |lib| artifact lib, target: "#{ic_dir}/#{lib}" }
  artifact "network/admin/README", target: "#{ic_dir}/network/admin/README"

  postflight do
    IC_BASIC_BINS.each do |bin|
      system_command "/bin/ln", args: ["-sf", "#{ic_dir}/#{bin}", "#{HOMEBREW_PREFIX}/bin/#{bin}"]
    end
    IC_BASIC_LIBS.each do |lib|
      system_command "/bin/ln", args: ["-sf", "#{ic_dir}/#{lib}", "#{HOMEBREW_PREFIX}/lib/#{lib}"]
    end
    system_command "/bin/mkdir", args: ["-p", "#{HOMEBREW_PREFIX}/share/oracle"]
    system_command "/bin/ln", args: ["-sfn", "#{ic_dir}/network", "#{HOMEBREW_PREFIX}/share/oracle/network"]
  end

  uninstall_preflight do
    IC_BASIC_BINS.each do |bin|
      system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/bin/#{bin}"]
    end
    IC_BASIC_LIBS.each do |lib|
      system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/lib/#{lib}"]
    end
    system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/share/oracle/network"]
  end

  uninstall_postflight do
    system_command "/usr/bin/find", args: [ic_dir, "-type", "d", "-empty", "-delete"], sudo: true
  end

  zap trash: [ic_dir],
      rmdir: ["#{HOMEBREW_PREFIX}/share/oracle"]
end
