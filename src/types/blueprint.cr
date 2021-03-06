module Blueprint
  class Blueprint
    JSON.mapping(
      item: {type: String, default: "blueprint"},
      label: {type: String, default: "Blueprint"},
      label_color: Color?,
      entities: Array(Entity)?,
      tiles: Array(Tile)?,
      icons: Array(Icon)?,
      version: UInt64?,
    )

    setter item : String = "blueprint"
    setter label : String = "Blueprint"
    setter label_color
    setter entities
    setter tiles
    setter icons

    def initialize(@entities)
    end

    def initialize(@label, @entities)
    end

    def export
      Wrapper.new(self).export
    end

    def export(io)
      Wrapper.new(self).export(io)
    end
  end
end
