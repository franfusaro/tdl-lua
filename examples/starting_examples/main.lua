function fact(n)
    if n == 0 then
        return 1
    else
        return n * fact(n-1)
    end
end

--[[
days = {"Friday", "Saturday", "Sunday" }

print("Today is " .. days[1] .. " and tomorrow will be " .. days[2])

persona = {nombre = "Pepe", edad = 15}

print(persona.nombre .. " tiene " .. persona.edad .. " años")

list = nil
for line in io.lines() do
    list = {next=list, value=line}
end
while (list) do
    print(list.value)
    list = list.next
end
polyline = {color="blue", thickness=2, npoints=4,
    {x=0,   y=0},
    {x=-10, y=0},
    {x=-10, y=1},
    {x=0,   y=1}
}
print(polyline[1].x)

days = {"Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"}
revDays = {}
for i,v in ipairs(days) do
    revDays[v] = i
end
print(revDays.Thursday)

array = {1, 94, 498, 3, 49, 91, 222, 999}

function max(array)
    maxIndex = 1
    currentMax = array[maxIndex]
    for i,v in ipairs(array) do
        if (v > currentMax) then
            currentMax = v
            maxIndex = i
        end
    end
    return currentMax, maxIndex
end
if (max(array) == 999) then
    print "El maximo era 999"
end

print(max(array))

suma = 0
function sumar(...)
    local arg={...}
    for i,v in ipairs(arg) do
        suma = suma + v 
    end
    return suma
end

suma = 
print(sumar(1,4,5,6,1))

_, s = string.find("Hello", "ll") -->dummy variable
print(s)

print(select(2, string.find("Hello","ll")))

function eraseTerminal ()
    io.write("\27[2J")
end

  -- writes an `*' at column `x' , row `y'
function mark (x,y)
    io.write(string.format("\27[%d;%dH*", y, x))
end

  -- Terminal size
  TermSize = {w = 80, h = 24}
  
  -- plot a function
  -- (assume that domain and image are in the range [-1,1])
function plot (f)
    eraseTerminal()
    for i=1,TermSize.w do
       local x = (i/TermSize.w)*2 - 1
       local y = (f(x) + 1)/2 * TermSize.h
       mark(i, y)
    end
    io.read()  -- wait before spoiling the screen
end

plot(function (x) return math.sin(x*2*math.pi) end)

function room1()
    local move = io.read()
    if (move == "south") then
        return room2()
    elseif (move == "west") then
        return room3()
    else
        print("No door there!")
        return room1()
    end
end

function room3()
    local move = io.read()
    if (move == "west") then
        return room4()
    else
        print("No room there!")
        return room3()
    end
end

function room2()
    local move = io.read()
    if (move == "south") then
        return room4()
    else
        print("No room there!")
        return room2()
    end
end

function room4()
    print("You win!")
end

room1()

function allwords()
    local line = io.read()
    local pos = 1
    return function()
        while line do
            local s, e = string.find(line, "%w+", pos)
            if s then
                pos = e + 1
                return string.sub(line, s, e)
            else
                line = io.read()
                pos = 1
            end
        end
        return nil
    end
end

for word in allwords() do
    print(word)
end

function corutinacontarhasta()
    return coroutine.create(function(numeroHasta)
        print("Contando hasta " .. numeroHasta)
        for j=0,numeroHasta do
            print(j)
        end
    end)
end
co = coroutine.create(function ()
    for i = 1,10 do
        coroutine.yield(i)
    end
end)
result = true
result, numeroHasta = coroutine.resume(co)
while(result) do 
    corutinacontar = corutinacontarhasta()
    coroutine.resume(corutinacontar, numeroHasta)
    result, numeroHasta = coroutine.resume(co)
end


function produceItem()
    return 1
end

function send(item)
    print("Sending item " .. item)
    coroutine.yield(item)
end

function receive()
    local result, item = coroutine.resume(producer)
    return item
end

producer = coroutine.create(
    function()
        while(true) do
            item = produceItem()
            send(item)
        end
    end
)

while (true) do
    print(receive())
end

function receive(corutina)
    local result, item = coroutine.resume(corutina)
    return item
end

function send(item)
    coroutine.yield(item)
end

function produceItem()
    return io.read()
end

function filter(producer)
    return coroutine.create(function()
        while(true) do
            item = receive(producer)
            send(item + 2)
        end
    end)
end

function consumer(producer)
    filter = filter(producer)
    while(true) do
        result, item = receive(filter)
        print(item)
    end
end

function producer()
    return coroutine.create(
        function()
            while(true) do
                item = produceItem()
                send(item)
            end
        end
    )
end

consumer(producer())
    ]]--