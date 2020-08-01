class BsdCoreUtils < Formula
    desc "The OpenBSD Coreutils Project is a port of many utilities from OpenBSD to Linux and macOS."
    homepage "https://github.com/DiegoMagdaleno/BSDCoreUtils"
    url "https://github.com/DiegoMagdaleno/BSDCoreUtils.git", :tag => "v6.7-r1"

    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build

    def install
        ENV.prepend_path "PKG_CONFIG_PATH", "#{Formula["openssl@1.1"].opt_lib}/pkgconfig"
        ENV.prepend_path "LDFLAGS", "#{Formula["openssl@1.1"].opt_lib}"
        ENV.prepend_path "CPPFLAGS", "#{Formula["openssl@1.1"].opt_include}"
        system "./autogen.sh"
        system "./configure", "--prefix=#{prefix}", "--program-prefix=b"
        system "make"
        system "make install"
    end

    test do
        system "#{HOMEBREW_PREFIX}/bin/bbsdvers"
    end
end