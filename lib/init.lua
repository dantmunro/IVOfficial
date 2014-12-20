-- ------------------------------------------------------------------
-- Declare a global table of "constants" that can't be changed once set!
 
const = {}
local data = {} 
const_mt = {
	__newindex = function(a,b,c)
		if data[b] == nil then
			if type(c) == 'table' then	-- make that table readonly
				local proxy = {}
				local mt = {       -- create metatable
					__index = c,
					__newindex = function (t,k,v)
						error("Attempt to update read-only table '"..b.."' index '"..tostring(k).."' with '"..tostring(v).."'",2)
						--print("Attempt to update read-only table '"..b.."' index '"..tostring(k).."' with '"..tostring(v).."'")
					end
				}
				setmetatable(proxy, mt)
				data[b]=proxy
			else
				data[b]=c
			end
		else
			error("Illegal assignment to constant '"..tostring(b).."'",2)
			--print("illegal assignment to constant '"..tostring(b).."'")
		end
	end,
 
	__index = function(a,b) return data[b] end
}
setmetatable(const, const_mt)