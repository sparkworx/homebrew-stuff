class YubihsmConnector < Formula
  desc "Yubico YubiHSM Connector"
  homepage "https://developers.yubico.com/yubihsm-connector/"
  url "https://github.com/Yubico/yubihsm-connector/archive/refs/tags/3.0.5.tar.gz"
  sha256 "5617cfac2d66bcd75ecf33e5338e2df1a1caa84528cae1765dc496ac44f7ba30"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "libusb"

  def install
    system "go", "get", "github.com/google/gousb"
    system "go", "generate"
    system "go", "build", *std_go_args
    bin.install
  end

  test do
    assert_match "__yubihsm-connector_init_completion()", shell_output("#{bin}/yubihsm-connector completion bash")
  end
end
