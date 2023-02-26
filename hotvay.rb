class Hotvay < Formula
  desc "Simple hotkey-daemon for 'Vaydeer - 9-key Smart Keypad'"
  homepage "https://github.com/nassendelft/hotvay"
  url "https://github.com/nassendelft/hotvay/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "cd8d4c8410cc960635909869e5604c28bd0a3fafb4a1b66f7db124b5f0ec0937"
  head "https://github.com/nassendelft/hotvay.git"

  depends_on :xcode

  def install
    system "./gradlew", "-Dgradle.user.home=#{buildpath}/gradle-home", "--no-daemon", "build"
    bin.install "#{buildpath}/build/bin/macosX64/releaseExecutable/hotvay.kexe" => "hotvay"
  end

  plist_options :startup => true

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
        <string>#{plist_name}</string>
      <key>ProgramArguments</key>
      <array>
        <string>#{bin}/hotvay</string>
      </array>
      <key>RunAtLoad</key>
      <true/>
      <key>KeepAlive</key>
      <true/>
      <key>StandardErrorPath</key>
      <string>/dev/null</string>
      <key>StandardOutPath</key>
      <string>/dev/null</string>
    </dict>
    </plist>
    EOS
  end
  
end
