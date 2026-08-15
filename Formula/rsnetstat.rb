class Rsnetstat < Formula
  desc "High-fidelity, CIDR-complete alternative to macOS netstat -rn"
  homepage "https://github.com/sparkworx/rsnetstat"
  url "https://github.com/sparkworx/rsnetstat/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "4f40b95903b418ff30ac333e9f2d144ab48465aa5c98f364e8fc81fd2abbb864"
  license "Apache-2.0"
  head "https://github.com/sparkworx/rsnetstat.git", branch: "main"

  depends_on "rust" => :build

  # Reads the BSD routing socket (PF_ROUTE) and renders macOS interface and
  # IPv6 zone conventions; it has no equivalent on Linux's routing stack.
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "rsnetstat #{version}", shell_output("#{bin}/rsnetstat --version")

    # The routing table is readable unprivileged, so --json must emit a JSON
    # array (possibly empty) and exit cleanly.
    assert_match(/\A\[/, shell_output("#{bin}/rsnetstat --json"))
  end
end
