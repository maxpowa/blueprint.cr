module Blueprint
  class Position
    JSON.mapping(
      x: Float64, # Relative to centerpoint of blueprint
      y: Float64, # Relative to centerpoint of blueprint
    )

    def initialize(@x, @y)
    end
  end
end
