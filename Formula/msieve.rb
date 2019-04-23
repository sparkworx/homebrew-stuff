class Msieve < Formula
  desc "Factor large integers"
  version "1.52"
  version_scheme 1
  homepage "https://sourceforge.net/projects/msieve/"
  url "https://downloads.sourceforge.net/project/msieve/msieve/Msieve%20v#{version}/msieve#{version.to_s.delete('.')}.tar.gz"
  sha256 "8a895544d316b8befe0e93a1fd7a1d508e8aa0f734035e2632aa4d928a2ef20b"

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
