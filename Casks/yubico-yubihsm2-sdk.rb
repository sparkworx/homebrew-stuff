cask 'yubico-yubihsm2-sdk' do
  version '1.0.2'
  sha256 'b71492fb97850ce7891424e91e63d0133d61641aead211c8f74aadbd42db08e2'

  url "https://developers.yubico.com/YubiHSM2/Releases/yubihsm2-sdk-#{version}-darwin-amd64.tar.gz"
  name 'Yubico YubiHSM 2 SDK'
  homepage 'https://developers.yubico.com/YubiHSM2/'

  binary 'yubihsm2-sdk/bin/yhwrap'
  binary 'yubihsm2-sdk/bin/yubihsm-connector'
  binary 'yubihsm2-sdk/bin/yubihsm-setup'
  binary 'yubihsm2-sdk/bin/yubihsm-shell'

end
