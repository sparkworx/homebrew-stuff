class YubihsmShell < Formula
  desc "Yubico YubiHSM shell and libraries"
  homepage "https://developers.yubico.com/yubihsm-shell/"
  url "https://github.com/Yubico/yubihsm-shell/archive/refs/tags/2.7.1.tar.gz"
  sha256 "79bbca1b4f4b0208350d68a0e789c41047174ba6eb7219d973434e292b1fed92"
  license "Apache-2.0"

  depends_on "cmake" => :build
  depends_on "gengetopt" => :build
  depends_on "help2man" => :build
  depends_on "pkgconf" => :build
  depends_on "libusb"
  depends_on "openssl@3"

  uses_from_macos "curl"
  uses_from_macos "pcsc-lite"

  def install
    ENV.append_to_cflags "-I#{Formula["pcsc-lite"].opt_include}/PCSC" unless OS.mac?

    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  def caveats
    <<~EOS
      This formula may conflict with the yubihsm2-sdk cask, which installs
      the same components via Yubico's installer package. If you have the
      cask installed, run: brew uninstall --cask yubihsm2-sdk
    EOS
  end

  test do
    assert_match "yubihsm-shell #{version}", shell_output("#{bin}/yubihsm-shell --version")
  end
end
