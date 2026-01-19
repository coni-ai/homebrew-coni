cask "coni" do
  version "0.0.1"

  on_arm do
    sha256 "bb34e1a586398c1105468b62e7a098c52f2754c9d16e05b5fb19fc50f1fb75fb"
    url "https://github.com/coni-ai/coni/releases/download/v#{version}/Coni-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "77a18dbd1b973281be8a31e44f6d50a2cf863ebd73fb5b1162b73eb496d81e1b"
    url "https://github.com/coni-ai/coni/releases/download/v#{version}/Coni-#{version}.dmg"
  end

  name "Coni"
  desc "Open source, local-first AI coworker"
  homepage "https://github.com/coni-ai/coni"

  # Remove quarantine attribute (unsigned app)
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Coni.app"],
                   sudo: false
  end

  app "Coni.app"

  zap trash: [
    "~/.coni",
    "~/Library/Application Support/Coni",
    "~/Library/Caches/Coni",
    "~/Library/Preferences/com.coni.desktop.plist",
    "~/Library/Saved Application State/com.coni.desktop.savedState",
  ]
end
