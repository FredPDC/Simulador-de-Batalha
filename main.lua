local utils = require ("utils")
local player = require ("player.player")
local playerActions = require ("player.actions")
local basilisk = require ("basilisk.basilisk")
local basiliskActions = require ("basilisk.actions")
local secondPlayer = require ("player.player2")
local secondPlayerActions = require ("player.actions2")
utils.enableUtf8()

utils.printHeader()


print(string.format("A vida do jogador é %d/%d", player.health, player.maxHealth))

local boss = basilisk
local bossActions = basiliskActions

utils.printCreature(boss)


playerActions.build()
bossActions.build()

while true do
    print()
    print(string.format("Qual será a próxima ação de %s?", player.name))
    local validPlayerActions = playerActions.getValidActions(player, boss)
    for i, action in pairs(validPlayerActions) do
        print(string.format("%d. %s", i, action.descritption))
    end
    local chosenIndex = utils.ask()
    local chosenAction = validPlayerActions[chosenIndex]
    local isActionValid = chosenAction ~= nil

    if isActionValid then 
        chosenAction.execute(player, boss)
    else
        print(string.format("Sua escolha é inválida. %s perdeu a vez.", player.name))
    end

    print()
    local validBossActions = bossActions.getValidActions(player, boss)
    local bossAction = validBossActions[math.random(#validBossActions)] 
    bossAction.execute(player, boss)



    if player.health <= 0 then 
        print()
        print("---------------------------------------------------------------")
        print()
        print(string.format("%s não foi capaz de vencer %s, ela ajoelha no chão e aceita o frio abraço da morte, ela se vai junto com o que seria o ultimo suspiro de sua tribo.", player.name, boss.name))
        print("O Basilisco volta para dentro de sua toca, aguaradando o proximo guerreiro que desafiará sua grandeza.")

    elseif boss.health <= 0 then
        print()
        print("----------------------------------------------------------------")
        print()
        print(string.format("O %s cai e com suas ultimas forças ele solta um utimo rugido, %s levanta sua espada encantada, e com um rosto orgulhoso ela sabe que orgulhou seus ancestrais, a valquiria saiu vitoriosa.", boss.name, player.name))
        print()
    end

    if player.health <= 0 then
        break
    end

    if boss.health <= 0 then 
        break
    end

end

