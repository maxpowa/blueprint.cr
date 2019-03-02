module Blueprint
  class Blueprint
    JSON.mapping(
      item: { type: String, default: "blueprint" },
      label: { type: String, default: "Blueprint" },
      label_color: Color?,
      entities: Array(Entity)?,
      tiles: Array(Tile)?,
      icons: Array(Icon)?,
      version: UInt64?,
    )

    def export(io)
        Wrapper.new(self).export(io)
    end
  end
end
