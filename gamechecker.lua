local targetPlaceIds = {
    [8737899170] = "Pet Simulator 99",
    [15502339080] = "Pet Simulator 99 Trading Plaza",
    [15588442388] = "Pet Simulator 99 Pro Trading Plaza"
}

-- Wait for the local player to be available
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
    wait()
    LocalPlayer = Players.LocalPlayer
end

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui") -- Attach to the player's GUI

local function displayMessage(message, duration)
    -- Create the main TextLabel first
    local textLabel = Instance.new("TextLabel")
    textLabel.Parent = screenGui
    textLabel.Size = UDim2.new(0.5, 0, 0.1, 0)
    textLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    textLabel.Text = message
    textLabel.TextScaled = true -- Scales text to fit [[6]]
    textLabel.BackgroundTransparency = 1

    -- Set text color based on content [[4]]
    if string.sub(message, 1, 6) == "ERROR:" then
        textLabel.TextColor3 = Color3.fromRGB(255, 0, 0) -- Red for errors [[4]]
    else
        textLabel.TextColor3 = Color3.new(1, 1, 1) -- White for normal messages
    end

    textLabel.Font = Enum.Font.Nunito
    textLabel.ZIndex = 1 -- Ensure visibility over shadow

    -- Create shadow TextLabel with offset [[3]]
    local shadowTextLabel = Instance.new("TextLabel")
    shadowTextLabel.Parent = screenGui
    shadowTextLabel.Size = textLabel.Size
    shadowTextLabel.Position = UDim2.new(0.5, 1, 0.5, 1) -- Subtle shadow effect [[3]]
    shadowTextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    shadowTextLabel.Text = message
    shadowTextLabel.TextScaled = true
    shadowTextLabel.BackgroundTransparency = 1
    shadowTextLabel.TextColor3 = Color3.new(0, 0, 0) -- Black shadow [[3]]
    shadowTextLabel.Font = Enum.Font.Nunito
    shadowTextLabel.ZIndex = 0 -- Behind main text [[3]]

    -- Cleanup after duration
    wait(duration)
    shadowTextLabel:Destroy()
    textLabel:Destroy()
end

if not targetPlaceIds[game.PlaceId] then
    -- If validation fails, display an error message and terminate execution
    displayMessage("ERROR: This script is designed for Pet Simulator 99 only!", 5)
    screenGui:Destroy() -- Remove the GUI after displaying the error message
    return -- This stops further code execution
end

local gameName = targetPlaceIds[game.PlaceId]
displayMessage("Game validation passed! Running exploit for " .. gameName .. "...", 5)