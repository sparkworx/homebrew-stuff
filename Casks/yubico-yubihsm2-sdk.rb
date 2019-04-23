cask 'yubico-yubihsm2-sdk' do
  version '2.0.0'
  sha256 '1f7adf2f15cd041b21ee878fd90957e562f77636af1af451c1b611e2d32073ce'

  url "https://developers.yubico.com/YubiHSM2/Releases/yubihsm2-sdk-#{version}-darwin-amd64.tar.gz"
  name 'Yubico YubiHSM 2 SDK'
  homepage 'https://developers.yubico.com/YubiHSM2/'

  binary 'yubihsm2-sdk/bin/yubihsm-connector'
  binary 'yubihsm2-sdk/bin/yubihsm-setup'
  binary 'yubihsm2-sdk/bin/yubihsm-shell'
  binary 'yubihsm2-sdk/bin/yubihsm-wrap'

end
