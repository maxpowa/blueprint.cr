
module Blueprint
  class Book
    JSON.mapping(
      item: { type: String, default: "blueprint-book" },
      label: { type: String, default: "Blueprint Book" },
      label_color: Color?,
      blueprints: Array(Blueprint),
      active_index: Int16,
      version: UInt64,
    )

    def export(io)
        Wrapper.new(self).export(io)
    end
  end
end