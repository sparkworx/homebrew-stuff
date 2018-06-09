cask 'yubico-yubihsm2-sdk' do
  version '1.0.4'
  sha256 '8526e02dd3ecbd6ec7e536dff084d5bb3870842db567f57600eb409739eada8f'

  url "https://developers.yubico.com/YubiHSM2/Releases/yubihsm2-sdk-#{version}-darwin-amd64.tar.gz"
  name 'Yubico YubiHSM 2 SDK'
  homepage 'https://developers.yubico.com/YubiHSM2/'

  binary 'yubihsm2-sdk/bin/yhwrap'
  binary 'yubihsm2-sdk/bin/yubihsm-connector'
  binary 'yubihsm2-sdk/bin/yubihsm-setup'
  binary 'yubihsm2-sdk/bin/yubihsm-shell'

end
