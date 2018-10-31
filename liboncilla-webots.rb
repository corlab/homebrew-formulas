require 'formula'

class LiboncillaWebots < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de'
  url 'https://redmine.amarsi-project.eu/git/liboncilla-webots.git', :using => :git
  version '0.2'
  head 'https://redmine.amarsi-project.eu/git/liboncilla-webots.git', :using => :git 
  #, :branch => 'macos-workarounds'

  option :universal

  depends_on 'cmake' => :build
  depends_on 'rsc'
  depends_on 'biorob-cpp'
  depends_on 'cca'
  depends_on 'rci'
  depends_on 'liboncilla'
  depends_on 'libwebots' 

  def install
    # ENV.x11 # if your formula requires any X11 headers
    # ENV.deparallelize  # if your formula's build system can't parallelize
    ENV.universal_binary if build.universal?
    args = std_cmake_args 
    # + %W[-DBREW_BUILD=1]

    system "cmake", ".", "-DWEBOTS_ROOT_DIR=/Applications", *args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test rsb`.
    system "false"
  end
end
