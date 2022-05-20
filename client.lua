
-- PENTRU SUPPORT INTRA PE SHOP SI T EVOI AJUTA IN CEL MAI SCURT TIMP POSIBIL
-- PENTRU CULORI PUTETI FOLOSI : ~r~ ROSU; ~g~ VERDE; ~b~ ALBASTRU; ~w~ ALB; ~o~ PORTOCALIU; ~p~ MOV; ~y~ GALBEN;
local locatii_texte = {
    [1] = {912.30139160156,-3078.4187011718,-97.123634338378,"Text 1"},
    [2] = {910.8662109375,-3087.2299804688,-97.123580932618,"De aici iti creezi identitatea ->"},
    [3] = {909.29754638672,-3094.4846191406,-97.123588562012,"Text 3"},
    [4] = {907.64611816406,-3103.7265625,-97.123588562012,"Text 4"},
    [5] = {905.38836669922,-3116.3986816406,-97.123588562012,"Text 5"},
    [6] = {903.20251464844,-3131.416015625,-97.123588562012,"De aici te imbraci"},
    [7] = {900.82208251954,-3142.1735839844,-97.123588562012,"Text 7"},
    [8] = {899.58093261718,-3150.1635742188,-97.123588562012,"Text 8"},
    [9] = {898.18176269532,-3156.849609375,-97.123588562012,"Text 9"},
    [10] = {897.48126220704,-3163.005859375,-97.123588562012,"Apropiete de un checkpoint pentru a merge in oras"}
}
local locatii_teleportare_in_oras = {
    {899.93933105468,-3169.1481933594,-97.123588562012},
    {898.07537841796,-3168.7902832032,-97.123588562012},
    {896.12536621094,-3168.4216308594,-97.123588562012},
    {894.21881103516,-3167.857421875,-97.123588562012},
    {892.84643554688,-3167.4467773438,-97.123588562012}
}
local FlaviaNdiveloper = Citizen.CreateThread

FlaviaNdiveloper(function()
    local ticks = 1000
    while true do
        Citizen.Wait(ticks)
    local ped = PlayerPedId()
    local pedcoords = GetEntityCoords(ped)
        
        for i,v in pairs(locatii_texte) do
            local dist = #(vector3(v[1],v[2],v[3]) - pedcoords)
            if GetDistanceBetweenCoords(902.6693725586,-3134.8303222656,-97.123626708984, pedcoords.x, pedcoords.y, pedcoords.z, true) < 90 then
                Draw3DText(pedcoords.x,pedcoords.y,pedcoords.z,"Script realizat de FlaviaN#6721",0.1,6)
                
                DisableControlAction(0,21,true) 
                DisableControlAction(0,24,true) 
                DisableControlAction(0,25,true) 
                DisableControlAction(0,47,true) 
                DisableControlAction(0,203,true) 
                DisableControlAction(0,216,true) 
                DisableControlAction(0,255,true) 
                DisableControlAction(0,298,true) 
                DisableControlAction(0,321,true) 
                DisableControlAction(0,328,true) 
                DisableControlAction(0,18,true) 
                DisableControlAction(0,58,true) 
                DisableControlAction(0,263,true)
                DisableControlAction(0,264,true)
                DisableControlAction(0,257,true)
                DisableControlAction(0,140,true)
                DisableControlAction(0,141,true)
                DisableControlAction(0,142,true)
                DisableControlAction(0,143,true)
                DisableControlAction(0,22,true)
                if dist < 7.5 then
                    ticks = 1
                    Draw3DText(v[1],v[2],v[3],v[4],0.7)
                end
            end
        end
        for i,v in pairs(locatii_teleportare_in_oras) do
            dist = #(vector3(v[1],v[2],v[3]) - pedcoords)
            if dist < 7.5 then
                ticks = 1
                DrawMarker(42, v[1], v[2], v[3], 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 200, 200, 200, 200, 0, 0, 0, 1, 0, 0, 0)
                if dist < 1.2 then
                SetEntityCoords(ped, 340.39419555664,-1090.509765625,30, 0, 0, 0, 0) -- teleportare in oras, va schimbati voi locatia daca nu va placte
                SetEntityHealth(ped, 200) -- in caz ca a suferit vreo rana sau ceva ii dam viata :))
                end
            end
        end
    end
end)

function Draw3DText(x,y,z, text,scl,font) 

    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*scl
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov
   
    if onScreen then
        if font ~= nil then
            font = font
        else
            font = 1
        end
        SetTextScale(1.0*scale, 2.1*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(""..text)
        DrawText(_x,_y)
    end
end

function drawtxt2d(msg, x, y)
    SetTextFont(6)
    SetTextProportional(0)
    SetTextScale(0.6, 0.6)
    SetTextColour(255, 255, 255, 255)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextCentre(1)
    SetTextEntry("STRING")
    AddTextComponentString(msg)
    DrawText(x - 0.0/2, y - 0.0/2 + 0.005)
    Wait(1000)
end
-- PENTRU UNII POATE PAREA EXTREM DE USOR,INSA PENTRU ALTII NU... btw am facut acest script public deoarece am vazut 1-2 cereri si de ce nu...
-- KISS LOVE BaBy
