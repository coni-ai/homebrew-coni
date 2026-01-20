cask "coni" do
  version "0.0.1"

  on_arm do
    sha256 "91cde19464bd175f8355d30159c996fc601d0b8f6bf564f6e9971319c2a26bea"
    url "https://github.com/coni-ai/coni/releases/download/v#{version}/Coni-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "fca1352d7397c11184e4a24cfdd88bcd9b963a9fd8dc206282cc71ce8a7c0c71"
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
