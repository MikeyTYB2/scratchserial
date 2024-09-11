Config = Config or {}

-- Command typed in to scratch gun serial
Config.command = 'scratchserial'

-- List of weapons eligable to scratch serial off of
Config.Guns = { 
    "WEAPON_PISTOL", 
    "WEAPON_SMG"
}

-- true = dremel item needs to be in players inventory to use command
Config.useitem = true

-- What the serial will display in the inventory (Set to nil if you want to remove serial as a whole)
Config.metadata = 'XXXXXXXXXXXX'


