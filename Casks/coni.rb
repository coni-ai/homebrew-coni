cask "coni" do
  version "0.0.1"

  on_arm do
    sha256 "a9f0fd2c7ad0448ace106db22e57cf5107ab69a49b2240a812ac6bad26cbd8c5"
    url "https://github.com/coni-ai/coni/releases/download/v#{version}/Coni-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
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
