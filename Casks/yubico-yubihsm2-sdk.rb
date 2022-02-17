cask 'yubico-yubihsm2-sdk' do
  version '2021-12'
  sha256 '793146e9b8d3a7ac40dd1517cb36bbcc17b56b9d1e3db5d3eac98b969acf5449'

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
