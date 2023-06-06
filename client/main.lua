ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
  for k,v in pairs(Config.Blips) do
    for i = 1, #v.Pos, 1 do
        RegisterFontFile('font4thai')
        fontId = RegisterFontId('font4thai')
        local blip = AddBlipForCoord(v.Pos[i].coords.x, v.Pos[i].coords.y, v.Pos[i].coords.z)
        SetBlipHighDetail(blip, true)
        SetBlipSprite (blip, v.Pos[i].sprite)
        SetBlipScale  (blip, v.Pos[i].scale or 0.6)
        SetBlipColour (blip, v.Pos[i].color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.Pos[i].text)
        EndTextCommandSetBlipName(blip)
    end 
  end
end)