class KalibrateRtl < Formula
  homepage "https://github.com/xlfe/kalibrate-rtl"
  sha256 "f932d2998d522745596a9f95f0ab0bde54e4e342e49651b0ad3fcd51d6226eb1"
  head "https://github.com/xlfe/kalibrate-rtl.git"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "librtlsdr"
  depends_on "fftw"

  def install
    system "./bootstrap"
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end
end
