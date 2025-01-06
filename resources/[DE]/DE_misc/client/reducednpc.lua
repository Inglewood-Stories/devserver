-------------------------------------------------------------------------------
-- Dispatch Configuration
-------------------------------------------------------------------------------
for i = 1, 15 do 
	EnableDispatchService(i, false)
  end
  
  CreateThread(function()
	SetRandomBoats(false)
	SetRandomTrains(false)
	SetGarbageTrucks(false)
	SetCreateRandomCops(false)
	SetCreateRandomCopsNotOnScenarios(false)
	SetCreateRandomCopsOnScenarios(false)
	SetDispatchCopsForPlayer(PlayerPedId(), false)
	DistantCopCarSirens(false)
  
	while true do
	  Wait(5000)
	  local plyPed = PlayerPedId()
	  local plyPos = GetEntityCoords(plyPed)
	  ClearAreaOfCops(plyPos.x, plyPos.y, plyPos.z, 400.0)
	end
  end)
  
-------------------------------------------------------------------------------
-- Density Configuration
-------------------------------------------------------------------------------
   
Citizen.CreateThread(function()
	while true do
	  	SetVehicleDensityMultiplierThisFrame(Config.VehicleDensity)
	 	SetPedDensityMultiplierThisFrame(Config.PedDensity)
	  	SetRandomVehicleDensityMultiplierThisFrame(Config.VehicleDensity)
	  	SetParkedVehicleDensityMultiplierThisFrame(Config.ParkedVehicleDensity)
	  	SetScenarioPedDensityMultiplierThisFrame(Config.PedDensity, Config.PedDensity)
	  	Citizen.Wait(0)
	end
end)