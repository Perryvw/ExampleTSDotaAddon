function __TS__ArrayConcat(arr1, ...)
    local args = ({...})
    local out = {}
    for ____TS_index = 1, #arr1 do
        local val = arr1[____TS_index]
        out[#out + 1] = val
    end
    for ____TS_index = 1, #args do
        local arg = args[____TS_index]
        if pcall(function() return #arg end) and type(arg) ~= "string" then
            local argAsArray = arg
            for ____TS_index = 1, #argAsArray do
                local val = argAsArray[____TS_index]
                out[#out + 1] = val
            end
        else
            out[#out + 1] = arg
        end
    end
    return out
end

function __TS__ArrayEvery(arr, callbackfn)
    do
        local i = 0
        while i < #arr do
            if not callbackfn(_G, arr[i + 1], i, arr) then
                return false
            end
            i = i + 1
        end
    end
    return true
end

function __TS__ArrayFilter(arr, callbackfn)
    local result = {}
    do
        local i = 0
        while i < #arr do
            if callbackfn(_G, arr[i + 1], i, arr) then
                result[#result + 1] = arr[i + 1]
            end
            i = i + 1
        end
    end
    return result
end

function __TS__ArrayForEach(arr, callbackFn)
    do
        local i = 0
        while i < #arr do
            callbackFn(_G, arr[i + 1], i, arr)
            i = i + 1
        end
    end
end

function __TS__ArrayFindIndex(arr, callbackFn)
    do
        local i = 0
        local len = #arr
        while i < len do
            if callbackFn(_G, arr[i + 1], i, arr) then
                return i
            end
            i = i + 1
        end
    end
    return -1
end

function __TS__ArrayIndexOf(arr, searchElement, fromIndex)
    local len = #arr
    if len == 0 then
        return -1
    end
    local n = 0
    if fromIndex then
        n = fromIndex
    end
    if n >= len then
        return -1
    end
    local k
    if n >= 0 then
        k = n
    else
        k = len + n
        if k < 0 then
            k = 0
        end
    end
    do
        local i = k
        while i < len do
            if arr[i + 1] == searchElement then
                return i
            end
            i = i + 1
        end
    end
    return -1
end

function __TS__ArrayMap(arr, callbackfn)
    local newArray = {}
    do
        local i = 0
        while i < #arr do
            newArray[i + 1] = callbackfn(_G, arr[i + 1], i, arr)
            i = i + 1
        end
    end
    return newArray
end

function __TS__ArrayPush(arr, ...)
    local items = ({...})
    for ____TS_index = 1, #items do
        local item = items[____TS_index]
        arr[#arr + 1] = item
    end
    return #arr
end

function __TS__ArrayReverse(arr)
    local i = 0
    local j = #arr - 1
    while i < j do
        local temp = arr[j + 1]
        arr[j + 1] = arr[i + 1]
        arr[i + 1] = temp
        i = i + 1
        j = j - 1
    end
    return arr
end

function __TS__ArrayShift(arr)
    return table.remove(arr, 1)
end

function __TS__ArrayUnshift(arr, ...)
    local items = ({...})
    do
        local i = #items - 1
        while i >= 0 do
            table.insert(arr, 1, items[i + 1])
            i = i - 1
        end
    end
    return #arr
end

function __TS__ArraySort(arr, compareFn)
    if compareFn ~= nil then
        table.sort(arr, function(a, b) return compareFn(_G, a, b) < 0 end)
    else
        table.sort(arr)
    end
    return arr
end

function __TS__ArraySlice(list, first, last)
    local len = #list
    local k
    if first < 0 then
        k = math.max(len + first, 0)
    else
        k = math.min(first, len)
    end
    local relativeEnd = last
    if last == nil then
        relativeEnd = len
    end
    local final
    if relativeEnd < 0 then
        final = math.max(len + relativeEnd, 0)
    else
        final = math.min(relativeEnd, len)
    end
    local out = {}
    local n = 0
    while k < final do
        out[n + 1] = list[k + 1]
        k = k + 1
        n = n + 1
    end
    return out
end

function __TS__ArraySome(arr, callbackfn)
    do
        local i = 0
        while i < #arr do
            if callbackfn(_G, arr[i + 1], i, arr) then
                return true
            end
            i = i + 1
        end
    end
    return false
end

function __TS__ArraySplice(list, start, deleteCount, ...)
    local items = ({...})
    local len = #list
    local actualStart
    if start < 0 then
        actualStart = math.max(len + start, 0)
    else
        actualStart = math.min(start, len)
    end
    local itemCount = #items
    local actualDeleteCount
    if not start then
        actualDeleteCount = 0
    elseif not deleteCount then
        actualDeleteCount = len - actualStart
    else
        actualDeleteCount = math.min(math.max(deleteCount, 0), len - actualStart)
    end
    local out = {}
    do
        local k = 0
        while k < actualDeleteCount do
            local from = actualStart + k
            if list[from + 1] then
                out[k + 1] = list[from + 1]
            end
            k = k + 1
        end
    end
    if itemCount < actualDeleteCount then
        do
            local k = actualStart
            while k < len - actualDeleteCount do
                local from = k + actualDeleteCount
                local to = k + itemCount
                if list[from + 1] then
                    list[to + 1] = list[from + 1]
                else
                    list[to + 1] = nil
                end
                k = k + 1
            end
        end
        do
            local k = len
            while k > len - actualDeleteCount + itemCount do
                list[(k - 1) + 1] = nil
                k = k - 1
            end
        end
    elseif itemCount > actualDeleteCount then
        do
            local k = len - actualDeleteCount
            while k > actualStart do
                local from = k + actualDeleteCount - 1
                local to = k + itemCount - 1
                if list[from + 1] then
                    list[to + 1] = list[from + 1]
                else
                    list[to + 1] = nil
                end
                k = k - 1
            end
        end
    end
    local j = actualStart
    for ____TS_index = 1, #items do
        local e = items[____TS_index]
        list[j + 1] = e
        j = j + 1
    end
    do
        local k = #list - 1
        while k >= len - actualDeleteCount + itemCount do
            list[k + 1] = nil
            k = k - 1
        end
    end
    return out
end

function __TS__ArrayFlat(array, depth)
    if depth == nil then
        depth = 1
    end
    local result = {}
    for ____TS_index = 1, #array do
        local value = array[____TS_index]
        if depth > 0 and type(value) == "table" and value[1] ~= nil then
            result = __TS__ArrayConcat(result, __TS__ArrayFlat(value, depth - 1))
        else
            result[#result + 1] = value
        end
    end
    return result
end

function __TS__ArrayFlatMap(array, callback)
    local result = {}
    do
        local i = 0
        while i < #array do
            local value = callback(_G, array[i + 1], i, array)
            if type(value) == "table" and value[1] ~= nil then
                result = __TS__ArrayConcat(result, value)
            else
                result[#result + 1] = value
            end
            i = i + 1
        end
    end
    return result
end

function __TS__ClassIndex(classTable, key)
    while true do
        local getters = rawget(classTable, "____getters")
        if getters then
            local getter
            getter = getters[key]
            if getter then
                return getter(classTable)
            end
        end
        classTable = rawget(classTable, "____super")
        if not classTable then
            break
        end
        local val = rawget(classTable, key)
        if val ~= nil then
            return val
        end
    end
end

function __TS__ClassNewIndex(classTable, key, val)
    local tbl = classTable
    repeat
        local setters = rawget(tbl, "____setters")
        if setters then
            local setter
            setter = setters[key]
            if setter then
                setter(tbl, val)
                return
            end
        end
        tbl = rawget(tbl, "____super")
    until not (tbl)
    rawset(classTable, key, val)
end

function __TS__FunctionApply(fn, thisArg, argsArray)
    if argsArray then
        return fn(thisArg, (unpack or table.unpack)(argsArray))
    else
        return fn(thisArg)
    end
end

function __TS__FunctionBind(fn, thisArg, ...)
    local boundArgs = ({...})
    return function(____, ...)
        local argArray = ({...})
        do
            local i = 0
            while i < #boundArgs do
                table.insert(argArray, i + 1, boundArgs[i + 1])
                i = i + 1
            end
        end
        return fn(thisArg, (unpack or table.unpack)(argArray))
    end
end

function __TS__FunctionCall(fn, thisArg, ...)
    local args = ({...})
    return fn(thisArg, (unpack or table.unpack)(args))
end

function __TS__Index(classProto)
    return function(tbl, key)
        local proto = classProto
        while true do
            local val = rawget(proto, key)
            if val ~= nil then
                return val
            end
            local getters = rawget(proto, "____getters")
            if getters then
                local getter = getters[key]
                if getter then
                    return getter(tbl)
                end
            end
            local base = rawget(rawget(proto, "constructor"), "____super")
            if not base then
                break
            end
            proto = rawget(base, "prototype")
        end
    end
end

function __TS__InstanceOf(obj, classTbl)
    if obj ~= nil then
        local luaClass = obj.constructor
        while luaClass ~= nil do
            if luaClass == classTbl then
                return true
            end
            luaClass = luaClass.____super
        end
    end
    return false
end

local ____symbolMetatable = {__tostring = function(self)
    if self.description == nil then
        return "Symbol()"
    else
        return "Symbol(" .. tostring(self.description) .. ")"
    end
end}
function __TS__Symbol(self, description)
    return setmetatable({description = description}, ____symbolMetatable)
end
Symbol = {iterator = __TS__Symbol(_G, "Symbol.iterator")}

function __TS__Iterator(iterable)
    local iterator = iterable[Symbol.iterator](iterable)
    return function()
        local result = iterator:next()
        if not result.done then
            return result.value
        else
            return nil
        end
    end
end

Map = Map or {}
Map.__index = Map
Map.prototype = Map.prototype or {}
Map.prototype.__index = Map.prototype
Map.prototype.constructor = Map
function Map.new(...)
    local self = setmetatable({}, Map.prototype)
    self:____constructor(...)
    return self
end
function Map.prototype.____constructor(self, other)
    self.items = {}
    self.size = 0
    if other then
        local iterable = other
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                local value = result.value
                self:set(value[0 + 1], value[1 + 1])
            end
        else
            local arr = other
            self.size = #arr
            for ____TS_index = 1, #arr do
                local kvp = arr[____TS_index]
                self.items[kvp[0 + 1]] = kvp[1 + 1]
            end
        end
    end
end
function Map.prototype.clear(self)
    self.items = {}
    self.size = 0
    return
end
function Map.prototype.delete(self, key)
    local contains = self:has(key)
    if contains then
        self.size = self.size - 1
    end
    self.items[key] = nil
    return contains
end
Map.prototype[Symbol.iterator] = function(self)
    return self:entries()
end
function Map.prototype.entries(self)
    local items = self.items
    local key
    local value
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            key, value = next(items, key)
            return {
                done = not key,
                value = {
                    key,
                    value,
                },
            }
        end,
    }
end
function Map.prototype.forEach(self, callback)
    for key in pairs(self.items) do
        callback(_G, self.items[key], key, self)
    end
    return
end
function Map.prototype.get(self, key)
    return self.items[key]
end
function Map.prototype.has(self, key)
    return self.items[key] ~= nil
end
function Map.prototype.keys(self)
    local items = self.items
    local key
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            key = next(items, key)
            return {
                done = not key,
                value = key,
            }
        end,
    }
end
function Map.prototype.set(self, key, value)
    if not self:has(key) then
        self.size = self.size + 1
    end
    self.items[key] = value
    return self
end
function Map.prototype.values(self)
    local items = self.items
    local key
    local value
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            key, value = next(items, key)
            return {
                done = not key,
                value = value,
            }
        end,
    }
end

function __TS__NewIndex(classProto)
    return function(tbl, key, val)
        local proto = classProto
        while true do
            local setters = rawget(proto, "____setters")
            if setters then
                local setter = setters[key]
                if setter then
                    setter(tbl, val)
                    return
                end
            end
            local base = rawget(rawget(proto, "constructor"), "____super")
            if not base then
                break
            end
            proto = rawget(base, "prototype")
        end
        rawset(tbl, key, val)
    end
end

function __TS__ObjectAssign(to, ...)
    local sources = ({...})
    if to == nil then
        return to
    end
    for ____TS_index = 1, #sources do
        local source = sources[____TS_index]
        for key in pairs(source) do
            to[key] = source[key]
        end
    end
    return to
end

function __TS__ObjectEntries(obj)
    local result = {}
    for key in pairs(obj) do
        result[#result + 1] = {
            key,
            obj[key],
        }
    end
    return result
end

function __TS__ObjectFromEntries(entries)
    local obj = {}
    local iterable = entries
    if iterable[Symbol.iterator] then
        local iterator = iterable[Symbol.iterator](iterable)
        while true do
            local result = iterator:next()
            if result.done then
                break
            end
            local value = result.value
            obj[value[0 + 1]] = value[1 + 1]
        end
    else
        local ____TS_array = entries
        for ____TS_index = 1, #____TS_array do
            local entry = ____TS_array[____TS_index]
            obj[entry[0 + 1]] = entry[1 + 1]
        end
    end
    return obj
end

function __TS__ObjectKeys(obj)
    local result = {}
    for key in pairs(obj) do
        result[#result + 1] = key
    end
    return result
end

function __TS__ObjectValues(obj)
    local result = {}
    for key in pairs(obj) do
        result[#result + 1] = obj[key]
    end
    return result
end

Set = Set or {}
Set.__index = Set
Set.prototype = Set.prototype or {}
Set.prototype.__index = Set.prototype
Set.prototype.constructor = Set
function Set.new(...)
    local self = setmetatable({}, Set.prototype)
    self:____constructor(...)
    return self
end
function Set.prototype.____constructor(self, other)
    self.items = {}
    self.size = 0
    if other then
        local iterable = other
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                self:add(result.value)
            end
        else
            local arr = other
            self.size = #arr
            for ____TS_index = 1, #arr do
                local value = arr[____TS_index]
                self.items[value] = true
            end
        end
    end
end
function Set.prototype.add(self, value)
    if not self:has(value) then
        self.size = self.size + 1
    end
    self.items[value] = true
    return self
end
function Set.prototype.clear(self)
    self.items = {}
    self.size = 0
    return
end
function Set.prototype.delete(self, value)
    local contains = self:has(value)
    if contains then
        self.size = self.size - 1
    end
    self.items[value] = nil
    return contains
end
Set.prototype[Symbol.iterator] = function(self)
    return self:values()
end
function Set.prototype.entries(self)
    local items = self.items
    local key
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            key = next(items, key)
            return {
                done = not key,
                value = {
                    key,
                    key,
                },
            }
        end,
    }
end
function Set.prototype.forEach(self, callback)
    for key in pairs(self.items) do
        callback(_G, key, key, self)
    end
    return
end
function Set.prototype.has(self, value)
    return self.items[value] == true
end
function Set.prototype.keys(self)
    local items = self.items
    local key
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            key = next(items, key)
            return {
                done = not key,
                value = key,
            }
        end,
    }
end
function Set.prototype.values(self)
    local items = self.items
    local key
    return {
        [Symbol.iterator] = function(self)
            return self
        end,
        next = function(self)
            key = next(items, key)
            return {
                done = not key,
                value = key,
            }
        end,
    }
end

WeakMap = WeakMap or {}
WeakMap.__index = WeakMap
WeakMap.prototype = WeakMap.prototype or {}
WeakMap.prototype.__index = WeakMap.prototype
WeakMap.prototype.constructor = WeakMap
function WeakMap.new(...)
    local self = setmetatable({}, WeakMap.prototype)
    self:____constructor(...)
    return self
end
function WeakMap.prototype.____constructor(self, other)
    self.items = {}
    setmetatable(self.items, {__mode = "k"})
    if other then
        local iterable = other
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                local value = result.value
                self:set(value[0 + 1], value[1 + 1])
            end
        else
            local ____TS_array = other
            for ____TS_index = 1, #____TS_array do
                local kvp = ____TS_array[____TS_index]
                self.items[kvp[0 + 1]] = kvp[1 + 1]
            end
        end
    end
end
function WeakMap.prototype.delete(self, key)
    local contains = self:has(key)
    self.items[key] = nil
    return contains
end
function WeakMap.prototype.get(self, key)
    return self.items[key]
end
function WeakMap.prototype.has(self, key)
    return self.items[key] ~= nil
end
function WeakMap.prototype.set(self, key, value)
    self.items[key] = value
    return self
end

WeakSet = WeakSet or {}
WeakSet.__index = WeakSet
WeakSet.prototype = WeakSet.prototype or {}
WeakSet.prototype.__index = WeakSet.prototype
WeakSet.prototype.constructor = WeakSet
function WeakSet.new(...)
    local self = setmetatable({}, WeakSet.prototype)
    self:____constructor(...)
    return self
end
function WeakSet.prototype.____constructor(self, other)
    self.items = {}
    setmetatable(self.items, {__mode = "k"})
    if other then
        local iterable = other
        if iterable[Symbol.iterator] then
            local iterator = iterable[Symbol.iterator](iterable)
            while true do
                local result = iterator:next()
                if result.done then
                    break
                end
                self:add(result.value)
            end
        else
            local ____TS_array = other
            for ____TS_index = 1, #____TS_array do
                local value = ____TS_array[____TS_index]
                self.items[value] = true
            end
        end
    end
end
function WeakSet.prototype.add(self, value)
    self.items[value] = true
    return self
end
function WeakSet.prototype.delete(self, value)
    local contains = self:has(value)
    self.items[value] = nil
    return contains
end
function WeakSet.prototype.has(self, value)
    return self.items[value] == true
end

function __TS__SourceMapTraceBack(fileName, sourceMap)
    _G.__TS__sourcemap = _G.__TS__sourcemap or {}
    _G.__TS__sourcemap[fileName] = sourceMap
    if _G.__TS__originalTraceback == nil then
        _G.__TS__originalTraceback = debug.traceback
        debug.traceback = function(thread, message, level)
            local trace = _G.__TS__originalTraceback(thread, message, level)
            local result, occurrences = string.gsub(trace, "(%S+).lua:(%d+)", function(file, line)
                if _G.__TS__sourcemap[tostring(file) .. ".lua"] and _G.__TS__sourcemap[tostring(file) .. ".lua"][line] then
                    return tostring(file) .. ".ts:" .. tostring(_G.__TS__sourcemap[tostring(file) .. ".lua"][line])
                end
                return tostring(file) .. ".lua:" .. tostring(line)
            end)
            return result
        end
    end
end

function __TS__StringReplace(source, searchValue, replaceValue)
    return ({string.gsub(source, searchValue, replaceValue)})[0 + 1]
end

function __TS__StringSplit(source, separator, limit)
    if limit == nil then
        limit = 4294967295
    end
    if limit == 0 then
        return {}
    end
    local out = {}
    local index = 0
    local count = 0
    if separator == nil or separator == "" then
        while index < #source - 1 and count < limit do
            out[count + 1] = string.sub(source, index + 1, index + 1)
            count = count + 1
            index = index + 1
        end
    else
        local separatorLength = #separator
        local nextIndex = ((string.find(source, separator) or 0) - 1)
        while nextIndex >= 0 and count < limit do
            out[count + 1] = string.sub(source, index + 1, nextIndex)
            count = count + 1
            index = nextIndex + separatorLength
            nextIndex = ((string.find(source, separator, index + 1, true) or 0) - 1)
        end
    end
    if count < limit then
        out[count + 1] = string.sub(source, index + 1)
    end
    return out
end

function __TS__StringConcat(str1, ...)
    local args = ({...})
    local out = str1
    for ____TS_index = 1, #args do
        local arg = args[____TS_index]
        out = tostring(out) .. tostring(arg)
    end
    return out
end

local ____symbolRegistry = {}
function __TS__SymbolRegistryFor(key)
    if not ____symbolRegistry[key] then
        ____symbolRegistry[key] = __TS__Symbol(_G, key)
    end
    return ____symbolRegistry[key]
end
function __TS__SymbolRegistryKeyFor(sym)
    for key in pairs(____symbolRegistry) do
        if ____symbolRegistry[key] == sym then
            return key
        end
    end
end

