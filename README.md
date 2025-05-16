# Sistema de Coleta de Água

Este é um sistema para FiveM que permite aos jogadores coletarem água usando baldes vazios.

## 📋 Requisitos

- QBCore Framework
- FiveM Server

## 🚀 Instalação

1. Baixe o recurso
2. Coloque a pasta `Coleta_Agua` em sua pasta `resources`
3. Adicione `ensure Coleta_Agua` ao seu `server.cfg`
4. Reinicie seu servidor

## 🎮 Como Usar

1. Obtenha um `empty_bucket` (Balde Vazio)
2. Vá até uma fonte de água no jogo
3. Use o balde vazio enquanto estiver na água
4. Uma animação será reproduzida
5. Após a animação, você receberá entre 1 e 3 `dirty_water_bucket` (Balde com Água Suja)

## ⚙️ Configurações

Todas as configurações podem ser alteradas no arquivo `config.lua`:

```lua
Config.Coleta = {
    TempoColeta = 5000, -- Tempo em ms para coletar água
    Quantidade = {
        Minima = 1, -- Quantidade mínima de água suja
        Maxima = 3  -- Quantidade máxima de água suja
    }
}
```

### Itens Disponíveis

- `empty_bucket`: Balde Vazio
  - Peso: 200
  - Pode ser empilhado: Sim
  - Pode ser usado: Sim

- `dirty_water_bucket`: Balde com Água Suja
  - Peso: 1000
  - Pode ser empilhado: Sim
  - Pode ser usado: Não

- `boiled_water_bottle`: Garrafa de Água Fervida
  - Peso: 200
  - Pode ser empilhado: Sim
  - Pode ser usado: Sim

## 🔧 Personalização

### Notificações
Você pode personalizar todas as mensagens no arquivo `config.lua`:

```lua
Config.Coleta.Notificacoes = {
    SemAgua = "Você precisa estar na água para coletar!",
    SemBalde = "Você precisa de um balde vazio!",
    ColetaSucesso = "Você coletou água suja!",
    ColetaCancelada = "Coleta cancelada!",
    SemBaldeInventario = "Você não tem um balde vazio!"
}
```

### Animação
Você pode alterar a animação de coleta:

```lua
Config.Coleta.Animacao = {
    dict = "amb@world_human_bum_wash@male@high@base",
    anim = "base",
    flags = 49
}
```

## 🐛 Debug

Para ativar o modo debug, altere no `config.lua`:

```lua
Config.Debug = true
```

Isso mostrará mensagens de debug no console do servidor.

## 📝 Dependências

- qb-core
- qb-inventory

## 🤝 Suporte

Se você encontrar algum problema ou tiver sugestões, por favor abra uma issue no GitHub.

## 📄 Licença

Este projeto está sob a licença KING. Veja o arquivo LICENSE para mais detalhes. 