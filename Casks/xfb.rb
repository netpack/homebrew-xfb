# Homebrew cask for XFB — template, kept in sync by update-homebrew-tap.sh
# Published to the tap repository: https://github.com/netpack/homebrew-xfb
#
# Users install with:
#   brew install --cask netpack/xfb/xfb
# (or: brew tap netpack/xfb && brew install --cask xfb)
cask "xfb" do
  version "3.1420"
  sha256 "eeaaa13a785455dafc6f906d1b75c4b009ebfd2542a01b531efe9bfa45d201ba"

  url "https://github.com/netpack/XFB/releases/download/v#{version}/XFB-#{version}-macOS.dmg"
  name "XFB"
  desc "Open-source radio automation software"
  homepage "https://github.com/netpack/XFB"

  # The published dmg is currently built for Apple Silicon only
  depends_on arch: :arm64
  # Symbol form means "this version or later" (the ">= :big_sur" string
  # comparison form was deprecated by Homebrew)
  depends_on macos: :big_sur

  # The live audio FX engine (EQ / compressor / 432 Hz) and the format
  # conversions decode through the ffmpeg CLI
  depends_on formula: "ffmpeg"

  app "XFB.app"

  zap trash: [
    "~/Library/Application Support/XFB",
    "~/Library/Preferences/XFB",
    "~/Library/Saved Application State/pt.netpack.xfb.savedState",
  ]

  caveats <<~EOS
    Optional extras:
      brew install ngrok       # public share links for your stream
      brew install mediainfo   # metadata lookups
  EOS
end
