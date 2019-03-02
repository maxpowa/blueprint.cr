module Blueprint
  class ConnectionData
    JSON.mapping(
      entity_id: Int16,
      circuit_id: Int16?,
    )

    def initialize(@entity_id, @circuit_id)
    end

    def initialize(@entity_id)
    end
  end

  class ConnectionPoint
    JSON.mapping(
      red: Array(ConnectionData)?,
      green: Array(ConnectionData)?,
    )

    def initialize(@red, @green)
    end

    def initialize(@red)
    end

    def initialize(@green)
    end
  end

  class Connections
    JSON.mapping(
      first: {key: "1", type: ConnectionPoint},
      second: {key: "2", type: ConnectionPoint?},
    )

    def initialize(@first, @second)
    end

    def initialize(@first)
    end
  end
end
