require 'app/tiled/map.rb'
require 'app/tiled/layer.rb'
require 'app/tiled/tileset.rb'

def tick args
  defaults args
end

def defaults(args)
  unless @map
    @map = Tiled::Map.new
    @map.load("office1")
    @map.draw(args)
  end
end
