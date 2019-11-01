Set = {}
Set.mt = {}
function Set.new(t)
    local set = {}
    setmetatable(set, Set.mt)
    for _, l in ipairs(t) do 
        set[l] = true 
    end
    return set
end

function Set.union (a,b)
    local res = Set.new{}
    for k in pairs(a) do res[k] = true end
    for k in pairs(b) do res[k] = true end
    return res
end
  
function Set.intersection (a,b)
    local res = Set.new{}
    for k in pairs(a) do
        res[k] = b[k]
    end
    return res
end

function Set.tostring (set)
    local s = "{"
    local sep = ""
    for e in pairs(set) do
        s = s .. sep .. e
        sep = ", "
    end
    return s .. "}"
end
  
function Set.print (s)
    print(Set.tostring(s))
end

--Show example for __add, __mul and logical operations
function ej_1()

    --[[ CODEAR 
    Set.mt.__add = Set.union
    Set.mt.__mul = Set.intersection
    
    -- Define <=
    Set.mt.__le = function (s1, s2)
        for v in pairs(s1) do
            if (not s2[v]) then
                return false
            end
        end
        return true
    end 
    
    Set.mt.__lt = function (a,b)
        return a <= b and not (b <= a)
    end
    
    Set.mt.__eq = function (a,b)
        return a <= b and b <= a
    end
    
    Set.mt.__tostring = function(s)
        return Set.tostring(s)
    end
    
    s1 = Set.new{4}
    s2 = Set.new{3, 4, 9}
    print(s1 + s2)
    print(s1 * s2)
    
    print(s1 <= s2)
    s1 = Set.new{2, 4}
    s2 = Set.new{4, 10, 2}
    ]]--

    --[[ test examples 
    
    print(s1 <= s2)       --> true
    print(s1 < s2)        --> true
    print(s1 >= s1)       --> true
    print(s1 > s1)        --> false
    print(s1 == s2 * s1)  --> true
    ]]--

end

function main()

end

--Show example for __index and __newindex
function ej_2()
    -- Ejemplo valores por defecto
    
    Window = {}
    
    Window.prototype = {x=0, y=0, width=100, height=100, }
    
    Window.mt = {}
    
    function Window.new (o)
        setmetatable(o, Window.mt)
        return o
    end
    
    --[[ CODEAR
    ]]--
    Window.mt.__index = function (table, key)
        return Window.prototype[key]
    end
    
    Window.mt.__newindex = function(t, key, value)
        if type(value) == "number" then
            rawset(t, key, value * value)
        else
            rawset(t, key, value)
        end
    end
    
    w = Window.new{x=10, y=20}
    print(w.width)    --> 100
    
    
    w.test = 21
    print(w.test)     --> 441   (=21^2)

    w.tdl = "hola"
    print(w.tdl)
    --[[
    ]]--

end

ej_2()