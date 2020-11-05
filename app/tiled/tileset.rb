module Tiled
    class Tileset
        attr_accessor :firstgid, :tile_width, :tile_height, :image, :name

        def initialize(columns:, firstgid:, image:, image_height:, image_width:, margin:, name:, spacing:, tile_count:, tile_height:, tile_width:)
            @columns = columns
            @firstgid = firstgid
            @image = image[2..-1]
            @image_height = image_height
            @image_width = image_width
            @margin = margin
            @name = name
            @spacing = spacing
            @tile_count = tile_count
            @tile_height = tile_height
            @tile_width = tile_width
        end
    

        def tile_position(tile)
            tile -= firstgid

            tile_x = tile % (@image_width / @tile_width)
            tile_y = (tile / (@image_width / @tile_width)).floor

            x = tile_x * @tile_width
            y = tile_y * @tile_height

            return [x, y]
        end

        def self.from_hash(hash)
            Tileset.new(
                columns: hash["columns"],
                firstgid: hash["firstgid"],
                image: hash["image"],
                image_height: hash["imageheight"],
                image_width: hash["imagewidth"],
                margin: hash["margin"],
                name: hash["name"],
                spacing: hash["spacing"],
                tile_count: hash["tilecount"],
                tile_height: hash["tileheight"],
                tile_width: hash["tilewidth"]
            )
        end
    end
end