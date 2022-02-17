cask 'yubico-yubihsm2-sdk' do
  version '2021-03'
  sha256 '61da2d2f9e755befd9e5dd40d77abf9cb0e0eabf189589f1128bb2d376c7456a'

  url "https://developers.yubico.com/YubiHSM2/Releases/yubihsm2-sdk-#{version}-darwin-amd64.pkg"
  name 'Yubico YubiHSM 2 SDK'
  desc 'SDK and operational software for Yubico YubiHSM 2'
  homepage 'https://developers.yubico.com/YubiHSM2/'

  livecheck do
    url "https://developers.yubico.com/YubiHSM2/Releases/"
    strategy :page_match
    regex(/yubihsm2-sdk-(\d{4}-\d{2}[a-z]?)-darwin-amd64/i)
  end

  pkg "yubihsm2-sdk-#{version}-darwin-amd64.pkg"

  uninstall pkgutil: "com.yubico.yubihsm2-sdk"

end
