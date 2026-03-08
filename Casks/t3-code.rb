cask "t3-code" do
  version "0.0.4"

  on_arm do
    sha256 "14ab774434354b02dfe9f3adb4ae5f2029ddf1965612f209a825ada8da9dff99"

    url "https://github.com/pingdotgg/t3code/releases/download/v#{version}/T3-Code-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "9c7d7bd2a71bc5213599b98e96180cfe1677afde823617218e18c75bec3cb84b"

    url "https://github.com/pingdotgg/t3code/releases/download/v#{version}/T3-Code-#{version}-x64.dmg"
  end

  name "T3 Code"
  desc "AI-powered code editor built by Ping"
  homepage "https://t3.codes/"

  depends_on macos: ">= :ventura"

  app "T3 Code (Alpha).app"

  zap trash: [
    "~/Library/Application Support/t3-code-desktop",
    "~/Library/Caches/t3-code-desktop",
    "~/Library/Logs/t3-code-desktop",
    "~/Library/Preferences/com.t3tools.t3code.plist",
    "~/Library/Saved Application State/com.t3tools.t3code.savedState",
  ]
end
