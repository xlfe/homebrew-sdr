require "formula"

class Cubicsdr < Formula
  homepage "https://github.com/cjcliffe/CubicSDR"
  url "https://github.com/cjcliffe/CubicSDR/archive/0.2.5.tar.gz"
  sha256 "5cb44c110fcbbb70a468b7fa402cf35f84d8901b3dd42d471a90ac3f5db00f4d"
  head "https://github.com/cjcliffe/CubicSDR.git"

  depends_on "cmake" => :build

  option "with-digital", "Build with Digital Lab support"

  depends_on "fftw" => "without-fortran"
  depends_on "librtlsdr"
  depends_on "liquid-dsp"
  depends_on "pothosware/pothos/soapysdr"
  depends_on "wxmac"

  def install
    mkdir "build" do

      args = std_cmake_args
      args << "-DENABLE_DIGITAL_LAB=1" if build.with? "digital"

      system "cmake", "..", *args
      system "make"

      libexec.install Dir["x64/*"]
      (bin/"CubicSDR").write <<-EOS.undent
        #!/usr/bin/env bash
        (
            cd #{libexec}
            ./CubicSDR
        )
      EOS
    end
  end
end
