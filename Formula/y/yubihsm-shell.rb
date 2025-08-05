class YubihsmShell < Formula
  desc "Yubico YubiHSM shell and libraries"
  homepage "https://developers.yubico.com/yubihsm-shell/"
  url "https://github.com/Yubico/yubihsm-shell/archive/refs/tags/2.7.0.tar.gz"
  sha256 "7c08068971d4047767034c5f83743c7a33b5d4c95e8adcb9083f1a8371df34b9"
  license "Apache-2.0"

  depends_on "check" => :build
  depends_on "cmake" => :build
  depends_on "gengetopt" => :build
  depends_on "gnu-getopt" => :build
  depends_on "help2man" => :build
  depends_on "pkgconf" => :build
  depends_on "libusb"
  depends_on "openssl@3"

  uses_from_macos "curl"
  uses_from_macos "pcsc-lite"
  uses_from_macos "zlib"

  def install
    ENV.append_to_cflags "-I#{Formula["pcsc-lite"].opt_include}/PCSC" unless OS.mac?

    system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match "yubihsm-shell #{version}", shell_output("#{bin}/yubihsm-shell --version")
  end
end
