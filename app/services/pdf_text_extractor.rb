class PdfTextExtractor
  def self.extract(pdf)
    reader = PDF::Reader.new(StringIO.new(pdf))

    reader.pages.map(&:text).join("\n")
  end
end