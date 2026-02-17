IC_TOOLS_BINS = %w[exp expdp imp impdp sqlldr wrc].freeze
IC_TOOLS_LIBS = %w[libnfsodm.dylib libopcodm.dylib].freeze

cask "oracle-instant-client-tools@23" do
  version "23.3.0.23.09"
  sha256 "800f926e05d7a58d764e27699e3073b74a16439ccb260eb0529ce949dfcde56e"

  url "https://download.oracle.com/otn_software/mac/instantclient/#{version.major}#{version.minor}0#{version.to_s.split('.')[3]}/instantclient-tools-macos.arm64-#{version}-1.dmg"
  name "Oracle Instant Client Tools (ARM)"
  desc "Oracle Data Pump, SQL*Loader, and Workload Replay Client"
  homepage "https://www.oracle.com/database/technologies/instant-client.html"

  depends_on arch: :arm64
  depends_on cask: "oracle-instant-client-basic@23"

  ic_dir = "#{HOMEBREW_PREFIX}/instantclient_#{version.major}"

  IC_TOOLS_BINS.each { |bin| artifact bin, target: "#{ic_dir}/#{bin}" }
  IC_TOOLS_LIBS.each { |lib| artifact lib, target: "#{ic_dir}/#{lib}" }

  postflight do
    IC_TOOLS_BINS.each do |bin|
      system_command "/bin/ln", args: ["-sf", "#{ic_dir}/#{bin}", "#{HOMEBREW_PREFIX}/bin/#{bin}"]
    end
    IC_TOOLS_LIBS.each do |lib|
      system_command "/bin/ln", args: ["-sf", "#{ic_dir}/#{lib}", "#{HOMEBREW_PREFIX}/lib/#{lib}"]
    end
  end

  uninstall_preflight do
    IC_TOOLS_BINS.each do |bin|
      system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/bin/#{bin}"]
    end
    IC_TOOLS_LIBS.each do |lib|
      system_command "/bin/rm", args: ["-f", "#{HOMEBREW_PREFIX}/lib/#{lib}"]
    end
  end
end
