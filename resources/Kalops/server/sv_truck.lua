Items                  = {}
local DataStoresIndex  = {}
local DataStores       = {}
local SharedDataStores = {}
listPlate = {
	taxi        = "TAXI",
	cop         = "LSPD",
	ambulance   = "EMS0",
	mecano	    = "MECA",
}

AddEventHandler('onMySQLReady', function()
  local result = MySQL.Sync.fetchAll('SELECT * FROM truck_inventory')
  local data = nil
  if #result ~= 0 then
    for i=1,#result,1 do
      local plate = result[i].plate
      local owned = result[i].owned
      local data = (result[i].data == nil and {} or json.decode(result[i].data))
      local dataStore   = CreateDataStore(plate, owned, data)
      SharedDataStores[plate] = dataStore
    end
  end
end)

function loadInvent(plate)
  local result = MySQL.Sync.fetchAll('SELECT * FROM truck_inventory WHERE plate = @plate',
  {
    ['@plate'] = plate,
  })
  local data = nil
  if #result ~= 0 then
    for i=1,#result,1 do
      local plate = result[i].plate
      local owned = result[i].owned
      local data = (result[i].data == nil and {} or json.decode(result[i].data))
      local dataStore   = CreateDataStore(plate, owned, data)
      SharedDataStores[plate] = dataStore
    end
  end
end

function getOwnedVehicule(plate)
  local found = false
  for k,v in pairs(listPlate) do
    if string.find(plate,v) ~= nil then
      found = true
      break
    end
  end
  if not found then
    local result = MySQL.Sync.fetchAll('SELECT * FROM owned_vehicles')
    while result == nil do
      Wait(5)
    end
    if result ~= nil and #result > 0 then
      for _,v in pairs(result) do
        local vehicle = v.plate
        if vehicle == plate then
          found = true
          break
        end
      end
    end
  end
  return found
end




function MakeDataStore(plate)
  local data = {}
  local owned = getOwnedVehicule(plate)
  local dataStore   = CreateDataStore(plate, owned, data)
  SharedDataStores[plate] = dataStore
  
  MySQL.Async.execute('INSERT INTO truck_inventory(plate,data,owned) VALUES (@plate,\'{}\',@owned)',
  {
    ['@plate'] = plate,
    ['@owned'] = owned,
  }
  )
  
  loadInvent(plate)
end


function GetSharedDataStore(plate)
  if SharedDataStores[plate] == nil then
    MakeDataStore(plate)
  end
  return SharedDataStores[plate]
end

AddEventHandler('esx_truck:getSharedDataStore', function(plate,cb)
  cb(GetSharedDataStore(plate))
end)

function stringsplit(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t={} ; i=1
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    t[i] = str
    i = i + 1
  end
  return t
end

function CreateDataStore(plate, owned, data)

  local self = {}

  self.plate  = plate
  self.owned = owned
  self.data  = data

  local timeoutCallbacks = {}

  self.set = function(key, val)
    data[key] = val
    self.save()
  end

  self.get = function(key, i)

    local path = stringsplit(key, '.')
    local obj  = self.data

    for i=1, #path, 1 do
      obj = obj[path[i]]
    end

    if i == nil then
      return obj
    else
      return obj[i]
    end

  end

  self.count = function(key, i)

    local path = stringsplit(key, '.')
    local obj  = self.data

    for i=1, #path, 1 do
      obj = obj[path[i]]
    end

    if i ~= nil then
      obj = obj[i]
    end

    if obj == nil then
      return 0
    else
      return #obj
    end

  end

  self.save = function()

    for i=1, #timeoutCallbacks, 1 do
      ESX.ClearTimeout(timeoutCallbacks[i])
      timeoutCallbacks[i] = nil
    end

    local timeoutCallback = ESX.SetTimeout(10000, function()

        MySQL.Async.execute(
          'UPDATE truck_inventory SET data = @data WHERE plate = @plate',
          {
            ['@data'] = json.encode(self.data),
            ['@plate'] = self.plate,
          }
        )

    end)

    table.insert(timeoutCallbacks, timeoutCallback)

  end

  return self

end


function stringsplit(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t={} ; i=1
  for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
    t[i] = str
    i = i + 1
  end
  return t
end

function CreateDataStore(plate, owned, data)

  local self = {}

  self.plate  = plate
  self.owned = owned
  self.data  = data

  local timeoutCallbacks = {}

  self.set = function(key, val)
    data[key] = val
    self.save()
  end

  self.get = function(key, i)

    local path = stringsplit(key, '.')
    local obj  = self.data

    for i=1, #path, 1 do
      obj = obj[path[i]]
    end

    if i == nil then
      return obj
    else
      return obj[i]
    end

  end

  self.count = function(key, i)

    local path = stringsplit(key, '.')
    local obj  = self.data

    for i=1, #path, 1 do
      obj = obj[path[i]]
    end

    if i ~= nil then
      obj = obj[i]
    end

    if obj == nil then
      return 0
    else
      return #obj
    end

  end

  self.save = function()

    for i=1, #timeoutCallbacks, 1 do
      ESX.ClearTimeout(timeoutCallbacks[i])
      timeoutCallbacks[i] = nil
    end

    local timeoutCallback = ESX.SetTimeout(10000, function()

        MySQL.Async.execute(
          'UPDATE truck_inventory SET data = @data WHERE plate = @plate',
          {
            ['@data'] = json.encode(self.data),
            ['@plate'] = self.plate,
          }
        )

    end)

    table.insert(timeoutCallbacks, timeoutCallback)

  end

  return self

end
