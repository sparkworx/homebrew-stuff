class YubihsmManager < Formula
  desc "Interactive CLI with guided menus for YubiHSM 2 management"
  homepage "https://github.com/Yubico/yubihsm-manager"
  url "https://github.com/Yubico/yubihsm-manager/archive/refs/tags/1.0.0.tar.gz"
  sha256 "cd9b077d18863680c0ef3cee93b0b3b6d5f50869b2e3760aa251d661c4421fed"
  license "Apache-2.0"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build
  depends_on "openssl@3"
  depends_on "sparkworx/stuff/yubihsm-shell"

  def install
    # yubihsmrs' libyubihsm-sys build script links against libyubihsm from
    # here rather than probing pkg-config.
    ENV["YUBIHSM_LIB_DIR"] = formula_opt_lib("yubihsm-shell")
    # Steer the openssl crate at Homebrew's OpenSSL instead of any system copy.
    ENV["OPENSSL_DIR"] = formula_opt_prefix("openssl@3")

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
    assert_match "yubihsm-manager #{version}", shell_output("#{bin}/yubihsm-manager --version")
  end
end
