local utils = {}

function utils.enableUtf8()
    os.execute("chcp 65001")
end

function utils.printHeader()
    print([[
===================================================================================
        
        
        
                                    ==
                                    ||__________________________
                               OOOOO||_________________________/
                                    ||
                                    ==
-----------------------------------------------------------------------------------
                                     SIMULADOR DE BATALHAS!
                                           Boa Sorte!     
===================================================================================
        
                          Você empunha a sua espada e se prepara para lutar!  
                                         É hora da batalha!
        
        ]])
end



function utils.getProgressBar(attribute)
    local fullChar = "■"
    local emptyChar = "□"

    local result = ""    
    for i = 1, 10, 1 do
        if i <= attribute then
            result = result .. fullChar
        else
            result = result .. emptyChar 
        end
    end

    return result
end




function utils.printCreature(creature)
    local healthRate = math.floor((creature.health / creature.maxHealth) * 10)


    print("===========================================================================")
print("|" .. creature.name)
print("|")
print("|" .. creature.descritption)
print("|")
print("|")
print("| Atributos")
print("|     Vida:         " .. utils.getProgressBar (healthRate))
print("|     Ataque:       "  .. utils.getProgressBar (creature.attack))
print("|     Defesa:       "  .. utils.getProgressBar (creature.defense))
print("|     Velocidade:   " .. utils.getProgressBar (creature.speed))
print("===========================================================================")
end




function utils.ask()
    io.write("> ")
    local answer = io.read("*n")
    return answer
end

return utils