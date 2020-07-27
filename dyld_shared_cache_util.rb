class DyldSharedCacheUtil < Formula
    desc "Apple's utility for many dyld cache operations built for the general public"
    homepage "https://opensource.apple.com/source/dyld/dyld-733.8/"
    url "https://github.com/DiegoMagdaleno/dyld.git", :tag => "733.8-2"


    depends_on :macos => :catalina # TODO: Once homebrew supports Big Sur make it Big Sur+
    depends_on :xcode => :build

    def install
        system "make", "install", "DESTDIR=#{HOMEBREW_PREFIX}"
    end

    test do
        system "#{HOMEBREW_PREFIX}/bin/dyld_shared_cache_util", "-info"
    end
end