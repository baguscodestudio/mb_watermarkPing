local currentPing = 0

function DrawTextOnScreen(text, x, y)
    SetTextFont(4)
    SetTextScale(0, 0.4)
    SetTextDropShadow(1, 0, 0, 0, 255)
    if currentPing < 60 then
        SetTextColour(0, 255, 0, 255)
    else
        SetTextColour(255, 0, 0, 255)
    end
    SetTextOutline()
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(x, y)
end

RegisterNetEvent('updatePing')
AddEventHandler('updatePing', function(ping)
    currentPing = ping
end)

Citizen.CreateThread(function()
    while true do
        TriggerServerEvent('PingUpdate')
        Citizen.Wait(5000)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        DrawTextOnScreen('Ping: '..currentPing, 0.95, 0.6)
    end
end)