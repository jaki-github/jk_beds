Config = {}

Config.Debug = false

Config.AllBeds = {
    beds = {
        { loc = vec4(100.38, -407.2, 39.42, 340.22), label = 'Bed', size = vec3(2, 2.5, 1), icon = 'fa-solid fa-bed', name = 'dead_a', dicname = 'dead' },
        { loc = vec4(104.28, -408.63, 39.41, 339.19), label = 'Bed', size = vec3(2, 2.5, 1), icon = 'fa-solid fa-bed', name = 'dead_a', dicname = 'dead' }
    }
}

Config.TextUI = "Press E to stand up"

function dbug(...)
    if Config.Debug then print('^3[DEBUG]^7', ...) end
end