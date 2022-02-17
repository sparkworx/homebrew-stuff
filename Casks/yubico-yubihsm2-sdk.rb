cask 'yubico-yubihsm2-sdk' do
  version '2020-10'
  sha256 '4b6f10255a5af09df0ef042610a6323a352761cb9ddf3c05499c4acc848e95d6'

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
