cask "coni" do
  version "0.0.1"

  on_arm do
    sha256 "66d9e0923030bd83e1cf6fe7ec8618aec469aa46ab7167f8bfd966b42e018e34"
    url "https://github.com/coni-ai/coni/releases/download/v#{version}/Coni-#{version}-arm64.dmg"
  end

  on_intel do
    sha256 "b0680ade1e9a7abe3ec2af00859778c8908e09aea1cc4cf06d51ffb3365fdbdf"
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
