print("^0[^2SHOP^0] ^7:^0 ^5https://fivemscript.store^7")
function UseItem(source) 
    if getitem(source, Config.Items["Seed"]) >= 1 then 
        removeitem(source, Config.Items["Seed"], 1)
        TriggerClientEvent("ambr4_weed:Seed", source)
        sendToDiscord(Config.Webhook, source, "Seed Planted! ", "\n" .. GetPlayerName(source) .. "(" .. source .. ") \n\n**Seed Type : **" .. Config.Items["Seed"], 15158332)
    end
end

RegisterNetEvent("ambr4_weed:giveSV")
AddEventHandler("ambr4_weed:giveSV", function (menu, id)
    local src = source
    if id == "Water" then
        if getitem(src, Config.Items["Water"]) >= 1 then 
            removeitem(source, Config.Items["Water"], 1)
            TriggerClientEvent("ambr4_weed:giveCl", src, menu, id)
        end
    elseif id == "Fertilizer" then 
        if getitem(src, Config.Items["Fertilizer"]) >= 1 then 
            removeitem(src, Config.Items["Fertilizer"], 1)
            TriggerClientEvent("ambr4_weed:giveCl", src, menu, id)
        end
    elseif id == "Dust" then 
        if getitem(src, Config.Items["Dust"]) >= 1 then 
            removeitem(src, Config.Items["Dust"], 1)
            TriggerClientEvent("ambr4_weed:giveCl", src, menu, id)
        end
    end
end)

RegisterNetEvent("ambr4_weed:Harvest")
AddEventHandler("ambr4_weed:Harvest", function (weed)
    local src = source
    additem(src, Config.Items["Weed"], weed)
    sendToDiscord(Config.Webhook, src, "Harvest is done! ", "\n" .. GetPlayerName(src) .. "(" .. src .. ") \n\n**Harvest quantity : **" .. weed, 15158332)
end)

function sendToDiscord(DiscordLog, source, title, des, color)
    local debuxIMG = "https://cdn.discordapp.com/attachments/994272883918512158/994272896862134362/unknown.png"
    local log = {
        {
            ["title"] = "FIVEM WEED",
            ["color"] = color,
            author = {
                name = "FIVEM WEED",
                icon_url = "https://cdn.discordapp.com/attachments/994272883918512158/994272896862134362/unknown.png",
                url = "https://fivemscript.store"
            },
            ["fields"] = {
                {
                    ["name"] = "> Info:",
                    ["value"] = title,
                    ["inline"] = false
                },
                {
                    ["name"] = "> Version:",
                    ["value"] = "1.0",
                    ["inline"] = false
                },
                {
                    ["name"] = "> Detail:",
                    ["value"] = des,
                    ["inline"] = false
                },
                {
                    ["name"] = "> Website:",
                    ["value"] = 'https://fivemscript.store',
                    ["inline"] = true
                },
                {
                    ["name"] = "> Support:",
                    ["value"] = 'https://fivemscript.store',
                    ["inline"] = true
                },
            },
            ["thumbnail"] = {
                ["url"] = "https://cdn.discordapp.com/attachments/994272883918512158/994273062126092450/unknown.png"
            },
        },
    }
    Citizen.Wait(tonumber(1000))
    PerformHttpRequest(DiscordLog, function(err, text, headers) end, 'POST', json.encode({ username = "DebuX WorkShop", embeds = log, avatar_url = debuxIMG }), { ['Content-Type'] = 'application/json' })
end

