class CidrSlop < Formula
  desc "Trade-off of collapsing IPv4 CIDR ranges into one covering supernet"
  homepage "https://github.com/sparkworx/cidr-slop"
  url "https://github.com/sparkworx/cidr-slop/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "aa45740c99213bc2663091309a8dcb19a374b5e428cbcc2f7bcf590be4d654eb"
  license "MIT"
  head "https://github.com/sparkworx/cidr-slop.git", branch: "develop"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "cidr-slop #{version}", shell_output("#{bin}/cidr-slop --version")

    # Two adjacent /24s collapse into a /23 with zero slop; the covering
    # supernet must be reported exactly.
    assert_match "supernet: 10.0.0.0/23",
      shell_output("#{bin}/cidr-slop 10.0.0.0/24 10.0.1.0/24")

    # --json emits a machine-readable object carrying the supernet field.
    assert_match(%r{"supernet":\s*"10.0.0.0/23"},
      shell_output("#{bin}/cidr-slop --json 10.0.0.0/24 10.0.1.0/24"))
  end
end
