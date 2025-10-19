cask "timecatcher" do
  version "0.31.0"
  sha256 "8b1d50be9672b0ff4ed84898aaf679bdc4c7aba3c2448ba2afdf05decf1c36ea"

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