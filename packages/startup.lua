local sound = Instance.new('Sound', game.CoreGui)
sound.Name = "Zen Startup Sound"
sound.SoundId = "rbxassetid://6958727243"
sound.Volume = 2
sound.TimePosition = 1
sound:Play()
sound.Stopped:Wait()
game.CoreGui:FindFirstChild('Zen Startup Sound'):Destroy()
