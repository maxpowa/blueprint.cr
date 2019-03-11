module Blueprint
  class Color
    JSON.mapping(
      r: Float64,
      g: Float64,
      b: Float64,
      a: Float64,
    )

    def initialize(@r, @g, @b, @a)
    end
  end
end
