ESX               = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- checking is player have item

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
          if xPlayer ~= nil then
              if xPlayer.getInventoryItem('radio').count == 1 then

                local source = xPlayers[i]
                TriggerClientEvent('ls-radio:onRadioDrop', source)

                break
              end
            end
          end
        end
      end)

      ESX.RegisterServerCallback('ls-radio:getItemAmount', function(source, cb, item)
        local xPlayer = ESX.GetPlayerFromId(source)
        local qtty = xPlayer.getInventoryItem(item).count
        cb(qtty)
    end)