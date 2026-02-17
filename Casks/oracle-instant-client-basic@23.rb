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
  version "23.3.0.23.09"
  sha256 "ff6fcfb8e2a231a9e0eae858691fe854451b375e654adf4a62331981a60e9569"

  url "https://download.oracle.com/otn_software/mac/instantclient/#{version.major}#{version.minor}0#{version.to_s.split('.')[3]}/instantclient-basic-macos.arm64-#{version}-2.dmg"
  name "Oracle Instant Client Basic (ARM)"
  desc "Oracle database client libraries for OCI, OCCI, and JDBC-OCI applications"
  homepage "https://www.oracle.com/database/technologies/instant-client.html"

  depends_on arch: :arm64

  ic_dir = "#{HOMEBREW_PREFIX}/instantclient_#{version.major}"

  preflight do
    system_command "/bin/mkdir", args: ["-p", ic_dir], sudo: true
    system_command "/bin/bash",
                   args: ["-c", "/usr/sbin/chown $(stat -f '%Su:%Sg' '#{HOMEBREW_PREFIX}') '#{ic_dir}'"],
                   sudo: true
    system_command "/bin/mkdir", args: ["-p", "#{ic_dir}/network/admin"]
  end

  IC_BASIC_BINS.each { |bin| artifact bin, target: "#{ic_dir}/#{bin}" }
  IC_BASIC_LIBS.each { |lib| artifact lib, target: "#{ic_dir}/#{lib}" }
  IC_BASIC_JARS.each { |jar| artifact jar, target: "#{ic_dir}/#{jar}" }
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
    system_command "/usr/bin/find", args: [ic_dir, "-type", "d", "-empty", "-delete"]
  end

  zap trash: [ic_dir],
      rmdir: ["#{HOMEBREW_PREFIX}/share/oracle"]
end
