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
end
