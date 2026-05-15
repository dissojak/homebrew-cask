cask "agentsview" do
  os macos: "darwin", linux: "linux"

  if OS.mac?
    arch arm: "aarch64", intel: "x64"
  else
    arch arm: "arm64", intel: "amd64"
  end

  version "0.29.0"
  sha256 arm:          "168e80b3637519b26255297957c76d08af39f6f8fa0c11b3c22556e7a2561428",
         x86_64:       "3e04ca70f189be32e770ef089f79bcd4cb99016f1371d20db503697ae7e13f61",
         x86_64_linux: "3e04ca70f189be32e770ef089f79bcd4cb99016f1371d20db503697ae7e13f61",
         arm64_linux:  "168e80b3637519b26255297957c76d08af39f6f8fa0c11b3c22556e7a2561428"

  url_end = if OS.mac?
    "#{arch}.dmg"
  else
    "#{os}_#{arch}.tar.gz"
  end

  url "https://github.com/wesm/agentsview/releases/download/v#{version}/agentsview_#{version}_#{url_end}",
      verified: "github.com/wesm/agentsview/"
  name "AgentsView"
  desc "Browse, search and analyse your past AI coding sessions"
  homepage "https://www.agentsview.io/"

  livecheck do
    strategy :github_latest
  end

  if OS.mac?
    # TODO: could use AppImage if/when we add support.
    app "AgentsView.app"
    binary "#{appdir}/AgentsView.app/Contents/MacOS/agentsview"
  else
    binary "agentsview"
  end

end
