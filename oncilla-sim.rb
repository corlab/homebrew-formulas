require 'formula'

class OncillaSim < Formula
  homepage 'https://toolkit.cit-ec.uni-bielefeld.de'
  head 'https://redmine.amarsi-project.eu/git/oncillasim.git', :using => :git
  version '0.2'
  url 'https://redmine.amarsi-project.eu/git/oncillasim.git', :using => :git, :branch => 'y3gent'

  option :universal

  depends_on 'liboncilla-webots'
  depends_on 'cca-oncilla'

  def install
    # ENV.x11 # if your formula requires any X11 headers
    # ENV.deparallelize  # if your formula's build system can't parallelize
    ENV.universal_binary if build.universal?

    system "python", "setup.py", "install", "--prefix=#{prefix}"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just replace
    # "false" with the main program this formula installs, but it'd be nice if you
    # were more thorough. Run the test with `brew test rsb`.
    system "false"
  end
end
