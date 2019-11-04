--simple hello world
print("Hello World!\n")

function foo1(a,b)
    print(a,b)
end

foo1(1)
foo1(1,2)
foo1(1,2,3)


function imprimir(foo)
    foo("hola tdl\n")
end

imprimir(print)
imprimir(io.write)

function foo3()
    a=print
    a("casi terminamos con las funciones en lua\n")
end

foo3()

function ultima(...)
    local contador=0
    for k,v in pairs{...} do
        contador = contador+1
    end
    print('contador quedo en: ', contador,'\n')
end

ultima(1,2,3,4,5,6,7,'hola','chau')
