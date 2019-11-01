-- push is a library that will allow us to draw our game at a virtual
-- resolution, instead of however large our window is; used to provide
-- a more retro aesthetic
--
-- https://github.com/Ulydev/push
push = require 'push'

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243


PaddleDimensions = {
    width = 5,
    height = 20
}

LeftPaddle = {
    mode = 'fill',
    dimensions = PaddleDimensions,
    x = 10,
    y = 30
}

RightPaddle = {
    mode = 'fill',
    dimensions = PaddleDimensions,
    x = VIRTUAL_WIDTH - 10,
    y = VIRTUAL_HEIGHT - 120
}

BallDimensions = {
    width = 4,
    height = 4
}

Ball = {
    mode = 'fill',
    dimensions = BallDimensions,
    x = VIRTUAL_WIDTH / 2 - BallDimensions.width / 2,
    y = VIRTUAL_HEIGHT / 2 - BallDimensions.height / 2
}

--[[
    Runs when the game first starts up, only once; used to initialize the game.
]]
function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    -- more "retro-looking" font object we can use for any text
    smallFont = love.graphics.newFont('font.ttf', 8)

    -- set LÖVE2D's active font to the smallFont obect
    love.graphics.setFont(smallFont)

    -- initialize window with virtual resolution
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

--[[
    Keyboard handling, called by LÖVE2D each frame; 
    passes in the key we pressed so we can access.
]]
function love.keypressed(key)
    -- keys can be accessed by string name
    if key == 'escape' or key == 'q' then
        -- function LÖVE gives us to terminate application
        love.event.quit()
    end
end

--[[
    Called after update by LÖVE2D, used to draw anything to the screen, 
    updated or otherwise.
]]
function love.draw()
    -- begin rendering at virtual resolution
    push:apply('start')

    -- clear the screen with a specific color; in this case, a color similar
    -- to some versions of the original Pong
    love.graphics.clear(40, 45, 52, 255)

    -- draw welcome text toward the top of the screen
    love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')

    --
    -- paddles are simply rectangles we draw on the screen at certain points,
    -- as is the ball
    --

    -- Challenge: Render paddles and ball from table data.
    --[[ TODO
    -- render first paddle (left side)
    love.graphics.rectangle(LeftPaddle.mode, LeftPaddle.x, LeftPaddle.y, LeftPaddle.dimensions.width, LeftPaddle.dimensions.height)

    -- render second paddle (right side)
    love.graphics.rectangle(RightPaddle.mode, RightPaddle.x, RightPaddle.y, RightPaddle.dimensions.width, RightPaddle.dimensions.height)

    -- render ball (center)
    love.graphics.rectangle(Ball.mode, Ball.x, Ball.y, Ball.dimensions.width, Ball.dimensions.height)

    -- End Challenge
    ]]--

    -- end rendering at virtual resolution
    push:apply('end')
end
