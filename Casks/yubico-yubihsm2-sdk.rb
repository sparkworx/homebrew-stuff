cask 'yubico-yubihsm2-sdk' do
  version '2021-12c'
  sha256 '21a25b92f287414495125bce809d45e62c99c4e5dd8ebe75d20e30709678d40b'

  url "https://developers.yubico.com/YubiHSM2/Releases/yubihsm2-sdk-#{version}-darwin-universal.pkg"
  name 'Yubico YubiHSM 2 SDK'
  desc 'SDK and operational software for Yubico YubiHSM 2'
  homepage 'https://developers.yubico.com/YubiHSM2/'

  livecheck do
    url "https://developers.yubico.com/YubiHSM2/Releases/"
    strategy :page_match
    regex(/yubihsm2-sdk-(\d{4}-\d{2}[a-z]?)-darwin-universal/i)
  end

  pkg "yubihsm2-sdk-#{version}-darwin-universal.pkg"

  uninstall pkgutil: "com.yubico.yubihsm2-sdk"

end
