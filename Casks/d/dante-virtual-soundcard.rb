cask "dante-virtual-soundcard" do
  version "4.5.2.3"
  sha256 "8d23b26a1b8b6601f4c5dc370bfcfea7558ec18c297992306830d0205d571a1c"

  url "https://audinate-software-updates.sgp1.cdn.digitaloceanspaces.com/DanteVirtualSoundcard/#{version.major}/#{version.major_minor}/macOS/DVS-#{version}_macos.dmg"
  name "Dante Virtual Soundcard"
  desc "Virtual audio driver for Dante audio networking"
  homepage "https://www.audinate.com/products/software/dante-virtual-soundcard"

  pkg "DanteVirtualSoundcard.pkg"

  uninstall pkgutil: "com.audinate.dante.pkg.dvs.*"

  caveats do
    reboot
  end
end
