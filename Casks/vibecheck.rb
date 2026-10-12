cask "vibecheck" do
  version "0.1.0"
  sha256 "e51f019be07749552e038f3a568a70d6c35a1f5ad108d604c5b2dbcdd6bc1ce9"

  url "https://github.com/ikramhasan/homebrew-tap/releases/download/v#{version}/vibecheck-#{version}.zip"
  name "vibecheck"
  desc "Edge panel showing live coding-agent sessions"
  homepage "https://github.com/ikramhasan/vibecheck"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "vibecheck.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/vibecheck.app"],
        writable_paths: ["vibecheck.app"],
        writable_base:  :appdir
  end

  uninstall quit: "com.ikramulhasan.vibecheck"

  zap trash: [
    "~/Library/Application Support/vibecheck",
    "~/Library/Preferences/com.ikramulhasan.vibecheck.plist",
  ]
end
