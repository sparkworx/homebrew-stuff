cask 'yubico-yubihsm2-sdk' do
  version '1.0.3'
  sha256 '3424c14093d880eda6c445f265136bafbaaa526988036537b577e40e9c24d09f'

  url "https://developers.yubico.com/YubiHSM2/Releases/yubihsm2-sdk-#{version}-darwin-amd64.tar.gz"
  name 'Yubico YubiHSM 2 SDK'
  homepage 'https://developers.yubico.com/YubiHSM2/'

  binary 'yubihsm2-sdk/bin/yhwrap'
  binary 'yubihsm2-sdk/bin/yubihsm-connector'
  binary 'yubihsm2-sdk/bin/yubihsm-setup'
  binary 'yubihsm2-sdk/bin/yubihsm-shell'

end
