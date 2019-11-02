
function obtener_valores_ventana()
    return {
        width = 500,
        height = 500,
        color = "Red",
        thickness = 2,
        positions = {10, 3, 48, 9}
    }
end

function ej_4()
    for k,v in pairs(obtener_valores_ventana()) do 
        print(k, v) 
    end
end

function ej_3()
    --[[ Codear
    t = { 10, 5, 3, 9 }
    for k,v in pairs(t) do
        local count = 0
        count = count + 1
        print(k, v, count)
    end
    print(count)
    ]]--
end

function ej_2()
    t = { color1 = "Rojo", color2 = "Verde"}
    print(t.color1, t.color2)
end


function ej_1()
    --[[ Codear
    t = {}
    b = t
    t["x"] = 10
    b.y = 5
    print(t.x)
    print(b.x)

    print(t["y"])
    print(b["y"])
    ]]--
end
function main()
    ej_4()
end

main()