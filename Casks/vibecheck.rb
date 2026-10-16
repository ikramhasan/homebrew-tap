cask "vibecheck" do
  version "0.7.0"
  sha256 "b70c5a335399fdd9886eaf8c19c6427db80f9fae6a97a00891e0a5bdab1944f1"

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
