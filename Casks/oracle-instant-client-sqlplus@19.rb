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

  postflight do
    IC_SQLPLUS_BINS.each do |bin|
      system_command "/bin/ln", args: ["-sf", "#{ic_dir}/#{bin}", "#{HOMEBREW_PREFIX}/bin/#{bin}"]
    end
    IC_SQLPLUS_LIBS.each do |lib|
      system_command "/bin/ln", args: ["-sf", "#{ic_dir}/#{lib}", "#{HOMEBREW_PREFIX}/lib/#{lib}"]
    end
    system_command "/bin/mkdir", args: ["-p", "#{HOMEBREW_PREFIX}/share/oracle"]
    system_command "/bin/ln", args: ["-sf", "#{ic_dir}/glogin.sql", "#{HOMEBREW_PREFIX}/share/oracle/glogin.sql"]
  end

  uninstall_preflight do
    IC_SQLPLUS_BINS.each do |bin|
      system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/bin/#{bin}"]
    end
    IC_SQLPLUS_LIBS.each do |lib|
      system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/lib/#{lib}"]
    end
    system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/share/oracle/glogin.sql"]
  end
end
