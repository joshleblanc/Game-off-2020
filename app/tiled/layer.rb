module Tiled
    class Layer
        attr_reader :name

        def initialize(height:, id:, name:, opacity:, type:, visible:, width:, x:, y:, data:)
            @height = height
            @id = id
            @name = name
            @opacity = opacity
            @type = type
            @visible = visible
            @width = width
            @height = height
            @x = x
            @y = y
            @data = data
        end

        def self.from_hash(hash)
            Layer.new(
                height: hash["height"],
                id: hash["id"],
                name: hash["name"],
                opacity: hash["opacity"],
                type: hash["type"],
                visible: hash["visible"],
                width: hash["width"],
                x: hash["x"],
                y: hash["y"],
                data: hash["data"]
            )
        end

        def each_tile(&blk)
            @data.each_with_index do |tile, i|
                x = i % @width
                y = (i / @width.to_f).floor
                yield tile, x, y
            end
        end
    end
end