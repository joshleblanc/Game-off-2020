require 'app/tiled/map.rb'
require 'app/tiled/layer.rb'
require 'app/tiled/tileset.rb'
require 'app/character.rb'

def tick args

  defaults args

  @character = Character.new("Alex")
  args.outputs.reserved << @character

end

def defaults(args)
  unless @map
    @map = Tiled::Map.new
    @map.load("office1")
    @map.draw(args)
  end
end
