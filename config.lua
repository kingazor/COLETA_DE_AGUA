Config = {}

-- Configurações gerais
Config.Debug = false -- Ativa/desativa mensagens de debug

-- Configurações de coleta
Config.Coleta = {
    TempoColeta = 5000, -- Tempo em ms para coletar água
    Quantidade = {
        Minima = 1, -- Quantidade mínima de água suja que pode ser coletada
        Maxima = 3  -- Quantidade máxima de água suja que pode ser coletada
    },
    Animacao = {
        dict = "amb@world_human_bum_wash@male@high@base",
        anim = "base",
        flags = 49
    },
    Notificacoes = {
        SemAgua = "Você precisa estar na água para coletar!",
        SemBalde = "Você precisa de um balde vazio!",
        ColetaSucesso = "Você coletou água suja!",
        ColetaCancelada = "Coleta cancelada!",
        SemBaldeInventario = "Você não tem um balde vazio!"
    }
}

-- Configurações de itens
Config.Itens = {
    BaldeVazio = 'empty_bucket',
    BaldeAguaSuja = 'dirty_water_bucket',
    GarrafaAguaFervida = 'boiled_water_bottle'
}

-- Configurações de progressbar
Config.ProgressBar = {
    Nome = "coletar_agua",
    Texto = "Coletando água...",
    Opcoes = {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true
    }
} 