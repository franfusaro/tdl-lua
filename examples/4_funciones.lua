
function f(a, b) 
    return a or b 
end

function ej_f()
    print(f(3)) --> a = 3, b = nil
    print(f(3, 4)) --> a = 3, b = 4
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

function suma_y_mult(a, b)
    return a+b, a*b
end
]]--

function main()
    --
    --
    --
    ej_f()
    ej_funcion()
    print(suma_y_mult(1,5))

end

main()