module Blueprint
  class Wrapper
    JSON.mapping(
      blueprint: Blueprint?,
      book: {key: "blueprint_book", type: Book?},
    )

    def initialize(blueprint : Blueprint)
      @blueprint = blueprint
    end

    def initialize(book : Book)
      @book = book
    end

    def export(io)
      begin
        intermediate_io = IO::Memory.new
        Zlib::Writer.open(intermediate_io) do |writer|
          self.to_json.to_s(writer)
        end
        intermediate_io.rewind
        payload = Base64.strict_encode(intermediate_io.gets_to_end)
      rescue
        raise "Unable to export blueprint"
      end

      io.write "0#{payload}".to_slice
    end
  end
end
