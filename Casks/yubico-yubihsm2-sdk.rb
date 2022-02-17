cask 'yubico-yubihsm2-sdk' do
  version '2021-08'
  sha256 '73e5d060042b625c150a9c1bf64863db46a3dc7976465cb2222b16dc0e9bbd8f'

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
