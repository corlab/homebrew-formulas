require 'formula'

class RsbOpencv < Formula
  #homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/tools/rsb-gstreamer-integration'
  url 'https://code.cor-lab.de/svn/rsbvideoreceiver/branches/refactoring', :using => :svn
  version '0.17'
  head 'https://code.cor-lab.org/svn/rsbvideoreceiver/trunk', :using => :svn

  option :universal

  depends_on 'cmake' => :build
  depends_on 'opencv'
  depends_on 'rsb'
  depends_on 'rst-proto'
  depends_on 'rst-converters'

  def install
    ENV.universal_binary if build.universal?

    system "cmake", ".", *std_cmake_args
    system "make install"
  end

  def test
    system "rsb_videoreceiver", "-h"
  end
end
