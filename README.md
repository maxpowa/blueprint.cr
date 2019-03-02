[![Travis CI](https://img.shields.io/travis/maxpowa/blueprint.cr.svg)](https://travis-ci.org/maxpowa/blueprint.cr)

# blueprint.cr

Factorio blueprint parsing library written in Crystal. Plans to eventually include a blueprint builder API similar to that of `JSON::Builder`.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  blueprint:
    github: maxpowa/blueprint.cr
```

## Usage

```crystal
# Simple script which demonstrates some usage of Blueprint.parse
# Will output counts for each entity included in the blueprint
require "blueprint"

puts "Paste your blueprint string: "
blueprint_str = gets.not_nil!           # Take user input 

result = Blueprint.parse(blueprint_str) # Parse to a Blueprint::Blueprint or Blueprint::Book

required_items = {} of String => Int32

if (result.is_a?(Blueprint::Blueprint)) # Check if its a Blueprint::Blueprint
  result.entities.not_nil!.map do |entity|
    current_count = required_items[entity.name]? || 0
    required_items[entity.name] = current_count + 1
  end
end

puts required_items
```

See [factorio wiki](https://wiki.factorio.com/Blueprint_string_format) for type reference, or look in the [types](src/types) directory.

## Contributing

1. Fork it (<https://github.com/maxpowa/blueprint.cr/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [maxpowa](https://github.com/maxpowa) Max Gurela - creator, maintainer
