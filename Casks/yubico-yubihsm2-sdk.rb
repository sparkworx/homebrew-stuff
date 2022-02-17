cask 'yubico-yubihsm2-sdk' do
  version '2021-04'
  sha256 '081dedd97cbdda5cde6cff2898d74cd78ba9a3f1af9d3225e92ade9669800c6d'

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
