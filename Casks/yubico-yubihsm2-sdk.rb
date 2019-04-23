cask 'yubico-yubihsm2-sdk' do
  version '2019-03'
  sha256 '3691ce34b98de58de322b891c0177f8d57d801be5f4a9a160b2a8c8213ebf78f'

  url "https://developers.yubico.com/YubiHSM2/Releases/yubihsm2-sdk-#{version}-darwin-amd64.tar.gz"
  name 'Yubico YubiHSM 2 SDK'
  homepage 'https://developers.yubico.com/YubiHSM2/'

  binary 'yubihsm2-sdk/bin/yubihsm-connector'
  binary 'yubihsm2-sdk/bin/yubihsm-setup'
  binary 'yubihsm2-sdk/bin/yubihsm-shell'
  binary 'yubihsm2-sdk/bin/yubihsm-wrap'

end
