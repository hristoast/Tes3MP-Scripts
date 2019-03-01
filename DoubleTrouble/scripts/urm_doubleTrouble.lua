local scandir = require("util/scandir")

local doubleTrouble = {}
doubleTrouble.visited = {}
doubleTrouble.config = jsonInterface.load("config/urm_doubleTrouble.json")
doubleTrouble.creatureCheck = {}

for k,v in pairs(doubleTrouble.config.creatures) do
	doubleTrouble.creatureCheck[v] = true
end

local cellFiles = scandir("mp-stuff/data/cell")

for k,v in pairs(cellFiles) do
	doubleTrouble.visited[v] = true
end

function doubleTrouble.isCreature(refId)
	return doubleTrouble.creatureCheck[refId]~=nil
end

function doubleTrouble.duplicate(cellDescription)
	local cellData = LoadedCells[cellDescription].data
	if cellData~=nil then
		local creatures = {}
		for _,uniqueIndex in pairs(cellData.packets.actorList) do
			if cellData.objectData[uniqueIndex].location~=nil and doubleTrouble.isCreature(cellData.objectData[uniqueIndex].refId) then
				table.insert(creatures,uniqueIndex)
			end
		end
		
		tes3mp.LogMessage(enumerations.log.INFO,"Cloning "..#creatures.."("..#cellData.packets.actorList..") creatures:")
		for _,uniqueIndex in pairs(creatures) do
			local creature = cellData.objectData[uniqueIndex]
			tes3mp.LogMessage(enumerations.log.INFO,creature.refId..", ")
			for i=2,doubleTrouble.config.copies do
				logicHandler.CreateObjectAtLocation(cellDescription,creature.location,creature.refId,"spawn")
			end
		end
		tes3mp.LogMessage(enumerations.log.INFO,"\n")
	end
end

function doubleTrouble.OnActorList(isValid,pid,cellDescription)
	if(doubleTrouble.visited[cellDescription]==nil) then
		doubleTrouble.visited[cellDescription] = true
		doubleTrouble.duplicate(cellDescription)
	end
end

eventManager.registerHandler("OnActorList",doubleTrouble.OnActorList)

return doubleTrouble