module Blueprint
  class Color
    JSON.mapping(
      r: Int8,
      g: Int8,
      b: Int8,
      a: Int8,
    )

    def initialize(@r, @g, @b, @a)
    end
  end
end
