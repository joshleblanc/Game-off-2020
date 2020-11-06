class Character
    attr_sprite

    def initialize(sprite_name)
        @sprite_name = sprite_name
        @state = "idle"
        @x = 11 * 16 * 3 + 24
        @y = 8 * 16 * 3
        @w = 16 * 3
        @h = 32 * 3
        @tile_x = 48
        @tile_y = 0
        @tile_w = 16
        @tile_h = 32
        @path = "sprites/characters/#{@sprite_name}_#{@state}_16x16.png"
    end
end