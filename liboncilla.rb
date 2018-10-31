require 'formula'

class Liboncilla < Formula
  def patches
    # fix for errorneous linker flag on MacOS 10.7
    DATA
  end

  homepage 'https://toolkit.cit-ec.uni-bielefeld.de'
  url 'https://redmine.amarsi-project.eu/git/quaddrivers.git', :using => :git
  version '0.3'
  head 'https://redmine.amarsi-project.eu/git/quaddrivers.git', :using => :git
  
  option :universal

  depends_on 'cmake' => :build
  depends_on 'rci' 
  depends_on 'biorob-cpp'

  def install
    # ENV.x11 # if your formula requires any X11 headers
    # ENV.deparallelize  # if your formula's build system can't parallelize
    ENV.universal_binary if build.universal?
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

__END__
diff --git a/src/liboncilla/CMakeLists.txt b/src/liboncilla/CMakeLists.txt
index 5338204..80c97b9 100644
--- a/src/liboncilla/CMakeLists.txt
+++ b/src/liboncilla/CMakeLists.txt
@@ -42,9 +42,8 @@ target_link_libraries(oncilla
 set_target_properties(oncilla
                       PROPERTIES
                       VERSION ${VERSION_STRING}
-                      SOVERSION ${VERSION_ABI}
-                      LINK_FLAGS "-Wl,-unresolved-symbols=ignore-in-shared-libs")
-
+                      SOVERSION ${VERSION_ABI})
+ 
 install(TARGETS oncilla
         EXPORT LibOncillaDepends
         DESTINATION lib)

