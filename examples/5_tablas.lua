-- ahora veamos tablas

function table1()
    tabla1 = {A=1, B=11}
    print(tabla1.A)
    print(tabla1['B'])

    copia = tabla1
    copia['C'] = 20
    tabla1['D'] =100

    print(copia.C,' ', tabla1.C)
    print(copia.D,' ', tabla1.D)
end

table1()

function foo5()
    tabla = {1,2,3,5,8}
    for k,v in pairs(tabla) do
        local suma = k+v
        print(k,v,suma)
    end
    print(suma)
end

foo5()

-- HASTA ACA DE TABLAS
--next
