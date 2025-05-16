local QBCore = nil

-- Função para verificar se o jogador está na água
local function IsPlayerInWater()
    local ped = PlayerPedId()
    return IsEntityInWater(ped)
end

-- Função para coletar água
local function ColetarAgua()
    if Config.Debug then
        print("Iniciando coleta de água")
    end

    if not IsPlayerInWater() then
        QBCore.Functions.Notify(Config.Coleta.Notificacoes.SemAgua, 'error')
        return
    end

    local hasItem = QBCore.Functions.HasItem(Config.Itens.BaldeVazio)
    if not hasItem then
        QBCore.Functions.Notify(Config.Coleta.Notificacoes.SemBalde, 'error')
        return
    end

    if Config.Debug then
        print("Jogador está na água e tem o balde")
    end

    -- Animação de coleta
    QBCore.Functions.Progressbar(Config.ProgressBar.Nome, Config.ProgressBar.Texto, Config.Coleta.TempoColeta, false, true, Config.ProgressBar.Opcoes, {
        animDict = Config.Coleta.Animacao.dict,
        anim = Config.Coleta.Animacao.anim,
        flags = Config.Coleta.Animacao.flags,
    }, {}, {}, function() -- Done
        if Config.Debug then
            print("Animação concluída, enviando evento para o servidor")
        end
        TriggerServerEvent('coleta_agua:server:coletarAgua')
        ClearPedTasks(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify(Config.Coleta.Notificacoes.ColetaCancelada, 'error')
    end)
end

-- Registrar o uso do item
RegisterNetEvent('coleta_agua:client:usarBaldeVazio', function()
    if Config.Debug then
        print("Evento de uso do balde vazio recebido")
    end
    ColetarAgua()
end)

-- Inicializar QBCore
CreateThread(function()
    while QBCore == nil do
        QBCore = exports['qb-core']:GetCoreObject()
        Wait(200)
    end
    if Config.Debug then
        print("QBCore inicializado")
    end
end)

-- Registrar o item utilizável
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore = exports['qb-core']:GetCoreObject()
    if Config.Debug then
        print("Jogador carregado, registrando item")
    end
    TriggerServerEvent('coleta_agua:server:registrarItem')
end)

-- Registrar o item utilizável quando o recurso iniciar
CreateThread(function()
    Wait(1000) -- Espera 1 segundo para garantir que tudo está carregado
    if Config.Debug then
        print("Registrando item utilizável")
    end
    TriggerServerEvent('coleta_agua:server:registrarItem')
end) 