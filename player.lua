import 'class'
import 'entity'
import 'input'
import 'scene-manager'

local function make_anim(idle, index, frames, speed)
    return { idle = idle, index = index, frames = frames, speed = speed }
end

Player = class(Entity)
function Player:new(tile_x, tile_y)
    Entity.new(self, 'chars/pipyaka.png', tile_x, tile_y, 32, 30, 30)

    self.anims = {
        down   = make_anim(0, 12, 5, 10),
        left   = make_anim(3, 17, 5, 10),
        up     = make_anim(6, 22, 5, 10),
        right  = make_anim(9, 27, 5, 10)
    }
end

function Player:getInputAxis()
    local horizontal = Input:GetAxis 'leftx#1'
    local vertical = Input:GetAxis 'lefty#1'

    if math.abs(horizontal) > math.abs(vertical) then
        vertical = 0
    else
        horizontal = 0
    end

    return horizontal, vertical
end

function Player:update(dt)
    if getScene().weapons.enabled then
        return
    end

    local h, v = self:getInputAxis()

    if Input:GetAnyButton {'left', 'dpleft#1', 'a'} or h < 0 then
        self:move('left')
    end
    
    if Input:GetAnyButton {'right', 'dpright#1', 'd'} or h > 0 then
        self:move('right')
    end
    
    if Input:GetAnyButton {'up', 'dpup#1', 'w'} or v < 0 then
        self:move('up')
    end
    
    if Input:GetAnyButton {'down', 'dpdown#1', 's'} or v > 0 then
        self:move('down')
    end
end