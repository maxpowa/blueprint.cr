module Blueprint
  class Icon
    JSON.mapping(
      index: Int16,
      signal: SignalId,
    )

    def initialize(@index, @signal)
    end
  end
end
