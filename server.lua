local QBCore = exports['qb-core']:GetCoreObject()

-- Função para gerar quantidade aleatória de água
local function GerarQuantidadeAgua()
    return math.random(Config.Coleta.Quantidade.Minima, Config.Coleta.Quantidade.Maxima)
end

-- Registrar o item utilizável
RegisterNetEvent('coleta_agua:server:registrarItem', function()
    if Config.Debug then
        print("Registrando item utilizável no servidor")
    end
    
    QBCore.Functions.CreateUseableItem(Config.Itens.BaldeVazio, function(source)
        if Config.Debug then
            print("Item utilizado por: " .. source)
        end
        TriggerClientEvent('coleta_agua:client:usarBaldeVazio', source)
    end)
end)

-- Evento para trocar o balde vazio por um balde com água suja
RegisterNetEvent('coleta_agua:server:coletarAgua', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    if not Player then 
        if Config.Debug then
            print("Jogador não encontrado: " .. src)
        end
        return 
    end

    if Config.Debug then
        print("Tentando coletar água com o jogador: " .. src)
    end

    -- Verifica se o jogador tem o balde vazio
    if Player.Functions.RemoveItem(Config.Itens.BaldeVazio, 1) then
        -- Gera quantidade aleatória de água
        local quantidade = GerarQuantidadeAgua()
        
        -- Adiciona o balde com água suja
        Player.Functions.AddItem(Config.Itens.BaldeAguaSuja, quantidade)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Itens.BaldeAguaSuja], 'add')
        TriggerClientEvent('QBCore:Notify', src, Config.Coleta.Notificacoes.ColetaSucesso .. ' (x' .. quantidade .. ')', 'success')
        
        if Config.Debug then
            print("Água coletada com sucesso para o jogador: " .. src .. " (quantidade: " .. quantidade .. ")")
        end
    else
        TriggerClientEvent('QBCore:Notify', src, Config.Coleta.Notificacoes.SemBaldeInventario, 'error')
        if Config.Debug then
            print("Jogador não tem o balde vazio: " .. src)
        end
    end
end)

-- Registrar o item quando o recurso iniciar
CreateThread(function()
    Wait(1000) -- Espera 1 segundo para garantir que tudo está carregado
    if Config.Debug then
        print("Registrando item utilizável na inicialização")
    end
    QBCore.Functions.CreateUseableItem(Config.Itens.BaldeVazio, function(source)
        if Config.Debug then
            print("Item utilizado por: " .. source)
        end
        TriggerClientEvent('coleta_agua:client:usarBaldeVazio', source)
    end)
end) 