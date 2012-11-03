require 'formula'

# Documentation: https://github.com/mxcl/homebrew/wiki/Formula-Cookbook
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Libatuleu < Formula
  url 'https://ponyo.epfl.ch/cgit/index.cgi/libatuleu.git', :using => :git
  version '0.4'
  #head 'https://code.cor-lab.org/git/rsb.git.cpp', :using => :git

  depends_on 'cmake' => :build
  depends_on 'biorob-cmake-utils'

  def install
    # ENV.x11 # if your formula requires any X11 headers
    # ENV.j1  # if your formula's build system can't parallelize
    args = std_cmake_args

    system "cmake", ".", *args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test rsb`.
    system "false"
  end
end