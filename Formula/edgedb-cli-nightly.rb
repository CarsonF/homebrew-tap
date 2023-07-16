class EdgedbCliNightly < Formula
  desc "Latest release of the EdgeDB command-line client (edgedb)"
  homepage "https://github.com/edgedb/edgedb-cli"
  version "3.5.0-dev.1025"

  on_macos do
    if Hardware::CPU.physical_cpu_arm64?
      url "https://packages.edgedb.com/archive/aarch64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1025+363f8a5",
        using: :nounzip
      sha256 "017b3ebcb89ed0429d0aa8deea7346e819075da898637a11772064468124b320"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1025+363f8a5" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel?
      url "https://packages.edgedb.com/archive/x86_64-apple-darwin.nightly/edgedb-cli-3.5.0-dev.1025+05cc3da",
        using: :nounzip
      sha256 "0d98aef388d233681525d5d057d9685e74d6bf4d5c23e322c451579d8c84cb17"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1025+05cc3da" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/aarch64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1025+2be36ff",
        using: :nounzip
      sha256 "cf7ceef7768e483bffe1f6076632f51d17a2d7764b10ac5dd78ebc92f5c474ee"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1025+2be36ff" => "edgedb-nightly"
      end
    elsif Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://packages.edgedb.com/archive/x86_64-unknown-linux-musl.nightly/edgedb-cli-3.5.0-dev.1025+1792062",
        using: :nounzip
      sha256 "0bdbc689b3bc353bda891e224be157e30565406c801ef185d87c21772d543a97"

      def install
        bin.install "edgedb-cli-3.5.0-dev.1025+1792062" => "edgedb-nightly"
      end
    else
      odie "Unsupported CPU architecture!"
    end
  end

  test do
    system "#{bin}/edgedb-nightly", "--version"
  end
end
