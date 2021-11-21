RegisterCommand("f6", function()
    if SeaLife.job == 'mecano' then
        SeaLife.Mecano.openMecano()
    end
end, false)
RegisterKeyMapping('f6', 'Menu Entreprise', 'keyboard', 'F6')