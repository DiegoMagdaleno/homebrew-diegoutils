class Exceptions4c < Formula
    desc "🐑 An exception handling framework for C"
    homepage "https://exceptions4c.guillermo.dev/"
    head "https://github.com/guillermocalvo/exceptions4c.git"
    license "LGPL"

    depends_on "pkg-config" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
    depends_on "autoconf" => :build

    def install
        # This thing doesnt have a libtoolize script, so, we gotta make it
        system "glibtoolize", "--copy", "--force"
        system "aclocal"
        system "autoconf"
        system "automake", "--foreign", "--add-missing", "--copy"
        system "rm", "-rf", "autom4te.cache"

        # time to install
        system "./configure",  "--disable-dependecy-tracking", 
                                                "--disable-silent-rules",
                                                "--prefix=#{prefix}"
        system "make"
        system "make", "install"
    end 
end