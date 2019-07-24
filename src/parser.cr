require "io"
require "json"
require "base64"
require "zlib"

require "./types/*"

class Blueprint::Parser
  def self.decode(str)
    return IO::Memory.new Base64.decode(str)
  end

  def self.inflate(io)
    return Zlib::Reader.new(io).gets_to_end
  end

  def self.parse(io)
    begin
      # version byte
      version = io.read_byte
    rescue
      raise "Invalid blueprint string (unable to read version)"
    end

    if version && version.chr != '0'
      raise "Unsupported blueprint version"
    end

    begin
      # rest of stream is base64 encoded
      payload = self.decode(io.gets_to_end)
      # and zlib deflated
      json = self.inflate(payload)
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
    if book = wrapper.book
      return book
    elsif blueprint = wrapper.blueprint
      return blueprint
    else
      raise "Invalid blueprint string (missing blueprint or book)"
    end
  end
end

module Blueprint
  def self.parse(str : String)
    return Parser.parse(IO::Memory.new str)
  end

  def self.parse(io : ::IO)
    return Parser.parse(io)
  end
end
