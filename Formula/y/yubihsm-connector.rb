class YubihsmConnector < Formula
  desc "Yubico YubiHSM Connector"
  homepage "https://developers.yubico.com/yubihsm-connector/"
  url "https://github.com/Yubico/yubihsm-connector/archive/refs/tags/3.0.7.tar.gz"
  sha256 "2127b754afb3b191fb71e536c2c160a0e6975dad48b3d469c0e3f3290c0ee31c"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on "pkgconf" => :build
  depends_on "libusb"

  def install
    inreplace "go.mod", "github.com/google/gousb v1.1.2", "github.com/google/gousb v1.1.3"
    inreplace "go.sum" do |s|
      s.gsub! "github.com/google/gousb v1.1.2 h1:1BwarNB3inFTFhPgUEfah4hwOPuDz/49I0uX8XNginU=",
              "github.com/google/gousb v1.1.3 h1:xt6M5TDsGSZ+rlomz5Si5Hmd/Fvbmo2YCJHN+yGaK4o="
      s.gsub! "github.com/google/gousb v1.1.2/go.mod",
              "github.com/google/gousb v1.1.3/go.mod"
    end
    system "go", "generate"
    system "go", "build", *std_go_args(ldflags: "-s -w"), "-o", bin/"yubihsm-connector"
  end

  def caveats
    <<~EOS
      This formula may conflict with the yubihsm2-sdk cask, which installs
      the same components via Yubico's installer package. If you have the
      cask installed, run: brew uninstall --cask yubihsm2-sdk
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yubihsm-connector version")
  end
end
