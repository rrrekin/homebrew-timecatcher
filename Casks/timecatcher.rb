cask "timecatcher" do
  version "0.33.2"
  sha256 "c472ad6eeb14ad158561d3401be9d71e55449304f426d5f24069217a408b86ec"

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