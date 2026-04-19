cask "timecatcher" do
  version "0.34.0"
  sha256 "43a99b0b9344f1190a692fd39f34fcf40fb5e0be8430b0eb5605ff7ec090e424"

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