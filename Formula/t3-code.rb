class T3Code < Formula
  desc "AI-powered code editor built by Ping"
  homepage "https://t3.codes/"
  url "https://github.com/pingdotgg/t3code/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "f3c95aeb02ead4c125721853abcb982e3cef381289a3214dab544ba0f0cd3201"
  license "MIT"

  depends_on "oven-sh/bun/bun" => :build
  depends_on "node" => :build
  depends_on macos: :ventura

  def install
    # Install monorepo dependencies
    system "bun", "install", "--frozen-lockfile"

    # Build the desktop app and its dependencies (server, web, contracts, shared)
    system "bun", "run", "build:desktop"

    # Determine architecture for electron-builder
    arch_flag = Hardware::CPU.arm? ? "arm64" : "x64"

    # Build the macOS app bundle as a zip archive
    ENV["CSC_IDENTITY_AUTO_DISCOVERY"] = "false"
    system "node", "scripts/build-desktop-artifact.ts",
           "--platform", "mac",
           "--target", "zip",
           "--arch", arch_flag,
           "--build-version", version.to_s,
           "--output-dir", buildpath/"release"

    # Keep the built zip opaque in libexec during install so Homebrew's
    # fix_dynamic_linkage pass cannot see the Electron framework dylibs
    # (they use short relative IDs like ./libEGL.dylib that lack Mach-O
    # header space for the absolute paths Homebrew tries to rewrite).
    # post_install runs after relocation, so extracting there is safe.
    built_zip = Dir[buildpath/"release/T3-Code-*-#{arch_flag}.zip"].first
    libexec.install built_zip => "T3-Code.zip"
  end

  def post_install
    system "unzip", "-qo", libexec/"T3-Code.zip", "-d", prefix
    (libexec/"T3-Code.zip").unlink
  end

  def caveats
    <<~EOS
      T3 Code has been installed to:
        #{prefix}/T3 Code (Alpha).app

      To link it into /Applications, run:
        ln -sf "#{prefix}/T3 Code (Alpha).app" /Applications/
    EOS
  end

  test do
    assert_predicate prefix/"T3 Code (Alpha).app", :exist?
  end
end
