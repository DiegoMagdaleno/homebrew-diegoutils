class Trm < Formula
    desc "Small utility to move files to the trash can instead of directly deleting them. Written in Go."
    homepage "https://github.com/DiegoMagdaleno/trm"
    url "https://github.com/DiegoMagdaleno/trm.git", :tag => "v0.0.7"

    depends_on "go" => :build

    def install
        system "make", "install", "PREFIX=#{prefix}"
    end

    test do
        (testpath/"test.file").write <<~EOS
            This is a file
        EOS
        system "#{bin}/trm", "test.file"
    end
end