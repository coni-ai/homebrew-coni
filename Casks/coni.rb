cask "coni" do
  version "0.0.1"

  on_arm do
    sha256 "c468dd7afc2cf4493281cf0407fc2781907687fead81935fc17aac406e0a6da9"
    url "https://github.com/coni-ai/coni/releases/download/v#{version}/Coni-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "820c70718a28671f02a50135559cd7143d2a39582b534bb1e9f49c29b9ca7bad"
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
