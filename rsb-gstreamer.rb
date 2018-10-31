require 'formula'

class RsbGstreamer < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/tools/rsb-gstreamer-integration'
  url 'https://code.cor-lab.de/git/rsb-gstreamer.git', :using => :git, :branch => '0.17'
  version '0.17'
  head 'https://code.cor-lab.de/git/rsb-gstreamer.git', :using => :git

  option :universal

  depends_on 'cmake' => :build
  # from homebre/versions
  # TODO this causes a dependency lock in homebrew
  # depends_on 'gstreamer010'
  depends_on 'gst-plugins-base010'
  depends_on 'libxml2'
  depends_on 'rsb'
  depends_on 'rst-proto'

  def install
    ENV.universal_binary if build.universal?

    system "cmake", ".", *std_cmake_args
    system "make install"
  end

  def test
    system "gst-inspect-0.10 | grep rsb"
  end
end
