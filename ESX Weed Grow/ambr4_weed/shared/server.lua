
ESX = exports["es_extended"]:getSharedObject()

-------------------------------- 

ESX.RegisterUsableItem(Config.Items["Seed"], function(src)
    UseItem(src)
end)

RegisterNetEvent('ox_inventory:onUseItem')
AddEventHandler('ox_inventory:onUseItem', function(item)
    if item == Config.Items["Seed"] then
        UseItem(source)
    end
end)

if Config.Inventory == "quasar" then 
    exports['qs-inventory']:CreateUsableItem(Config.Items["Seed"], function(source, item)
        UseItem(source)
    end)
end

-------------------------------- 

function getplayer()
	xPlayer = ESX.GetPlayerFromId
	return xPlayer
end

-------------------------------- 

function nofity(source,text)
    local zrt = getplayer()
    local xPlayer = zrt(source)
    xPlayer.showNotification(text)
end

-------------------------------- 

function removeitem(source,name,count)
    local src = source
    if Config.Inventory == "default" then
        local zrt = getplayer()
        local xPlayer = zrt(src)	
        xPlayer.removeInventoryItem(name,count)
    elseif Config.Inventory == "ox_inventory" then 
        exports.ox_inventory:RemoveItem(src, name, count)
    elseif Config.Inventory == "quasar" then 
        exports['qs-inventory']:RemoveItem(src, name, count)
    else
        -- Other Export
    end
end

-------------------------------- 

function getitem(source,item)
    local src = source
    if Config.Inventory == "default" then
        local zrt = getplayer()
        local xPlayer = zrt(src)	
        item = xPlayer.getInventoryItem(item).count
    elseif Config.Inventory == "ox_inventory" then 
        item = exports.ox_inventory:GetItemCount(src, item)
    elseif Config.Inventory == "quasar" then 
        item = exports['qs-inventory']:GetItemTotalAmount(src, item)
    else
        -- Other Export
    end
    if item == nil then 
        item = 0
    end
    return item 
end

-------------------------------- 

function additem(source,n,c)
    local src = source
    if Config.Inventory == "default" then
        local zrt = getplayer()
        local xPlayer = zrt(src)
        xPlayer.addInventoryItem(n, c)
    elseif Config.Inventory == "ox_inventory" then 
        exports.ox_inventory:AddItem(src, n, c)
    elseif Config.Inventory == "quasar" then 
        exports['qs-inventory']:AddItem(src,n,c)
    else
        -- Other Export
    end
end