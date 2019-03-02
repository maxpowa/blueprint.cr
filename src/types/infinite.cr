module Blueprint
  class InfiniteContainerSettings
    JSON.mapping(
      remove_unfiltered_items: Bool,
      filters: Array(Filter),
    )
  end
end
