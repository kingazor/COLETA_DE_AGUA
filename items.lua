QBShared = QBShared or {}
QBShared.Items = QBShared.Items or {}

QBShared.Items = {
    ['empty_bucket'] = {
        name = 'empty_bucket',
        label = 'Balde Vazio',
        weight = 200,
        type = 'item',
        image = 'empty_bucket.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Um balde vazio que pode ser usado para coletar água'
    },
    ['dirty_water_bucket'] = {
        name = 'dirty_water_bucket',
        label = 'Balde com Água Suja',
        weight = 1000,
        type = 'item',
        image = 'dirty_water_bucket.png',
        unique = false,
        useable = false,
        shouldClose = true,
        combinable = nil,
        description = 'Um balde cheio de água suja que precisa ser limpa'
    },
    ['boiled_water_bottle'] = {
        name = 'boiled_water_bottle',
        label = 'Garrafa de Água Fervida',
        weight = 200,
        type = 'item',
        image = 'boiled_water_bottle.png',
        unique = false,
        useable = true,
        shouldClose = true,
        combinable = nil,
        description = 'Uma garrafa de 2 litros com água fervida, pura e ideal para matar a sede'
    }
} 