local gun = script.Parent
local rs = game:GetService("ReplicatedStorage")
local player = game.Players.LocalPlayer
local mouse = player:GetMouse()

local ShootRemote = rs:WaitForChild("Shoot")

local canShoot = true
local fireRate = 0.1

gun.Equipped:Connect(function()
	mouse.Button1Down:Connect(function()
		if not canShoot then return end

		canShoot = false

		local origin = workspace.CurrentCamera.CFrame.Position
		local direction = (mouse.Hit.Position - origin).Unit

		ShootRemote:FireServer(origin, direction)

		
		workspace.CurrentCamera.CFrame *= CFrame.Angles(
			math.rad(math.random(-2,2)),
			math.rad(math.random(-2,2)),
			0
		)

		task.wait(fireRate)
		canShoot = true
	end)
end)
