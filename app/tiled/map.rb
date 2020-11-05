module Tiled
    class Map
        def load(map)
            json = $gtk.read_file("data/#{map}.json")
            data = $gtk.parse_json(json)


            @compression_level = data["compressionLevel"]
            @height = data["height"]
            @infinite = data["infinite"]
            @layers = data["layers"].map do |layer|
                Layer.from_hash(layer)
            end
            @next_layer_id = data["nextlayerid"]
            @next_object_id = data["nextobjectid"]
            @orientation = data["orientation"]
            @render_order = data["renderorder"]
            @tiled_version = data["tiledversion"]
            @tile_height = data["tileheight"]
            @tilesets = data["tilesets"].map do |tileset|
                Tileset.from_hash(tileset)
            end
            @tile_width = data["tilewidth"]
            @type = data["type"]
            @version = data["version"]
            @width = data["width"]
        end

        def draw(args)
            each_layer do |layer|                    
                layer.each_tile do |tile, x, y|

                    tileset = @tilesets.reverse.find do |tileset|
                        tileset.firstgid < tile
                    end
                    next unless tileset
                    tile_x, tile_y = tileset.tile_position(tile) 

                    scale = 3

                    args.outputs.static_sprites << {
                        x: x * tileset.tile_width * scale,
                        # bottom left is 0,0 for some reason
                        y: (720 - 48) - (y * tileset.tile_height * scale),
                        w: tileset.tile_width * scale,
                        h: tileset.tile_height * scale,
                        path: tileset.image,
                        tile_x: tile_x,
                        tile_y: tile_y,
                        tile_w: tileset.tile_width,
                        tile_h: tileset.tile_height
                    }
                end
            end
        end

        def each_layer(&blk)
            @layers.each do |layer|
                yield layer
            end
        end
    end
end