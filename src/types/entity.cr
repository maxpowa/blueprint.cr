require "random"

module Blueprint
  class Entity
    JSON.mapping(
      entity_number: UInt32,
      name: String,
      position: Position,
      direction: UInt8?,                             # Maybe not a UInt8 N NE E SE S SW W NW
      connections: Connections?,                     # Circuit connections
      control_behavior: JSON::Any?,                  # Type of entity this should behave as (maybe leave blank)
      items: Hash(String, UInt32)?,                  # Modules (item-name, count)
      recipe: String?,                               # Assembling machine
      bar: Int16?,                                   # Container limiting red "bar" slot index (maybe not Int16)
      infinity_settings: InfiniteContainerSettings?, # Infinite Containers
      type: String?,                                 # Underground Belt (input/output)
      input_priority: String?,                       # Splitter (left/right/none)
      output_priority: String?,                      # Splitter (left/right/none)
      filter: String?,                               # Splitter
      filters: Array(Filter)?,                       # Filter Inserter
      override_stack_size: UInt32?,                  # Inserter
      drop_position: Position?,                      # Inserter
      pickup_position: Position?,                    # Inserter
      request_filters: Array(Filter)?,               # Logistic Chests
      request_from_buffers: Bool?,                   # Requester Chest
      parameters: SpeakerParameters?,                # Programmable Speaker
      alert_parameters: SpeakerAlertParameters?,     # Programmable Speaker
      auto_launch: Bool?,                            # Rocket Silo toggle
      variation: UInt8?,                             # Graphics variation for EntityWithForce/EntityWithOwner
      color: Color?,                                 # Train Stations/EntityWithForce/EntityWithOwner
      station: String?,                              # Train Station name
    )
  end

  def initialize(@name : String, @position : Position)
    r = Random.new
    @entity_number = r.next_int
  end
end
