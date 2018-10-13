require 'formula'

class CcaOncilla < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de'
  version '0.4'
  url 'https://redmine.amarsi-project.eu/git/oncilla-cca.git', :using => :git
  head 'https://redmine.amarsi-project.eu/git/oncilla-cca.git', :using => :git

  option :universal

  depends_on 'cmake' => :build
  depends_on 'boost'
  depends_on 'cca'
  depends_on 'liboncilla'
  depends_on 'rst-converters'

  def install
    # ENV.x11 # if your formula requires any X11 headers
    # ENV.deparallelize  # if your formula's build system can't parallelize
    ENV.universal_binary if build.universal?    

    FileUtils.cd("cca-oncilla", :verbose => true)
    system "cmake", ".", *std_cmake_args
    system "make install" # if this fails, try separate make/make install steps
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test rsc`.
    system "false"
  end
end
