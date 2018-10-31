require 'formula'

class Nemomath < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de/components/generic/nemomath'
  url 'https://code.cor-lab.org/svn/nemomath/tags/nemomath-0.5.0/nemomath', :using => :svn
  version '0.5.0'
  head 'https://code.cor-lab.org/svn/nemomath/trunk/nemomath', :using => :svn

  option :universal

  depends_on 'cmake' => :build
  depends_on 'eigen'

  def install
    # ENV.x11 # if your formula requires any X11 headers
    # ENV.deparallelize  # if your formula's build system can't parallelize
    ENV.universal_binary if build.universal?
    args = std_cmake_args + %W[-DUSE_CPP_0X=0]

    system "cmake", ".", *args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test rsc`.
    system "false"
  end
end
