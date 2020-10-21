class KubaZip < Formula
    desc "A portable (OSX/Linux/Windows), simple zip library written in C"
    homepage "https://github.com/kuba--/zip"
    url "https://github.com/kuba--/zip/archive/v0.1.19.tar.gz"
    license "Unlicense"
    head "https://github.com/kuba--/zip.git"

    depends_on "cmake" => :build

    def install
        mkdir "build" do
            system "cmake", "-DBUILD_SHARED_LIBS=true", "..", *std_cmake_args
            system "make"
            system "make", "install"
        end
    end
end 