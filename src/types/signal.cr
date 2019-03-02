module Blueprint
  class SignalId
    JSON.mapping(
      name: String,
      type: String, # item, fluid, virtual
    )

    def initialize(@name, @type)
    end
  end
end
