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

-- speed at which we will move our paddle; multiplied by dt in update
PADDLE_SPEED = 200

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


function ReloadBall() 
    return {
        mode = 'fill',
        dimensions = BallDimensions,
        x = VIRTUAL_WIDTH / 2 - BallDimensions.width / 2,
        y = VIRTUAL_HEIGHT / 2 - BallDimensions.height / 2,
        xVelocity = (math.random(2) == 1 and -100 or 100), -- Ternary operator (a == b ? 1 : 2)
        yVelocity = math.random(-50, 50)
    }
end

Ball = ReloadBall()

--[[
    Runs when the game first starts up, only once; used to initialize the game.
]]
function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    math.randomseed(os.time())

    -- more "retro-looking" font object we can use for any text
    smallFont = love.graphics.newFont('font.ttf', 8)

    -- larger font for drawing the score on the screen
    scoreFont = love.graphics.newFont('font.ttf', 32)

    -- set LÖVE2D's active font to the smallFont obect
    love.graphics.setFont(smallFont)

    -- initialize window with virtual resolution
    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = false,
        vsync = true
    })

    -- initialize score variables, used for rendering on the screen and keeping
    -- track of the winner
    player1Score = 0
    player2Score = 0

    gameState = 'start'
end

--[[
    Runs every frame, with "dt" passed in, our delta in seconds 
    since the last frame, which LÖVE2D supplies us.
]]
function love.update(dt)

    --[[ TODO
    -- player 1 movement
    if love.keyboard.isDown('w') then
        -- add negative paddle speed to current Y scaled by deltaTime
        LeftPaddle.y = math.max(0, LeftPaddle.y + -PADDLE_SPEED * dt)
    elseif love.keyboard.isDown('s') then
        -- add positive paddle speed to current Y scaled by deltaTime
        LeftPaddle.y = math.min(VIRTUAL_HEIGHT - PaddleDimensions.height, LeftPaddle.y + PADDLE_SPEED * dt)
    end

    -- player 2 movement
    if love.keyboard.isDown('up') then
        -- add negative paddle speed to current Y scaled by deltaTime
        RightPaddle.y = math.max(0, RightPaddle.y + -PADDLE_SPEED * dt)
    elseif love.keyboard.isDown('down') then
        -- add positive paddle speed to current Y scaled by deltaTime
        RightPaddle.y = math.min(VIRTUAL_HEIGHT - PaddleDimensions.height, RightPaddle.y + PADDLE_SPEED * dt)
    end
    ]]--

    if gameState == 'play' then
        Ball.x = Ball.x + Ball.xVelocity * dt
        Ball.y = Ball.y + Ball.yVelocity * dt
    end
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
    elseif key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'play'
        else
            gameState = 'start'
            Ball = ReloadBall()
        end
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
    love.graphics.setFont(smallFont)
    love.graphics.printf('Hello Pong!', 0, 20, VIRTUAL_WIDTH, 'center')

    -- draw score on the left and right center of the screen
    -- need to switch font to draw before actually printing
    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50, 
        VIRTUAL_HEIGHT / 3)
    love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 30,
        VIRTUAL_HEIGHT / 3)

    -- render first paddle (left side), now using the players' Y variable
    love.graphics.rectangle(LeftPaddle.mode, LeftPaddle.x, LeftPaddle.y, LeftPaddle.dimensions.width, LeftPaddle.dimensions.height)

    -- render second paddle (right side)
    love.graphics.rectangle(RightPaddle.mode, RightPaddle.x, RightPaddle.y, RightPaddle.dimensions.width, RightPaddle.dimensions.height)

    -- render ball (center)
    love.graphics.rectangle(Ball.mode, Ball.x, Ball.y, Ball.dimensions.width, Ball.dimensions.height)

    -- end rendering at virtual resolution
    push:apply('end')
end
