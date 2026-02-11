class YubihsmSetup < Formula
  desc "Yubico YubiHSM Setup Tool"
  homepage "https://developers.yubico.com/yubihsm-setup/"
  url "https://github.com/Yubico/yubihsm-setup/archive/refs/tags/2.3.4.tar.gz"
  sha256 "0245b24031aa6ab1ffcf094adfcfe9c3ed19b0c10b341346b4b74c6ec4620292"
  license "Apache-2.0"

  depends_on "pkg-config" => :build
  depends_on "rust" => :build
  depends_on "sparkworx/stuff/yubihsm-shell"

  resource "yubihsmrs" do
    url "https://github.com/Yubico/yubihsmrs/archive/refs/tags/2.1.4.tar.gz"
    sha256 "51fbc09b1fd2232e99e73971d5503b66608d757f55fe5e12db1597cdeafd787c"
  end

  def install
    resource("yubihsmrs").stage(buildpath/"yubihsmrs")
    inreplace "Cargo.toml", 'path = "../yubihsmrs/"', 'path = "yubihsmrs/"'
    system "cargo", "install", *std_cargo_args
  end

  def caveats
    <<~EOS
      This formula may conflict with the yubihsm2-sdk cask, which installs
      the same components via Yubico's installer package. If you have the
      cask installed, run: brew uninstall --cask yubihsm2-sdk
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/yubihsm-setup --version")
  end
end
