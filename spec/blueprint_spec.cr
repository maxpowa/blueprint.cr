require "./spec_helper"
require "file"

EXAMPLE_BLUEPRINT = "0eNrNVctu2zAQ/JV2z1Jgx1KcCL300FuBFr30UAQCJW9sInyBDzuCoX/vkpZdt1YKCwWCXgztcjm7Mx6Se2hEQGO58lDtgbdaOah+7MHxtWIi5nxnECrgHiVkoJiMkcQVDzJHga23vM2NFgh9Blyt8AWqef+YASrPPccDXgq6WgXZoKWCE5LTgtncMIWC4I12tEer2PgllXVQ5bd9n11A3J4gWNsGGQTz2l5ClDflAHJTjsEs/s7pAi9fJrjZGFYxEWsxQGVAuisq5Un+Pczjj8XVuXScovKsaYzv/oiX/WM/Nlh5nVZ5MYgVtUpDeatF3eCGbTltoCodvAm+vrDHllsfmPjlkENF/hH66+kVr4x/d0I1Vq8tk5I1AnNnkD3jCI8ikZi/QqHltg3c17S2Ou164tZNo5XAnWfx5DzMYiQNs0nYCj6k9aFRTEv0aBP5A0K9ZXTwau5qw327geqJCYfxADlvgyQBkiL31Fh7TN+zqUqSLr91NoJ1DWuf660WIbKh43XKrYVumBCkG/WnQehb72rybWc2WnXDgH1cQHvBaUO1aeG4PWW0qiUzx1S8XAaF04wTr5ZDX4nOsXWs+6p3aN991jsYs8xyomXKN7fMwz9bZpD1v3VMTF9hmMH5b+CYL98/fXtPdqHHKSFUZ69fBoI19AYdjUUvGW+Ha3JLU6c/fbmYzYtyWc5n933/E7HVheM="

describe Blueprint do
  it "parses well formed blueprints" do
    io = IO::Memory.new EXAMPLE_BLUEPRINT

    result = Blueprint.parse(io)

    result.should be_a(Blueprint::Blueprint)
  end

  it "parses well formed blueprint books" do
    file = File.new("spec/example_book.txt")
    result = Blueprint.parse(file)

    result.should be_a(Blueprint::Book)
  end

  it "raises when unsupported version is passed" do
    io = IO::Memory.new "2invalid="

    expect_raises(Exception, "Unsupported blueprint version") do
      Blueprint.parse(io)
    end
  end

  it "raises when invalid string is passed" do
    io = IO::Memory.new "0invalid="

    expect_raises(Exception, "Invalid blueprint string (bad encoding)") do
      Blueprint.parse(io)
    end
  end

  it "raises when decoded blueprint does not contain anything" do
    io = IO::Memory.new "0invalid="

    expect_raises(Exception, "Invalid blueprint string (bad encoding)") do
      Blueprint.parse(io)
    end
  end

  it "exports an identical string to input" do
    io = IO::Memory.new EXAMPLE_BLUEPRINT
    expected = Blueprint.parse(io)

    output = IO::Memory.new
    expected.export(output)

    output.rewind

    Blueprint.parse(output).to_json.should eq(expected.to_json)
  end
end
