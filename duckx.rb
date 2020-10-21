class Duckx < Formula
    desc "Create, read and write Microsoft Office Word docx files."
    homepage "https://github.com/amiremohamadi/DuckX"
    head "https://github.com/amiremohamadi/DuckX.git"
    license "MIT"

    depends_on "cmake" => :build
    depends_on "pugixml"
    depends_on "kuba-zip"

    depends_on "gcc"

    fails_with :clang

    def install
        mkdir "build" do
            system "cmake", "..", *std_cmake_args
            system "cmake", "--build", "."
            system "make", "install"
        end
    end
end