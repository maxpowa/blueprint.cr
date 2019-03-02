module Blueprint
  class Tile
    JSON.mapping(
      name: String,
      position: Position,
    )

    def initialize(@name, @position)
    end
  end
end
