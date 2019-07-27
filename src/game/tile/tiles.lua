import 'game/tile/tile-sprite'
import 'general/graphics/screen'

TileGrass = class(TileSprite)
function TileGrass:new(type, x, y)
    TileSprite.new(self, 'ground_grass.png', type, 30, 30, x * 30, y * 30, 0, 0, 0)
end

TileTrail = class(TileSprite)
function TileTrail:new(type, x, y)
    TileSprite.new(self, 'trails.png', type, 30, 30, x * 30, y * 30, 0, 0, 1)
end

TileWall = class(TileSprite)
function TileWall:new(x, y, properties)
    TileSprite.new(self, 'walls.png', properties[1], 45, 55, x * 30, y * 30, 0, 0)
end

TileWoodWall = class(TileSprite)
function TileWoodWall:new(x, y, properties)
    TileSprite.new(self, 'wood_walls.png', properties[1], 55, 55, x * 30, y * 30, 0, 0)
end

TileGates = class(TileSprite)
function TileGates:new(x, y, properties)
    TileSprite.new(self, 'gates.png', properties[1], 110, 80, x * 30, y * 30, 30, -10)
end

TileTreeStubs = class(TileSprite)
function TileTreeStubs:new(x, y, properties)
    TileSprite.new(self, 'tree_stubs.png', properties[1], 50, 60, x * 30, y * 30, 0, -15)
end

TileTreeCrown = class(TileSprite)
function TileTreeCrown:new(x, y, properties)
    TileSprite.new(self, 'tree_crowns.png', properties[2] - 1, 105, 92, x * 30, y * 30, 0, -50)

    self.level.update_tiles:add(self)
end

function TileTreeCrown:updateEvent(dt)
    local hw = Screen.width * 0.5
    local hh = Screen.height * 0.5

    local c = self.camera

    local cx = -c.x + hw
    local cy = -c.y + hw

    local ox = math.max(-10, math.min((cx - self.x) / 20, 10))
    local oy = math.max(-10, math.min((cy - self.y) / 40, 10))

    self.dx = -ox
    self.dy = -oy

    -- local dx = -self.dx - ox
    -- local dy = -self.dy - oy

    -- self.dx = self.dx + dx * dt * 10
    -- self.dy = self.dy + dy * dt * 10
end

TileTreeShadow = class(TileSprite)
function TileTreeShadow:new(x, y)
    TileSprite.new(self, 'tree_shadow.png', 0, 150, 105, x * 30, y * 30, 0, 0, 2)
end

TileHouseBottom = class(TileSprite)
function TileHouseBottom:new(x, y)
    TileSprite.new(self, 'house_bottom.png', 0, 150, 150, x * 30, y * 30, 30, 30)
end

TileHouseTop = class(TileSprite)
function TileHouseTop:new(x, y)
    TileSprite.new(self, 'house_top.png', 0, 150, 150, x * 30, y * 30, 30, 30)
end

TileWell = class(TileSprite)
function TileWell:new(x, y, properties)
    TileSprite.new(self, 'well.png', 0, 81, 65, x * 30, y * 30, 0, 0)
end

TileTent = class(TileSprite)
function TileTent:new(x, y, properties)
    -- TileSprite.new(self, 'well.png', 0, 81, 65, x * 30, y * 30, 0, 0)
end

TileChest = class(TileSprite)
function TileChest:new(x, y, properties)
    -- TileSprite.new(self, 'well.png', 0, 81, 65, x * 30, y * 30, 0, 0)
end

TileUnknown = class(TileSprite)
function TileUnknown:new(x, y)
    TileSprite.new(self, 'menu/signs.png', 0, 18, 18, x * 30, y * 30, 0, 0)
end

TileStones20 = class(TileSprite)
function TileStones20:new(x, y, type)
    TileSprite.new(self, 'stones_20.png', type, 20, 20, x, y, -15, -15, 3)
end

TileStones30 = class(TileSprite)
function TileStones30:new(x, y, type)
    TileSprite.new(self, 'stones_30.png', type, 30, 30, x, y, -15, -15, 3)
end

TileBushesBig = class(TileSprite)
function TileBushesBig:new(x, y, type)
    TileSprite.new(self, 'bushes_big.png', type, 55, 55, x, y, -15, -15)
end

TileBushesBananas = class(TileSprite)
function TileBushesBananas:new(x, y, type)
    TileSprite.new(self, 'bushes_bananas.png', type, 60, 60, x, y, -15, -15)
end

TileTelegaBricks = class(TileSprite)
function TileTelegaBricks:new(x, y, type)
    TileSprite.new(self, 'telega_bricks.png', type, 50, 50, x, y, -15, -15)
end

TileRidge = class(TileSprite)
function TileRidge:new(x, y, type)
    TileSprite.new(self, 'ridge.png', type, 70, 70, x, y, -15, -15)
end

TileCactusesSmall = class(TileSprite)
function TileCactusesSmall:new(x, y, type)
    TileSprite.new(self, 'cactuses_small.png', type, 25, 25, x, y, -15, -15)
end

TileSpawnPoint = class(TileSprite)
TileSpawnPoint.Race = enum {
    'Pipyaka',
    'Bombaka',
    'Slonyaka',
    'Ulityaka',
    'Cannon',
    'Kamikaze',
    'Rocketman',
    'Miner',
    'Digger',
    'Spider'
}

TileSpawnPoint.Behaviour = enum {
    'Default',
    'Blind_N_Deaf',
    'Camper',
    'ProtectRadius_3',
    'ProtectRadius_1'
}

TileSpawnPoint.Team = enum {
    'SinglePlayer',
    'Neutral',
    'Team_0',
    'Team_1'
}

function TileSpawnPoint:new(x, y, properties)
    TileSprite.new(self, 'icon.png', 0, 16, 16, x * 30, y * 30, 0, 0)

    self.tile_x = x
    self.tile_y = y
    self.race = properties[1]
    self.total_count = properties[2]
    self.max_alives = properties[3]
    self.spawn_period = properties[4]
    self.behaviour = properties[5]
    self.team = properties[6]
    self.inactive = properties[7] ~= 0
    self.skill_level = properties[8]
    self.can_kill = properties[9] == 0
    self.can_prosecue = properties[10] == 0
    self.fast_spawn = properties[11] ~= 0
end

function TileSpawnPoint:equals(race)
    return self.race == race
end

TileStaticWeapon = class(TileSprite)
TileStaticWeapon.Type = enum {
    'Rake',
    'Bananas_Skin',
    'RabberMelon_Down',
    'RabberMelon_Left',
    'RabberMelon_Up',
    'RabberMelon_Right'
}

function TileStaticWeapon:new(x, y, properties)
    TileSprite.new(self, 'weapons/bomb.png', 0, 30, 30, x * 30, y * 30, 0, 0)

    self.type = properties[1]
    self.spawned = properties[2] ~= 0
end

TileTrampoline = class(TileSprite)
TileTrampoline.Direction = enum {
    'Down',
    'Left',
    'Up',
    'Right'
}

function TileTrampoline:new(x, y, properties)
    TileSprite.new(self, 'trampoline.png', 0, 35, 35, x * 30, y * 30, 0, 0)

    self.direction = properties[1]
    self.distance = properties[2]
end

TileItems = class(TileSprite)
TileItems.Type = enum {
    'Berzerker',
    'Invisibility',
    'Banana',
    'Sock',
    'Brick',
    'RabberMelon',
    'ThrowableMelon',
    'Carrot',
    'Melon',
    'Helmet',
    'Pineapple' ,
    'Bomb',
    'Mine',
    'Coins' 
}

function TileItems:new(x, y, properties)
    TileSprite.new(self, 'menu/signs.png', 0, 18, 18, x * 30, y * 30, 0, 0)

    self.type = properties[1]
    self.invisible = properties[2] ~= 0
    self.spawned = properties[3] ~= 0
end

TileFlagBlue = class(TileSprite)
function TileFlagBlue:new(x, y)
    TileSprite.new(self, 'fx/ctf_flag.png', 0, 17, 20, x * 30, y * 30, 0, 0)
end

TileFlagRed = class(TileSprite)
function TileFlagRed:new(x, y)
    TileSprite.new(self, 'fx/ctf_flag.png', 1, 17, 20, x * 30, y * 30, 0, 0)
end

TileTrigger = class(TileSprite)
TileTrigger.Action = enum {
    'None',
    'TriggerToggle',
    'TriggerExec',
    'LevelWin',
    'LevelLose',
    'PointerSet',
    'PointerDelete',
    'Damage50',
    'TriggerExec_WO_Delay',
    'SP_Active',
    'SP_Deactive',
    'EmitterToggle',
    'WeaponSpawn',
    'ItemSpawn',
    'WallSpawn',
    'WallRemove',
    'CameraSet',
    'CameraSlide',
    'CameraFree',
    'BotRemove',
    'Counter',
    'Message',
    'Damage50_Silent',
    'CameraSlide_Slowest',
    'WeaponRemove'
}

TileTrigger.Executor = enum {
    'Player',
    'Nobody',
    'Anybody',
    'Teams',
    'Neutrals',
    'Team_0',
    'Team_1',
    'OnStart'
}

function TileTrigger:new(x, y, properties)
    -- TileSprite.new(self, 'fx/ctf_flag.png', 1, 17, 20, x * 30, y * 30, 0, 0)

    self.action = properties[1]
    self.executor = properties[2]
    self.width = properties[3]
    self.height = properties[4]
    self.target_x = properties[5]
    self.target_y = properties[6]
    self.trigger_x = properties[7]
    self.trigger_y = properties[8]

    self.delay = properties[11]
end