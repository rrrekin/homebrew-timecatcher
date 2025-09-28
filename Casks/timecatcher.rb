cask "timecatcher" do
  version "0.25.2"
  sha256 "729901010739a8d88f2f564af6df3bcf95247ab2e6a54c8200409efd5271229b"

  url "https://github.com/rrrekin/TimeCatcher/releases/download/v#{version}/TimeCatcher-#{version}-mac-arm64.dmg"
  name "TimeCatcher"
  desc "Context-switch time tracking desktop app"
  homepage "https://github.com/rrrekin/TimeCatcher"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "TimeCatcher.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/TimeCatcher.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/TimeCatcher",
    "~/Library/Preferences/eu.rrrekin.timecatcher.plist",
    "~/Library/Saved Application State/eu.rrrekin.timecatcher.savedState",
  ]
end