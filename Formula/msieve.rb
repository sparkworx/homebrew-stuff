class Msieve < Formula
  desc "Factor large integers"
  version "1.53"
  version_scheme 1
  homepage "https://sourceforge.net/projects/msieve/"
  url "https://downloads.sourceforge.net/project/msieve/msieve/Msieve%20v#{version}/msieve#{version.to_s.delete('.')}_src.tar.gz"
  sha256 "c5fcbaaff266a43aa8bca55239d5b087d3e3f138d1a95d75b776c04ce4d93bb4"

  depends_on "gcc"

  def install
    system "make", "all"
    mkdir bin
    bin.install "msieve"
  end

  test do
    system "#{bin}/msieve", "-q", "12"
  end
end
