-- ~= Dejo esto por aqui porque no me sale en linux

function ej_or_and()
    --shortcut evaluation
    print(4 and 5)         --> 5
    print(nil and 13)      --> nil
    print(false and 13)    --> false
    print(4 or 5)          --> 4
    print(false or 5)      --> 5

    v = nil
    x = v or 8
    print(x)

    v = 4
    x = v or 8
    print(x)

    --a ? b : c
    a = true
    b = 5
    c =10
    v = ((a and b) or c)
    print(v)
end

function ej_asignacion_mult()
    a, b = 10, "Hola"
    c, d = 5
    e, f = 5, "Hola", 90
    print(a, b)
    print(c, d)
    print(e, f)
end

function main()
    ej_if()
end

main()