require "io"
require "json"
require "base64"
require "zlib"

require "./types/*"

module Blueprint
  def self.from_io(io)
    begin
      # version byte
      version = io.read_byte
    rescue
      raise "Invalid blueprint string (unable to read version)"
    end

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

    begin
      # use JSON.mapping generated objects to parse
      wrapper = Wrapper.from_json(json)
    rescue
      raise "Invalid blueprint string (unrecognized json)"
    end

    # is this a book or a single blueprint
    if wrapper.book_present?
      return wrapper.book.as(Book)
    elsif wrapper.blueprint_present?
      return wrapper.blueprint.as(Blueprint)
    end

    raise "Invalid blueprint string (missing blueprint or book)"
  end

  def self.export(blueprint : Book | Blueprint, io)
    wrapper = Wrapper.new(blueprint).export(io)
  end
end
