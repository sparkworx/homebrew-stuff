class YubihsmSetup < Formula
  desc "Yubico YubiHSM Setup Tool"
  homepage "https://github.com/Yubico/yubihsm-setup"
  url "https://github.com/Yubico/yubihsm-setup/archive/refs/tags/2.3.3.tar.gz"
  sha256 "b92404309324a2b9fe995a5ac2ccf669fb3c46d5fe239f11627f1f42476db031"
  license "Apache-2.0"

  depends_on "rust" => :build
  depends_on "sparkworx/stuff/yubihsm-shell"

  resource "yubihsmrs" do
    url "https://github.com/Yubico/yubihsmrs/archive/refs/tags/2.1.4.tar.gz"
    sha256 "51fbc09b1fd2232e99e73971d5503b66608d757f55fe5e12db1597cdeafd787c"
  end

  patch :DATA

  def install
    resource("yubihsmrs").stage do
      (buildpath/"yubihsmrs").install Dir["*"]
    end

    system "cargo", "install", *std_cargo_args
  end

  test do
    assert_match "yubihsm-setup #{version}", shell_output("#{bin}/yubihsm-setup --version")
  end
end
__END__
diff --git a/Cargo.toml b/Cargo.toml
index 3b7ec34..0bdc5ac 100644
--- a/Cargo.toml
+++ b/Cargo.toml
@@ -30,7 +30,7 @@ rusty_secrets = "0.0.2"
 scan_dir = "0.3.3"

 [dependencies.yubihsmrs]
-path = "../yubihsmrs/"
+path = "./yubihsmrs/"
 version = "2.1.4"

 [package.metadata.deb]
