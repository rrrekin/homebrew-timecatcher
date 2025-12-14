cask "timecatcher" do
  version "0.32.8"
  sha256 "d17289e3f71a32bdb58ababa2e835667eef191143d924ece0148c4f06734c405"

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