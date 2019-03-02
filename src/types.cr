module Blueprint
  class Color
    JSON.mapping(
      r: Int8,
      g: Int8,
      b: Int8,
      a: Int8,
    )
  end

  class ConnectionData
    JSON.mapping(
      entity_id: Int16,
      circuit_id: Int16?,
    )
  end

  class ConnectionPoint
    JSON.mapping(
      red: Array(ConnectionData)?,
      green: Array(ConnectionData)?,
    )
  end

  class Connections
    JSON.mapping(
      first: {key: "1", type: ConnectionPoint},
      second: {key: "2", type: ConnectionPoint?},
    )
  end

  class SpeakerParameters
    JSON.mapping(
      playback_volume: Float64,
      playback_globally: Bool,
      allow_polyphony: Bool,
    )
  end

  class SpeakerAlertParameters
    JSON.mapping(
      show_alert: Bool,
      show_on_map: Bool,
      icon_signal_id: SignalId,
      alert_message: String,
    )
  end

  class Filter
    JSON.mapping(
      name: String,
      count: Int16?,
      mode: String?, # at-least/at-most/exactly
      index: Int16,
    )
  end

  class InfinitySettings
    JSON.mapping(
      remove_unfiltered_items: Bool,
      filters: Array(Filter),
    )
  end

  class Position
    JSON.mapping(
      x: Float64, # Relative to centerpoint of blueprint
      y: Float64, # Relative to centerpoint of blueprint
    )
  end

  class Entity
    JSON.mapping(
      entity_number: Int16,
      name: String,
      position: Position,
      direction: UInt8?,
      connections: Connections?,                 # Circuit connections
      control_behavior: JSON::Any?,              # Type of entity this should behave as (maybe leave blank)
      items: Hash(String, UInt32)?,              # Modules
      recipe: String?,                           # Assembling machine
      bar: Int16?,                               # Container limiting red "bar" slot index
      infinity_settings: InfinitySettings?,      # Infinite Containers
      type: String?,                             # Underground Belt (input/output)
      input_priority: String?,                   # Splitter (left/right/none)
      output_priority: String?,                  # Splitter (left/right/none)
      filter: String?,                           # Splitter
      filters: Array(Filter)?,                   # Filter Inserter
      override_stack_size: UInt8?,               # Inserter
      drop_position: Position?,                  # Inserter
      pickup_position: Position?,                # Inserter
      request_filters: Array(Filter)?,           # Logistic Chests
      request_from_buffers: Bool?,               # Requester Chest
      parameters: SpeakerParameters?,            # Programmable Speaker
      alert_parameters: SpeakerAlertParameters?, # Programmable Speaker
      auto_launch: Bool?,                        # Rocket Silo toggle
      variation: UInt8?,                         # Graphics variation for EntityWithForce/EntityWithOwner
      color: Color?,                             # Train Stations/EntityWithForce/EntityWithOwner
      station: String?,                          # Train Station name
    )
  end

  class Tile
    JSON.mapping(
      name: String,
    )
  end

  class SignalId
    JSON.mapping(
      name: String,
      type: String, # item, fluid, virtual
    )
  end

  class Icon
    JSON.mapping(
      index: Int16,
      signal: SignalId,
    )
  end

  class Book
    JSON.mapping(
      item: String,
      label: String,
      label_color: Color?,
      blueprints: Array(Blueprint),
      active_index: Int16,
      version: UInt64,
    )
  end

  class Blueprint
    JSON.mapping(
      item: String?,
      label: String?,
      label_color: Color?,
      entities: Array(Entity)?,
      tiles: Array(Tile)?,
      icons: Array(Icon)?,
      version: UInt64?,
    )
  end
end
