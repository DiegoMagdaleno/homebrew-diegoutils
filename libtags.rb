class Libtags < Formula
    desc "Obj-C library for manipulating the tags on Files"
    homepage "https://github.com/DiegoMagdaleno/libtags"
    head "https://github.com/DiegoMagdaleno/libtags.git"
    license "MIT"

    def install
        xcodebuild "-project", "libtags.xcodeproj",
        "-scheme", "libtags",
        "SYMROOT=build",
        "DSTROOT=#{prefix}",
        "-verbose",
        "install"
    end
end 
