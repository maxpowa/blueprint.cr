module Blueprint
  class Filter
    JSON.mapping(
      name: String,
      count: Int16?,
      mode: String?, # at-least/at-most/exactly
      index: Int16,
    )

    def initialize(@index, @name, @count, @mode)
    end

    def initialize(@index, @name, @count)
    end

    def initialize(@index, @name)
    end
  end
end
