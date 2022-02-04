cask 'yubico-yubihsm2-sdk' do
  version '2019-12'
  sha256 'f39c51f3ee55f30eecff5b4a9fa6fc097343cfbff255399f8e1c23a353aace33'

  url "https://developers.yubico.com/YubiHSM2/Releases/yubihsm2-sdk-#{version}-darwin-amd64.tar.gz"
  name 'Yubico YubiHSM 2 SDK'
  homepage 'https://developers.yubico.com/YubiHSM2/'

  binary 'yubihsm2-sdk/bin/yubihsm-connector'
  binary 'yubihsm2-sdk/bin/yubihsm-setup'
  binary 'yubihsm2-sdk/bin/yubihsm-shell'
  binary 'yubihsm2-sdk/bin/yubihsm-wrap'

end
