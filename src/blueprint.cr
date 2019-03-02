require "io"
require "json"
require "base64"
require "zlib"

require "./types.cr"

module Blueprint
  class Wrapper
    JSON.mapping(
      blueprint: {type: Blueprint?, presence: true},
      book: {key: "blueprint_book", type: Book?, presence: true},
    )

    def initialize(blueprint : Blueprint)
      @blueprint = blueprint
    end

    def initialize(book : Book)
      @book = book
    end
  end

  def self.from_io(io)
    # version byte
    version = io.read_byte
    if version && version.chr != '0'
      raise "Unsupported blueprint version"
    end

    # rest of stream is base64 encoded
    begin
      payload = IO::Memory.new Base64.decode(io.gets_to_end)
      # and zlib deflated
      json = Zlib::Reader.new(payload).gets_to_end
    rescue
      raise "Invalid blueprint string (bad encoding)"
    end

    # use JSON.mapping generated objects to parse
    wrapper = Wrapper.from_json(json)

    # is this a book or a single blueprint
    if wrapper.book_present?
      return wrapper.book
    elsif wrapper.blueprint_present?
      return wrapper.blueprint
    else
      raise "Invalid blueprint string (missing blueprint or book)"
    end
  end

  def self.export(blueprint : Book | Blueprint, io)
    wrapper = Wrapper.new(blueprint).to_json

    begin
      intermediate_io = IO::Memory.new
      Zlib::Writer.open(intermediate_io) do |writer|
        wrapper.to_s(writer)
      end
      intermediate_io.rewind
      payload = Base64.strict_encode(intermediate_io.gets_to_end)
    rescue
      raise "Unable to export blueprint"
    end

    io.write "0#{payload}".to_slice
  end
end
