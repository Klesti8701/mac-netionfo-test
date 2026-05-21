class Netinfo < Formula
  desc "Network & filesystem info CLI — shows public IP, local net, disk usage, and system info"
  homepage "https://github.com/klesti8701/mac-netionfo-test"
  url "https://github.com/klesti8701/mac-netionfo-test/releases/download/v1.0.0/netinfo-1.0.0.tar.gz"
  sha256 "75b8bb10d7c349fcce7bb32341aae67c3012f8449b3848968dc4a7d15deee361"
  version "1.0.0"
  license "MIT"

  # No dependencies — pure bash + curl (curl ships with macOS)
  depends_on "curl" => :recommended

  def install
    bin.install "netinfo"
  end

  test do
    assert_match "netinfo v#{version}", shell_output("#{bin}/netinfo version")
  end
end
