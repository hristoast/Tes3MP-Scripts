local cellReset = {}

cellReset.config = jsonInterface.load("config/urm_cellReset.json")

cellReset.excluded = {}
cellReset.resetData = jsonInterface.load(cellReset.config.dataPath)

if cellReset.resetData == nil then
    cellReset.resetData = {}
end

for _,cellDescription in pairs(cellReset.config.excludedCells) do
    cellReset.excluded[cellDescription] = true
end

function cellReset.getGameTime()
    return WorldInstance.data.time.daysPassed*24 + WorldInstance.data.time.hour
end

function cellReset.updateCell(cellDescription)
    if cellReset.resetData[cellDescription] == nil then
        cellReset.resetData[cellDescription] = {}
    end
    cellReset.resetData[cellDescription].gameTime = cellReset.getGameTime()
    cellReset.resetData[cellDescription].osTime = os.time()
    if jsonInterface.save(cellReset.config.dataPath,cellReset.resetData) then
        tes3mp.LogMessage(enumerations.log.INFO,"[urm_cellReset] Successfully updated the cell "..cellDescription.."\n")
    else
        tes3mp.LogMessage(enumerations.log.INFO,"[urm_cellReset] Failed to update the cell "..cellDescription.."\n")
    end
end

function cellReset.needsReset(cellDescription)
    if cellReset.excluded[cellDescription]==nil then
        local data = cellReset.resetData[cellDescription]
        if data~=nil then
            local timePast = 0
            if cellReset.config.useGameTime then
                timePast = cellReset.getGameTime() - data.gameTime
            else
                timePast = (os.time() - data.osTime)/60
            end
            tes3mp.LogMessage(enumerations.log.INFO,"[urm_cellReset] Time passed in "..cellDescription..": "..timePast.."\n")
            return timePast>cellReset.config.resetTime
        end
    end
    return false
end

function cellReset.resetCell(cellDescription)
    local cell = Cell(cellDescription)
    os.remove(tes3mp.GetModDir().."/cell/" .. cell.entryFile)
end

function cellReset.manageCells()
    for cellDescription,data in pairs(cellReset.resetData) do
        if cellReset.needsReset(cellDescription) then
            tes3mp.LogMessage(enumerations.log.INFO,"[urm_cellReset] Resetting "..cellDescription.."\n")
            cellReset.resetCell(cellDescription)
        end
    end
end

function cellReset.OnCellUnload(eventStatus,pid,cellDescription)
    cellReset.updateCell(cellDescription)
end

customEventHooks.registerHandler("OnCellUnload",cellReset.OnCellUnload)
customEventHooks.registerValidator("OnServerPostInit",cellReset.manageCells)

return cellReset
