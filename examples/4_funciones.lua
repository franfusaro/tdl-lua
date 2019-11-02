
function f(a, b) 
    return a or b 
end

function ej_f()
    print(f(3)) --> a = 3, b = nil
    print(f(3, 4, 5)) --> a = 3, b = 4 (descarta 5)
end

--[[ Codear
function ej_funcion()
    a = print
    a("Hola")
    imprimir_con_nombre(print)
end

function imprimir_con_nombre(fun)
    fun("Hola Manuel!")
end


function foo(...)
    local var1 = 0;
    for key,value in pairs {...} do
        var1 = var1 + value
    end
    return var1
end
]]--

function main()
    --
    --
    --
    ej_f()
    ej_funcion()
    print(foo(1,2,3,4,5,6,7,8,9))

end

main()