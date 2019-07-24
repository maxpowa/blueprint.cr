module Blueprint
  class Book
    JSON.mapping(
      item: {type: String, default: "blueprint-book"},
      label: {type: String, default: "Blueprint Book"},
      label_color: Color?,
      blueprints: Array(NamedTuple(index: Int32, blueprint: Blueprint)),
      active_index: Int16?,
      version: UInt64?,
    )

    setter item : String = "blueprint"
    setter label : String = "Blueprint"
    setter label_color
    setter blueprints
    setter active_index

    def initialize(blueprints : Array(Blueprint))
      @blueprints = blueprints.map_with_index { |each, idx|
        {index: idx, blueprint: each}
      }
    end

    def initialize(@label, blueprints)
      @blueprints = blueprints.map_with_index { |each, idx|
        {index: idx, blueprint: each}
      }
    end

    def export
      Wrapper.new(self).export
    end

    def export(io)
      Wrapper.new(self).export(io)
    end
  end
end
