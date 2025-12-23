------------------------------------------------------------------------
-- ULTIMA ATUALIZAÇÃO: 15/08/2023 --
------------------------------------------------------------------------
-- Para funções do veiculo selecionado

function NetworkRequestEntityControl(Entity)
    if not NetworkIsInSession() or NetworkHasControlOfEntity(Entity) then
        return true
    end
        SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(Entity), true)
    return NetworkRequestControlOfEntity(Entity)
end

--------VRP-----------

Proxy = {}

local proxy_rdata = {}

local function proxy_callback(rvalues)
    proxy_rdata = rvalues
end

local function proxy_resolve(itable, key)
    local iname = getmetatable(itable).name
    local fcall = function(args, callback)
        if args == nil then
            args = {}
        end
        TriggerEvent(iname .. ':proxy', key, args, proxy_callback)
        return table.unpack(proxy_rdata)
    end
    itable[key] = fcall
    return fcall
end

function Proxy.addInterface(name, itable)
    AddEventHandler(name .. ':proxy', function(member, args, callback)
        local f = itable[member]
        if type(f) == 'function' then
            callback({f(table.unpack(args))})
        else
        end
    end)
end

function Proxy.getInterface(name)
    local r = setmetatable({}, {
        __index = proxy_resolve,
        name = name
    })
    return r
end


vRP = Proxy.getInterface('vRP')


function t3xt1(rgfdfger,s1z3,Just1f1cat10n,xx,yy, c3entr3, f0nt3)

    if f0nt3 ~= nil and tonumber(f0nt3) ~= nil then
    SetTextFont(f0nt3)
    else
    SetTextFont(4)
    end
    if c3entr3 then
        SetTextCentre(true)
    end
    SetTextProportional(1)
    SetTextScale(100.0, s1z3)
    SetTextEdge(1, 0, 0,227,255)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringWebsite(rgfdfger)
    EndTextCommandDisplayText(xx, yy)
end

------------------------------------------------------------------------
-- BYPASS --
local JcBypassV2_DrawRect = DrawRect
local JcBypassV2_DrawText = DrawText
local JcBypassV2_DrawLine = DrawLine                    
local JcBypassV2_DrawTextOutline = DrawTextOutline
local JcBypassV2_GiveWeaponToPed = GiveWeaponToPed
local JcBypassV2_GiveWeaponComponentToPed = GiveWeaponComponentToPed
local JcBypassV2_IsControlJustPressed = IsControlJustPressed
local JcBypassV2_print = print
local JcBypassV2_math = math
local JcBypassV2_Juca = {}
local JcBypassV2_GetHashKey = GetHashKey
local JcBypassV2_true = true
local JcBypassV2_false = false
local JcBypassV2_text = text
local JcBypassV2_DrawSprite = DrawSprite
local JcBypassV2_RequestStreamedTextureDict = RequestStreamedTextureDict

local JcBypassV2_Citizen = Citizen
local JcBypassV2_Proxy = Proxy


JcBypassV2_Aba = 'Player'
-- BINDS --
local Binds = {
    ['JcBypassV2_BindMenu'] = {
        ['JcBypassV2_BindMenuUm'] = {['Label'] = 'INSERT',['Value'] = 121},
        ['JcBypassV2_BindMenuDois'] = {['Label'] = 'MOUSE3',['Value'] = 348}
    },
    ['JcBypassV2_Player'] = {
        ['JcBypassV2_BindReviver'] = {['Label'] = 'F3', ['Value'] = 170},
        ['JcBypassV2_BindTeleporte'] = {['Label'] = 'F2', ['Value'] = 289},
        ['JcBypassV2_BindNoclip'] = {['Label'] = 'CAPS', ['Value'] = 137}
    },
    ['JcBypassV2_Veiculo'] = {
        ['JcBypassV2_RepararVeiculo'] = {['Label'] = 'X', ['Value'] = 73},
        ['JcBypassV2_DestrancarVeiculo'] = {['Label'] = 'L', ['Value'] = 182},
        ['JcBypassV2_SuperCarro'] = {['Label'] = 'E', ['Value'] = 38},
    }
}

-- CORES --
local JcBypassV2_CorMenu = {r = 0, g = 255, b = 255}
local JcBypassV2_CorEsquel = {r = 0, g = 255, b = 255}
local JcBypassV2_CorNom = {r = 0, g = 255, b = 255}
local JcBypassV2_CorVeic = {r = 0, g = 255, b = 255}

-- SLIDERS --
local Sliders = {
    ['Aimlock_damage'] = 50, ['AIM-FOV'] = {max = 700, min = 0, value = 100},  ['Aimlock_speed'] = 1000.0, ['Aimlock_hitchance'] = 100,
    ['JcBypassV2_SuperVelocidade'] = {max = 30.0, min = 0.0, value = 5.0},
    ['bypassKeyFUM_Velocidade'] = {max = 1.5, min = 0.0, value = 0.5}, ['player-sdfijsdfjidfsjin-fov'] = {max = 130.0, min = 0.0, value = 50.0},  ['player-sdfijsdfjidfsjin-sensitivity'] = {max = 15.0, min = 0.0, value = 7.0}, ['player-sdfijsdfjidfsjin-speed'] = {max = 2.0, min = 0.0, value = 0.4},
    ['Acelerção'] = {max = 2000.0, min = 10.0, value = 10.0},
    ['esp_distancia'] = {value = 500, max = 1500, min = 0},
    ['Roupas'] = {
        ['Chapeus'] = {value = 1, max = GetNumberOfPedDrawableVariations(PlayerPedId(), 0), min = 0},
        ['Oculos'] = {value = 1, max = GetNumberOfPedDrawableVariations(PlayerPedId(), 1), min = 0},
        ['Mascaras'] = {value = 1, max = GetNumberOfPedDrawableVariations(PlayerPedId(), 1), min = 0},
        ['Cabelos'] = {value = 1, max = GetNumberOfPedDrawableVariations(PlayerPedId(), 2), min = 0},
        ['Maos'] = {value = 1, max = GetNumberOfPedDrawableVariations(PlayerPedId(), 3), min = 0},
        ['Calcas'] = {value = 1, max = GetNumberOfPedDrawableVariations(PlayerPedId(), 4), min = 0},
        ['Acessorios'] = {value = 1, max = GetNumberOfPedDrawableVariations(PlayerPedId(), 5), min = 0},
        ['Sapatos'] = {value = 1, max = GetNumberOfPedDrawableVariations(PlayerPedId(), 6), min = 0},
        ['Camisas'] = {value = 1, max = GetNumberOfPedDrawableVariations(PlayerPedId(), 8), min = 0},
        ['Jaquetas'] = {value = 1, max = GetNumberOfPedDrawableVariations(PlayerPedId(), 11), min = 0}
    }
}

-- IMAGEM ABAS --
local ImagemMenu = CreateRuntimeTextureFromDuiHandle(CreateRuntimeTxd('imagemMenu'), 'imagemMenu2', GetDuiHandle(CreateDui("https://jucafrr.github.io/JcApiInterface/", 1250, 1000)))
local ImagemMenuBackground = CreateRuntimeTextureFromDuiHandle(CreateRuntimeTxd('imagemMenuBackground'), 'imagemMenuBackground2', GetDuiHandle(CreateDui("https://media.discordapp.net/attachments/1098014267317432445/1154110330084008075/Flash_Menu_Video.gif", 937, 750)))
local ImagemBotao = CreateRuntimeTextureFromDuiHandle(CreateRuntimeTxd('imagemBotaoOpc'), 'imagemBotaoOpc2', GetDuiHandle(CreateDui("https://cdn.discordapp.com/attachments/1098014267317432445/1154118188083204218/Copia_de_Background_Botao21.png", 150, 38)))
local ImagemCheckBoxOff = CreateRuntimeTextureFromDuiHandle(CreateRuntimeTxd('imagemCheckBoxOff'), 'imagemCheckBoxOff2', GetDuiHandle(CreateDui("https://media.discordapp.net/attachments/1098014267317432445/1154119783986511902/21.png", 50, 25)))
local ImagemCheckBoxOn = CreateRuntimeTextureFromDuiHandle(CreateRuntimeTxd('imagemCheckBoxOn'), 'imagemCheckBoxOn2', GetDuiHandle(CreateDui("https://cdn.discordapp.com/attachments/1098014267317432445/1154121219482865745/11.png", 50, 25)))
local ImagemBotaoSlider = CreateRuntimeTextureFromDuiHandle(CreateRuntimeTxd('imagemBotaoSlider'), 'imagemBotaoSlider2', GetDuiHandle(CreateDui("https://media.discordapp.net/attachments/1098014267317432445/1154905447728422922/BotaoSlider1.png", 25, 25)))
local ImagemListas = CreateRuntimeTextureFromDuiHandle(CreateRuntimeTxd('ImagemListas'), 'ImagemListas2', GetDuiHandle(CreateDui("https://jucafrr.github.io/JcApiInterface22/", 400, 1000)))

-- ICONES/SPRITES
local JcBypassV2_texturaUm = "mpleaderboard"
local JcBypassV2_Logo = "leaderboard_bikers_icon"

-- MOUSE GAY HEHE --
local dict6 = "mugshots"
local texture5 = "mug01"

------------------------------------------------------------------------

JcBypassV2_print('-- ^4SHARK MENU^7 --')
JcBypassV2_print("-- Olá "..GetPlayerName(PlayerId()).. "Tudo bom?")
JcBypassV2_print("-- Acesse nosso discord e fique por dentro das atualizações do Mod!")
JcBypassV2_print("-- Ultima atualização: [09/08]")
JcBypassV2_print("-- IP Servidor: "..GetCurrentServerEndpoint())

-- DETECTOR DE ANTI-CHEAT
getz = function(value)
    return JcBypassV2_Citizen.InvokeNative(0x4039b485, tostring(value), JcBypassV2_Citizen.ReturnResultAnyway(), JcBypassV2_Citizen.ResultAsString())
end

getsource = function(source)
    if getz(source) == "started" or getz(string.lower(source)) == "started" or getz(string.upper(source)) == "started" then
        return JcBypassV2_true
    else
        return JcBypassV2_false
    end
end
detector = function()
    if getsource('mhacking') or getsource('ThnAC') or getsource('Likizao_ac') or getsource('MQCU') or getsource('mhacking') then
        if getsource('MQCU') then
            JcBypassV2_print('^4>^7 [ANTI-CHEAT]: ^3MQCU Detectado')
            JcBypassV2_print('^4>^7 [BYPASS]:^2ON^7 Use com moderação')
            JcBypassV2_print('^4>>>>>>>>>>> V2 <<<<<<<<<<<')
            menumqcu = true
        end

        if getsource('Likizao_ac') then
            JcBypassV2_print('^4>^7 [ANTI-CHEAT]: ^3Likizao Detectado')
            JcBypassV2_print('^4>^7 [BYPASS]:^2ON^7 Use com moderação')
            JcBypassV2_print('^4>>>>>>>>>>> V2 <<<<<<<<<<<')
            menulikizao = true
        end

        if getsource('mhacking') then
            JcBypassV2_print('^4>^7 [ANTI-CHEAT]: ^3Mhacking Detectado')
            JcBypassV2_print('^4>^7 [BYPASS]:^1OFF^7 Use com moderação')
            JcBypassV2_print('^4>>>>>>>>>>> V2 <<<<<<<<<<<')
        end
    
        if getsource('ThnAC') then
            JcBypassV2_print('^4>^7 [ANTI-CHEAT]: ^3Thunder Detectado')
            JcBypassV2_print('^4>^7 [BYPASS]:^1OFF^7 Use com moderação')
            JcBypassV2_print('^4>>>>>>>>>>> V2 <<<<<<<<<<<')
            thnmeupiru = true
        end
    else
        JcBypassV2_print('^4>^7 [ANTI-CHEAT]: ^3Nenhum')
        JcBypassV2_print('^4>^7 [BYPASS]:^1OFF^7 Use com moderação')
        JcBypassV2_print('^4>>>>>>>>>>> V2 <<<<<<<<<<<')
        menusemac = true
    end
end
detector()
------------------------------------------------------------------------

JcBypassV2_Proxy = {}

local proxy_rdata = {}

local function proxy_callback(rvalues)
    proxy_rdata = rvalues
end

local function proxy_resolve(itable, key)
    local iname = getmetatable(itable).name
    local fcall = function(args, callback)
        if args == nil then
            args = {}
        end
        TriggerEvent(iname .. ':JcBypassV2_Proxy', key, args, proxy_callback)
        return table.unpack(proxy_rdata)
    end
    itable[key] = fcall
    return fcall
end

function JcBypassV2_Proxy.addInterface(name, itable)
    AddEventHandler(name .. ':JcBypassV2_Proxy', function(member, args, callback)
        local f = itable[member]
        if type(f) == 'function' then
            callback({f(table.unpack(args))})
        else
        end
    end)
end

function JcBypassV2_Proxy.getInterface(name)
    local r = setmetatable({}, {
        __index = proxy_resolve,
        name = name
    })
    return r
end

vRP = JcBypassV2_Proxy.getInterface('vRP')

local currAimlockBoneIndex = 1
local selAimlockBoneIndex = 1
local WM = {
    Menu = {
        MenuX = 0.68,
        MenuY = 0.5,
    }
}

local to_add_X = WM.Menu.MenuX-0.5
local to_add_Y = WM.Menu.MenuY-0.5

local keys = {
	['ESC'] = 322,
	['NENHUM'] = 0,
    ['BACKSPACE'] = 177,
	['F1'] = 288,
	['F2'] = 289,
	['F3'] = 170,
	['F5'] = 166,
	['F6'] = 167,
	['F7'] = 168,
	['F8'] = 169,
	['F9'] = 56,
	['F10'] = 57,
	['~'] = 243,
	['1'] = 157,
	['2'] = 158,
	['3'] = 160,
	['4'] = 164,
	['5'] = 165,
	['6'] = 159,
	['7'] = 161,
	['8'] = 162,
	['9'] = 163,
	['-'] = 84,
	['='] = 83,
	['nilsun'] = 37,
	['Q'] = 44,
	['W'] = 32,
	['E'] = 38,
	['R'] = 45,
	['T'] = 245,
	['Y'] = 246,
	['U'] = 303,
	['P'] = 199,
	['['] = 39,
	[']'] = 40,
	['ENTER'] = 18,
	['CAPS'] = 137,
	['A'] = 34,
	['S'] = 8,
	['D'] = 9,
	['F'] = 23,
	['G'] = 47,
	['H'] = 74,
	['K'] = 311,
	['L'] = 182,
	['LEFTSHIFT'] = 21,
	['Z'] = 20,
	['X'] = 73,
	['C'] = 26,
	['V'] = 0,
	['B'] = 29,
	['N'] = 249,
	['M'] = 244,
	[','] = 82,
	['.'] = 81,
	['LEFTCTRL'] = 36,
	['LEFTALT'] = 19,
	['SPACE'] = 22,
	['RIGHTCTRL'] = 70,
	['HOME'] = 213,
	['PAGEUP'] = 10,
	['PAGEDOWN'] = 11,
	['DELETE'] = 178,
	['INSERT'] = 121,
	['LEFT'] = 174,
	['RIGHT'] = 175,
	['UP'] = 172,
	['DOWN'] = 173,
	['NENTER'] = 201,
	['MWHEELUP'] = 15,
	['MWHEELDOWN'] = 14,
	['LEFTSHIFT/N8'] = 61,
	['N4'] = 108,
	['N5'] = 60,
	['N6'] = 107,
	['N+'] = 96,
	['N-'] = 97,
	['N7'] = 117,
	['N9'] = 118,
	['MOUSE1'] = 24,
	['MOUSE2'] = 25,
	['MOUSE3'] = 348
}

local Keys = {
    ['ESC'] = 322,
    ['NENHUM'] = 0,
    ['BACKSPACE'] = 177,
    ['F1'] = 288,
    ['F2'] = 289,
    ['F3'] = 170,
    ['F5'] = 166,
    ['F6'] = 167,
    ['F7'] = 168,
    ['F8'] = 169,
    ['F9'] = 56,
    ['F10'] = 57,
    ['~'] = 243,
    ['1'] = 157,
    ['2'] = 158,
    ['3'] = 160,
    ['4'] = 164,
    ['5'] = 165,
    ['6'] = 159,
    ['7'] = 161,
    ['8'] = 162,
    ['9'] = 163,
    ['-'] = 84,
    ['='] = 83,
    ['nilsun'] = 37,
    ['Q'] = 44,
    ['W'] = 32,
    ['E'] = 38,
    ['R'] = 45,
    ['T'] = 245,
    ['Y'] = 246,
    ['U'] = 303,
    ['P'] = 199,
    ['['] = 39,
    [']'] = 40,
    ['ENTER'] = 18,
    ['CAPS'] = 137,
    ['A'] = 34,
    ['S'] = 8,
    ['D'] = 9,
    ['F'] = 23,
    ['G'] = 47,
    ['H'] = 74,
    ['K'] = 311,
    ['L'] = 182,
    ['LEFTSHIFT'] = 21,
    ['Z'] = 20,
    ['X'] = 73,
    ['C'] = 26,
    ['V'] = 0,
    ['B'] = 29,
    ['N'] = 249,
    ['M'] = 244,
    [','] = 82,
    ['.'] = 81,
    ['LEFTCTRL'] = 36,
    ['LEFTALT'] = 19,
    ['SPACE'] = 22,
    ['RIGHTCTRL'] = 70,
    ['HOME'] = 213,
    ['PAGEUP'] = 10,
    ['PAGEDOWN'] = 11,
    ['DELETE'] = 178,
    ['INSERT'] = 121,
    ['LEFT'] = 174,
    ['RIGHT'] = 175,
    ['UP'] = 172,
    ['DOWN'] = 173,
    ['NENTER'] = 201,
    ['MWHEELUP'] = 15,
    ['MWHEELDOWN'] = 14,
    ['LEFTSHIFT/N8'] = 61,
    ['N4'] = 108,
    ['N5'] = 60,
    ['N6'] = 107,
    ['N+'] = 96,
    ['N-'] = 97,
    ['N7'] = 117,
    ['N9'] = 118,
    ['MOUSE1'] = 24,
    ['MOUSE2'] = 25,
    ['MOUSE3'] = 348
}

--------MENU---------

mouseZone = function(x, y, w, h)  -- APAGAR
    local cx, cy = GetNuiCursorPosition()
    if (cx > x - (w / 2) and cy > y - (h / 2) and cx < x + (w / 2) and cy < y + (h / 2)) then 
        return JcBypassV2_true
    else
        return JcBypassV2_false
    end
end
function nulooooooo()
end
function JcBypassV2_DrawRect(x, y, w, h, r, g, b, a)
    return JcBypassV2_Citizen.InvokeNative(0x3A618A217E5154F0, x, y, w, h, r, g, b, a)
end

local function RotationToDirection(rotation)
    local retz = JcBypassV2_math.rad(rotation.z)
    local retx = JcBypassV2_math.rad(rotation.x)
    local absx = JcBypassV2_math.abs(JcBypassV2_math.cos(retx))
    return vector3(-JcBypassV2_math.sin(retz) * absx, JcBypassV2_math.cos(retz) * absx, JcBypassV2_math.sin(retx))
end

function JcBypassV2_text(nazwa,outline,size,Justification,xx,yy, centre, font)
	if outline then
		SetTextOutline()
	end
	if font ~= nil and tonumber(font) ~= nil then
	SetTextFont(font)
	else
	SetTextFont(0)
	end
	if centre then
		SetTextCentre(JcBypassV2_true)
	end
    SetTextColour(65, 65, 65, 255)
    SetTextProportional(1)
    SetTextScale(100.0, size)
    SetTextEdge(1, 0, 0,227,255)
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringWebsite(nazwa)
    EndTextCommandDisplayText(xx, yy)
end

local function GetTextWidht(str, font, scale) -- APAGAR 
    BeginTextCommandWidth('STRING')
    AddTextComponentSubstringPlayerName(str)
    SetTextFont(font or 4)
    SetTextScale(scale or 0.35, scale or 0.35)
    local length = EndTextCommandGetWidth(1)

    return length
end

local function JcBypassV2_DrawText(JcBypassV2_text, x, y, outline, size, font, centre)
    SetTextFont(0)
    if outline then
        SetTextOutline(JcBypassV2_true)
    end
    if tonumber(font) ~= nil then
        SetTextFont(font)
    end
	if centre then
		SetTextCentre(JcBypassV2_true)
	end
    SetTextScale(100.0, size or 0.23)
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringWebsite(JcBypassV2_text)
    EndTextCommandDisplayText(x, y)
end

drag = {
    [1] = {x = 0.5, y = 0.5, w = 0.510, h = 0.5},
    [2] = {x = 0.5, y = 0.5},
}

function JcBypassV2_Texto157(name,outline,size,Justification,xx,yy, font)
    if outline then
        SetTextOutline()
    end
    if font ~= nil and tonumber(font) ~= nil then
    SetTextFont(font)
    else
    SetTextFont(6)
    end
    SetTextProportional(1)
    SetTextScale(100.0, size)
    SetTextEdge(1, 0, 0,227,255)
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringWebsite(name)
    EndTextCommandDisplayText(xx, yy)
end
 
function JcBypassV2_BotaoAbas(id, nazwa,outline,xx,yy)
    local x,y = GetNuiCursorPosition()
    JcBypassV2_Texto157(nazwa,JcBypassV2_true,0.32,0,xx,yy - 0.01, 4)
    local x,y = GetNuiCursorPosition()
    local x_res, y_res = GetActiveScreenResolution()
    local xx2 = xx
    if id == tab then
    end
    if( (x / x_res) - 0.004 >= xx and (x / x_res) - 0.040 <= xx and (y / y_res) + 0.019 >= yy and (y / y_res) - 0.004 <= yy) and IsDisabledControlJustReleased(0, 92) then
        return JcBypassV2_true
    end
    return JcBypassV2_false
end

function bar(x,y,height)
	JcBypassV2_DrawRect(x,y,0.003,height,161, 161, 161,255)
end

function meucuuuuuuu(x, y, a9, aa, r, g, b, ab) -- APAGAR
    resX, resY = GetActiveScreenResolution()
    local aC, aB = a9 / resX, aa / resY
    local _x, _y = x / resX + aC / 2, y / resY + aB / 2
    JcBypassV2_DrawRect(_x, _y, aC, aB, r, g, b, ab)
end


local JcBypassV2_Juca = {
    MenuX = 0.5, MenuY = 0.5,
    MenuX2 = 0.5, MenuY2 = 0.5,
    MenuW = 0.5, MenuH = 0.5,  
    MasdadaX = 0.5, MasdadaY = 0.5,
}

JcBypassV2_DrawRect_U = function(x, y, w, h, r, g, b, a, order)
	if order then
		SetScriptGfxDrawOrder(order)
	else
		SetScriptGfxDrawOrder(1)
	end
	return JcBypassV2_Citizen.InvokeNative(0x3A618A217E5154F0, x, y, w, h, r, g, b, a)
end

JcBypassV2_Mensagem = function(JcBypassV2_text) --(JcBypassV2_text)
	local enabled = JcBypassV2_true
	local x = 0.0
	local animx = 0.0
	local time = 0
	if enabled then
		JcBypassV2_Citizen.CreateThread(function() 
			while x < 0.048 do 
				JcBypassV2_Citizen.Wait(1) 
				x = x + 0.0025
				JcBypassV2_Citizen.Wait(1)
			end
		end)
		JcBypassV2_Citizen.CreateThread(function()
			while time < 4000 do 
				JcBypassV2_Citizen.Wait(0)
				time = time + 22
				animx = animx + 0.00151
				JcBypassV2_Citizen.Wait(2)
			end
			while time >= 4000 do
				JcBypassV2_Citizen.Wait(0)
				x = x - 0.0025
				if x <= -0.1 then
					enabled = JcBypassV2_false 
				end
				JcBypassV2_Citizen.Wait(1)
			end
		end)
	end
	JcBypassV2_Citizen.CreateThread(function() 
		while enabled do 
            rgb = RGBRainbow(8.0)
			JcBypassV2_Citizen.Wait(0)
            -- MENSAGEM
            JcBypassV2_DrawRect(0.035, 0.938, 0.05, 0.034, 25, 25, 25, 255) -- BACKGROUND "MENSAGEM"
            JcBypassV2_DrawRect(0.085, 0.965, 0.15, 0.034, 20, 20, 20, 255) -- BACKGROUND
            JcBypassV2_DrawRect(0.085, 0.965, 0.145, 0.024, 25, 25, 25, 255) -- BACKGROUND DENTRO
            JcBypassV2_DrawTextFX("MENSAGEM", 0.016, 0.922, JcBypassV2_true, 0.35, 2, JcBypassV2_false, 255, 255, rgb.r) -- NOME
            JcBypassV2_DrawTextFX(JcBypassV2_text, 0.016, 0.95, JcBypassV2_true, 0.35, 4, JcBypassV2_false, 255, 255, 255) -- NOME
            --
		end
	end)

end

JcBypassV2_Citizen.CreateThread(function() while JcBypassV2_true do
    Wait(0)
        if JcBypassV2_AssistirPlayer then
			DisableControlAction(0, 32, JcBypassV2_true) -- W
			DisableControlAction(0, 31, JcBypassV2_true) -- S
			DisableControlAction(0, 30, JcBypassV2_true) -- D
			DisableControlAction(0, 34, JcBypassV2_true) -- A
			DisableControlAction(0, 71, JcBypassV2_true) -- W
			DisableControlAction(0, 72, JcBypassV2_true) -- S
			DisableControlAction(0, 63, JcBypassV2_true) -- D
			DisableControlAction(0, 64, JcBypassV2_true) -- A
                    local spectate_cam = spectate_cam
                    if not spectate_cam ~= nil then
                spectate_cam = CreateCam('DEFAULT_SCRIPTED_Camera', 1)
            end
            RenderScriptCams(1, 0, 0, 1, 1)
            SetCamActive(spectate_cam, JcBypassV2_true)
            local coords = GetEntityCoords(GetPlayerPed(aunsdiandiuadnaid))
            SetCamCoord(spectate_cam, coords.x, coords.y, coords.z + 3)
            local offsetRotX = 0.0
            local offsetRotY = 0.0
            local offsetRotZ = 0.0

            local weapondelay = 0
            while DoesCamExist(spectate_cam) do
                Wait(0)
                if not JcBypassV2_AssistirPlayer then
					
                    DestroyCam(spectate_cam, JcBypassV2_false)
                    ClearTimecycleModifier()
                    RenderScriptCams(JcBypassV2_false, JcBypassV2_false, 0, 1, 0)
                    SetFocusEntity(PlayerPedId())
                    break
                end
                local playerPed = GetPlayerPed(aunsdiandiuadnaid)
                local playerRot = GetEntityRotation(playerPed, 2)

                local rotX = playerRot.x
                local rotY = playerRot.y
                local rotZ = playerRot.z

                offsetRotX = offsetRotX - (GetDisabledControlNormal(1, 2) * 8.0)
                offsetRotZ = offsetRotZ - (GetDisabledControlNormal(1, 1) * 8.0)

                if (offsetRotX > 90.0) then
                    offsetRotX = 90.0
                elseif (offsetRotX < -90.0) then
                    offsetRotX = -90.0
                end
                if (offsetRotY > 90.0) then
                    offsetRotY = 90.0
                elseif (offsetRotY < -90.0) then
                    offsetRotY = -90.0
                end
                if (offsetRotZ > 360.0) then
                    offsetRotZ = offsetRotZ - 360.0
                elseif (offsetRotZ < -360.0) then
                    offsetRotZ = offsetRotZ + 360.0
                end
				DisableControlAction(0, 32, JcBypassV2_true) -- W
				DisableControlAction(0, 31, JcBypassV2_true) -- S
				DisableControlAction(0, 30, JcBypassV2_true) -- D
				DisableControlAction(0, 34, JcBypassV2_true) -- A
				DisableControlAction(0, 71, JcBypassV2_true) -- W
				DisableControlAction(0, 72, JcBypassV2_true) -- S
				DisableControlAction(0, 63, JcBypassV2_true) -- D
				DisableControlAction(0, 64, JcBypassV2_true) -- A
                local x, y, z = table.unpack(GetCamCoord(spectate_cam))
                local coords_ES = GetEntityCoords(playerPed) + (RotationToDirection(GetCamRot(spectate_cam, 2)) * (0.5 * 1.5))

                SetCamCoord(spectate_cam, coords_ES.x-3.0, coords_ES.y, coords_ES.z + 2.0)
                if not Displayed then
                    SetFocusArea(GetCamCoord(spectate_cam).x, GetCamCoord(spectate_cam).y, GetCamCoord(spectate_cam).z,0.0,0.0,0.0)
                    SetCamRot(spectate_cam, offsetRotX, offsetRotY, offsetRotZ, 2)
                end
            end
        end
    end
end)
	
function JcBypassV2_Mouse(aD)
    local x, y = GetNuiCursorPosition()
    local a9, aa = GetActiveScreenResolution()
    if aD then
        x = x / a9
        y = y / aa
    end
    return {x = x, y = y}
end

dragbar = function()
    local c_x, c_y = GetNuiCursorPosition()
    local widht, height = GetActiveScreenResolution()
    c_x = c_x / widht
    c_y = c_y / height
    local res_w, res_h = JcBypassV2_Juca.MenuW - 0.5, JcBypassV2_Juca.MenuH - 0.5

    if (c_x >= JcBypassV2_Juca.MenuX - 0.172 and c_y >= JcBypassV2_Juca.MenuY - 0.20 and c_x <= JcBypassV2_Juca.MenuX + 0.170 + res_w and c_y < JcBypassV2_Juca.MenuY - 0.144 + res_h) and
            IsDisabledControlJustPressed(0, 24) then
        _x = JcBypassV2_Juca.MenuX - c_x
        _y = JcBypassV2_Juca.MenuY - c_y
        dragging_allowed = JcBypassV2_true
    elseif IsDisabledControlReleased(0, 24) then
        dragging_allowed = JcBypassV2_false
    end

    if dragging_allowed then
        JcBypassV2_Juca.MenuX = c_x + _x
        JcBypassV2_Juca.MenuY = c_y + _y
    end
end

function getmousepos()
    local x, y = GetNuiCursorPosition()
    local w, h = GetActiveScreenResolution()
    x = x / w
    y = y / h
    return x, y
end

function JcBypassV2_Mouse(x, y, w, h)
    local X, Y = getmousepos()
    local a, b = w / 2, h / 2
    if (X >= x - a and X <= x + a and Y >= y - b and Y <= y + b) then
        return JcBypassV2_true
    end
end
function JcBypassV2_BotaoOpc(JcBypassV2_text, x, y)
    local drag_X = JcBypassV2_Juca.MenuX - 0.5
    local drag_Y = JcBypassV2_Juca.MenuY - 0.5
    local dW = JcBypassV2_Juca.MenuW - 0.5
    local dH = JcBypassV2_Juca.MenuH - 0.5
    local xx,yy = GetNuiCursorPosition()
    if x == 0.51 then
        x = x + dW / 2
    end
    x = x + drag_X
    y = y + drag_Y
    local resX, resY = GetActiveScreenResolution()
    local tamanhox, tamanhoy = 0.11, 0.034
    JcBypassV2_DrawSprite("imagemBotaoOpc", "imagemBotaoOpc2", x- 0.008, y, tamanhox, tamanhoy, 0.0, 255, 255, 255, 255) -- carrega uma parte do mod
    local width = JcBypassV2_GetWidth(JcBypassV2_text, 4, 0.27)
    if( (xx / resX) + 0.027 >= x and (xx / resX) - 0.032 <= x and (yy / resY) + 0.009 >= y and (yy / resY) - 0.007 <= y) then
        local tamanhox, tamanhoy = 0.12, 0.035
        JcBypassV2_DrawSprite("imagemBotaoOpc", "imagemBotaoOpc2", x- 0.008, y, tamanhox, tamanhoy, 0.0, 255, 255, 255, 255) -- carrega uma parte do mod
        JcBypassV2_DrawTextFX(JcBypassV2_text, x - 0.008, y - 0.012, JcBypassV2_true, 0.32, 4, JcBypassV2_true, 0, 255, 255) -- NOME
    else
        JcBypassV2_DrawTextFX(JcBypassV2_text, x - 0.008, y - 0.012, JcBypassV2_true, 0.32, 4, JcBypassV2_true, 255, 255, 255) -- NOME
    end
    --if JcBypassV2_Mouse(x - 0.004 + width / 2, y, 0.0078125 + width, 0.0138888889) and clicked() then
    if JcBypassV2_Mouse(x - 0.027 + width / 2, y, 0.0078125 + width, 0.0138888889) and clicked() then
        return JcBypassV2_true
    end
end

function Players_Surf_Botao(JcBypassV2_text, x, y)
    local drag_X = JcBypassV2_Juca.MenuX - 0.5
    local drag_Y = JcBypassV2_Juca.MenuY - 0.5
    local dW = JcBypassV2_Juca.MenuW - 0.5
    local dH = JcBypassV2_Juca.MenuH - 0.5
    if x == 0.51 then
        x = x + dW / 2
    end
    x = x + drag_X
    y = y + drag_Y
    local resX, resY = GetActiveScreenResolution()
    local width = JcBypassV2_GetWidth(JcBypassV2_text, 4, 0.27)
    JcBypassV2_DrawText(JcBypassV2_text, x - 0.008, y + 0.001, 0.199, 0, JcBypassV2_false)

    if JcBypassV2_Mouse(x - 0.004 + width / 2, y, 0.0078125 + width, 0.0138888889) and clicked() then
        return JcBypassV2_true
    end
end

function Vehicle_Surf_Botao(JcBypassV2_text, x, y)
    local drag_X = JcBypassV2_Juca.MenuX - 0.5
    local drag_Y = JcBypassV2_Juca.MenuY - 0.5
    local dW = JcBypassV2_Juca.MenuW - 0.5
    local dH = JcBypassV2_Juca.MenuH - 0.5
    if x == 0.51 then
        x = x + dW / 2
    end
    x = x + drag_X
    y = y + drag_Y
    local resX, resY = GetActiveScreenResolution()
    local width = JcBypassV2_GetWidth(JcBypassV2_text, 4, 0.27)
    JcBypassV2_DrawText(JcBypassV2_text, x - 0.008, y + 0.001, 0.199, 0, JcBypassV2_false)

    if JcBypassV2_Mouse(x - 0.004 + width / 2, y, 0.0078125 + width, 0.0138888889) and clicked() then
        return JcBypassV2_true
    end
end

function JcBypassV2_SliderBotao(slider, x, y, dum)
    local drag_X = JcBypassV2_Juca.MenuX - 0.5
    local drag_Y = JcBypassV2_Juca.MenuY - 0.5
    local dW, dH = JcBypassV2_Juca.MenuW - 0.5, JcBypassV2_Juca.MenuH - 0.5
    if x == 0.51 then
        x = x + dW / 2
    end
    x = x + drag_X
    y = y + drag_Y
    x = x + 0.0515
    local wslid = 0.115 + dW / 2
    local resX, resY = GetActiveScreenResolution()
    --
    JcBypassV2_DrawRect((dW / 2) / 2 + x, y, wslid + 0.001, 5 / resY, 60, 60, 60, 255)
    JcBypassV2_DrawRect((dW / 2) / 2 + x + (slider.value / (slider.max / wslid) / 2) - wslid / 2, y, (slider.value / (slider.max / wslid)), 5 / resY, JcBypassV2_CorMenu.r, JcBypassV2_CorMenu.g, JcBypassV2_CorMenu.b, 255)
    JcBypassV2_DrawSprite("imagemBotaoSlider", "imagemBotaoSlider2", (dW / 2) / 2 + x + (slider.value / (slider.max / wslid)) - wslid / 2 - 0.001, y, 0.010, 0.015, 0.0, 255, 255, 255, 255)
    --
    SetTextColour(200, 200, 200, 255)
    SetTextOutline()
    JcBypassV2_DrawText(slider.value, x+0.053, y - 0.017, 0.27, 4, JcBypassV2_true) -- CASO FOR USAR O OUTRO APAGA ESSE

    local CX, CY = getmousepos()
    local sxl, sxr = x - (0.5 - 0.440), x + ((0.557 + (dW / 2)) - 0.5)
    if (JcBypassV2_Mouse((dW / 2) / 2 + x, y, wslid + 0.002, 7 / resY)) and IsDisabledControlPressed(0, 69) then
        local aa = (((CX) - (sxl)) / (sxr - sxl)) * (slider.max - slider.min) - slider.min
        if dum then
            slider.value = tonumber(string.format('%.' .. dum .. 'f', aa))
        else
            slider.value = JcBypassV2_math.floor(aa)
        end
    end
    if slider.value > slider.max then
        slider.value = slider.max
    elseif slider.value < slider.min then
        slider.value = slider.min
    end
end   

--[[function JcBypassV2_TpWay()
    local WaypointHandle = GetFirstBlipInfoId(8)
   
    if DoesBlipExist(WaypointHandle) then
        local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
      for height = 1, 1000 do
        SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords['x'], waypointCoords['y'], height + 0.0)

          local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords['x'], waypointCoords['y'], height + 0.0)

          if foundGround then
            JcBypassV2_Mensagem('Teleportado!')
            SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords['x'], waypointCoords['y'], height + 0.0)

              break
          end

          Wait(0)
      end
  else
    JcBypassV2_Mensagem('Marque o local primeiro!')
  end
end]]
function JcBypassV2_TpWay()
    local ped = PlayerPedId()
	if IsPedInAnyVehicle(ped) then
		ped = GetVehiclePedIsUsing(ped)
    end

	local waypointBlip = GetFirstBlipInfoId(8)
	local x,y,z = table.unpack(Citizen.InvokeNative(0xFA7C7F0AADF25D09,waypointBlip,Citizen.ResultAsVector()))

	local ground
	local groundFound = false
	local groundCheckHeights = { 0.0,50.0,100.0,150.0,200.0,250.0,300.0,350.0,400.0,450.0,500.0,550.0,600.0,650.0,700.0,750.0,800.0,850.0,900.0,950.0,1000.0,1050.0,1100.0 }

	for i,height in ipairs(groundCheckHeights) do
		SetEntityCoordsNoOffset(ped,x,y,height,1,0,0)

		RequestCollisionAtCoord(x,y,z)
		while not HasCollisionLoadedAroundEntity(ped) do
			Citizen.Wait(1)
		end

		Citizen.Wait(20)

		ground,z = GetGroundZFor_3dCoord(x,y,height)
		if ground then
			z = z + 1.0
			groundFound = true
			break;
		end
	end

	if not groundFound then
		z = 1200
		GiveDelayedWeaponToPed(ped,0xFBAB5776,1,0)
	end

	RequestCollisionAtCoord(x,y,z)
	while not HasCollisionLoadedAroundEntity(ped) do
		Citizen.Wait(1)
	end

	SetEntityCoordsNoOffset(ped,x,y,z,1,0,0)
end

function GetScreenSize()
    local x, y = GetActiveScreenResolution()
    return {x = x, y = y}
end

-- INICIO COLOR PICKER
local function aE(m, x, y, aF, aG, aH, aI)
    SetTextScale(0.0, tonumber(aF))
    SetTextFont(aH)
    if aG then
        SetTextOutline()
    end
    SetTextCentre(aI)
    BeginTextCommandDisplayText('STRING')
    AddTextComponentSubstringWebsite(m)
    EndTextCommandDisplayText(x, y)
    return EndTextCommandGetWidth(JcBypassV2_true)
end
function hsvToRgb(h, s, v, a)
    local r, g, b
    local i = JcBypassV2_math.floor(h * 6);
    local f = h * 6 - i;
    local p = v * (1 - s);
    local q = v * (1 - f * s);
    local t = v * (1 - (1 - f) * s);
    i = i % 6
    if i == 0 then 
        r, g, b = v, t, p
    elseif i == 1 then 
        r, g, b = q, v, p
    elseif i == 2 then 
        r, g, b = p, v, t
    elseif i == 3 then 
        r, g, b = p, q, v
    elseif i == 4 then 
        r, g, b = t, p, v
    elseif i == 5 then 
        r, g, b = v, p, q
    end
    return JcBypassV2_math.floor(r * 255 + 0.5), JcBypassV2_math.floor(g * 255 + 0.5), JcBypassV2_math.floor(b * 255 + 0.5), JcBypassV2_math.floor(a * 255)
end
function Rectangle(x, y, a9, aa, r, g, b, ab)
    local ac, ad = GetActiveScreenResolution()
    local ae, af = 1 / ac, 1 / ad
    local ag, ah = ae * x, af * y
    local ai, aj = ae * a9, af * aa
    JcBypassV2_DrawRect(ag + ai / 2, ah + aj / 2, ai, aj, r, g, b, ab)
end
function Gradient(x, y, a9, aa, aq, r, g, b, ab, ar, as, at, au)
    if aq then
        for l = 0, a9, 2 do
            if l > a9 then
                break
            end
            local ab = JcBypassV2_math.floor((au - ab) / a9 * l + ab)
            Rectangle(x + l, y, l < a9 - 1 and 2 or 1, aa, ar, as, at, JcBypassV2_math.abs(ab))
        end
    else
        for l = 0, aa, 2 do
            if l > aa then
                break
            end
            local ab = JcBypassV2_math.floor((au - ab) / aa * l + ab)
            Rectangle(x, y + l, a9, l < aa - 1 and 2 or 1, ar, as, at, JcBypassV2_math.abs(ab))
        end
    end
end
function HSVGradient(x, y, a9, aa, aq, av, aw, ax, ay, az, aA)
    Rectangle(x, y, a9, aa, hsvToRgb(av, aw, ax, 1))
    if aq then
        for l = 0, a9, 2 do
            local aB, ak, al = (ay - av) / a9 * l + av, (az - aw) / a9 * l + aw, (aA - ax) / a9 * l + ax
            Rectangle(x + l, y, 2, aa, hsvToRgb(aB, ak, al, 1))
        end
    else
        for l = 0, aa, 2 do
            local aB, ak, al = (ay - av) / aa * l + av, (az - aw) / aa * l + aw, (aA - ax) / aa * l + ax
            Rectangle(x, y + l, a9, 2, hsvToRgb(aB, ak, al, 1))
        end
    end
end
function JcBypassV2_ColorPicker(R, aJ, aK)
    colorpicker = JcBypassV2_true
    open = JcBypassV2_false
    local R = {
        HSV = {H = 0, S = 0, V = 0},
        RGB = {R = R, G = aJ, B = aK},
        Held = {Hue = JcBypassV2_false, Value = JcBypassV2_false},
        Opened = JcBypassV2_false,
        Turned = JcBypassV2_true
    }
    while R.Turned do
        DisableControlAction(0, 1, JcBypassV2_true)
        DisableControlAction(0, 2, JcBypassV2_true)
        DisableControlAction(0, 142, JcBypassV2_true)
        DisableControlAction(0, 322, JcBypassV2_true)
        DisableControlAction(0, 106, JcBypassV2_true)
        DisableControlAction(0, 25, JcBypassV2_true)
        DisableControlAction(0, 24, JcBypassV2_true)
        DisableControlAction(0, 257, JcBypassV2_true)
        DisableControlAction(0, 32, JcBypassV2_true)
        DisableControlAction(0, 31, JcBypassV2_true)
        DisableControlAction(0, 30, JcBypassV2_true)
        DisableControlAction(0, 34, JcBypassV2_true)
        DisableControlAction(0, 23, JcBypassV2_true)
        DisableControlAction(0, 22, JcBypassV2_true)
        DisableControlAction(0, 16, JcBypassV2_true)
        DisableControlAction(0, 17, JcBypassV2_true)
        local a9, aa = GetScreenSize().x, GetScreenSize().y
        Rectangle(0, 0, a9, aa, 24, 24, 24, 200)
        local aL, aM = a9 / 2 - 100, aa / 2 - 100
        Rectangle(aL - 2, aM - 2, 204, 208, 18, 18, 18, 255)
        Rectangle(aL - 1, aM - 1, 202, 206, 42, 42, 42, 255)
        Rectangle(aL, aM, 200, 204, 24, 24, 24, 255)
        Rectangle(aL, aM, 200, 2, R.RGB.R, R.RGB.G, R.RGB.B, 255)
        local r, g, b, ab = hsvToRgb(R.HSV.H, R.HSV.S, R.HSV.V, 1)
        local r, g, b, ab = hsvToRgb(R.HSV.H, 1, 1, 1)
        Rectangle(aL + 10, aM + 10, 160, 180, r, g, b, 255)
        Gradient(aL + 10, aM + 10, 160, 180, JcBypassV2_true, r, g, b, 0, 255, 255, 255, 255)
        Gradient(aL + 10, aM + 10, 160, 180, JcBypassV2_false, 255, 0, 0, 0, 0, 255, 255, 255)
        HSVGradient(aL + 20 + 160, aM + 10, 10, 180, JcBypassV2_false, 0, 1, 1, 1, 1, 1)
        local x, y = GetNuiCursorPosition()
        local a9, aa = GetScreenSize().x, GetScreenSize().y
        local aL, aM = a9 / 2 - 100, aa / 2 - 100
        if JcBypassV2_IsControlJustPressed(0, 18) then
            if x > aL + 20 and x < aL + 20 + 160 and y > aM + 10 and y < aM + 10 + 180 then
                R.Held.Value = JcBypassV2_true
            end
            if x > aL + 20 + 160 and x < aL + 20 + 160 + 10 and y > aM + 10 and y < aM + 10 + 180 then
                R.Held.Hue = JcBypassV2_true
            end
            if x < aL or x > aL + 200 or y < aM or y > aM + 200 then
                R.Opened = JcBypassV2_false
            end
        end
        if IsDisabledControlPressed(0, 69) then
            if R.Held.Value then
                local aN = x - aL - 10
                local aO = y - aM - 60
                R.HSV.S = JcBypassV2_math.clamp(aN / 180, 0, 1)
                R.HSV.V = JcBypassV2_math.clamp(1 - aO / 160, 0, 1)
            end
            if R.Held.Hue then
                local aP = y - aM + -19
                R.HSV.H = JcBypassV2_math.clamp(aP / 180, 0, 1)
            end
            local r, g, b, ab = hsvToRgb(R.HSV.H, R.HSV.S, R.HSV.V, 1)
            R.RGB.R, R.RGB.G, R.RGB.B = r, g, b
        else
            if R.Held.Value then
                R.Opened = JcBypassV2_false
            end
            R.Held.Value = JcBypassV2_false
            R.Held.Hue = JcBypassV2_false
        end
        local x, y = GetNuiCursorPosition() local x_ez, y_ez = GetActiveScreenResolution() local cursorX, cursorY = x / x_ez, y / y_ez
        JcBypassV2_CursorMouse('o', cursorX, cursorY, 0.30, 0, JcBypassV2_true, 255, 255, 255)
        if IsDisabledControlJustPressed(0, 191) then
            open = JcBypassV2_true
            colorpicker = JcBypassV2_false
            R.Turned = JcBypassV2_false
            return R.RGB.R, R.RGB.G, R.RGB.B
        end
        Wait(0)
    end
end
-- FIM COLOR PICKER

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(
        function()
            local iter, id = initFunc()
            if not id or id == 0 then
                disposeFunc(iter)
                return
            end
            local enum = {handle = iter, destructor = disposeFunc}
            setmetatable(enum, entityEnumerator)
            local next = JcBypassV2_true
            repeat
                coroutine.yield(id)
                next, id = moveFunc(iter)
            until not next
            enum.destructor, enum.handle = nil, nil
            disposeFunc(iter)
        end
    )
end
function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

---------FUNCTIONS----------

function RGBRainbow(frequency)
    local result = {}
    local curtime = GetGameTimer() / 1000

    result.r = JcBypassV2_math.floor(JcBypassV2_math.sin(curtime * frequency + 0) * 127 + 128)
    result.g = JcBypassV2_math.floor(JcBypassV2_math.sin(curtime * frequency + 2) * 127 + 128)
    result.b = JcBypassV2_math.floor(JcBypassV2_math.sin(curtime * frequency + 4) * 127 + 128)

    return result
end

function JcBypassV2_Kontrols(Disable)
    DisableControlAction(0, 1, JcBypassV2_true)
    DisableControlAction(0, 2, JcBypassV2_true)
    DisableControlAction(0, 142, JcBypassV2_true)
    DisableControlAction(0, 322, JcBypassV2_true)
    DisableControlAction(0, 106, JcBypassV2_true)
    DisableControlAction(0, 25, JcBypassV2_true)
    DisableControlAction(0, 24, JcBypassV2_true)
    DisableControlAction(0, 257, JcBypassV2_true)
    DisableControlAction(0, 23, JcBypassV2_true)
    DisableControlAction(0, 16, JcBypassV2_true)
    DisableControlAction(0, 17, JcBypassV2_true)

end
   
--[[quit to game
RestartGame()
ForceSocialClubUpdate()]]

function JcBypassV2_Reviver()
    if GetEntityHealth(PlayerPedId()) < 200 then
        SetEntityHealth(PlayerPedId(), 200)
    end
end
function JcBypassV2_ReviverTESTES()
    if GetEntityHealth(PlayerPedId()) < 200 then
        SetEntityHealth(PlayerPedId(), 50)
    end
end
function JcBypassV2_TpVeiculoProx()
    local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 8000.0, 0, 70)
    local vehnamenotif = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId())))
    if not IsPedInAnyVehicle(PlayerPedId()) then
        JcBypassV2_Mensagem('Teleportado! ')
    end
    if vehicle ~= nil then
        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
    end
    if IsPedInAnyVehicle(PlayerPedId()) then
    end
end
function JcBypassV2_SpawnVeiculo()
    -- ADICIONE O BYPASS DE VEICULO AQUI (TIAGO)
    local veiculoescolhido = imputtext('Nome Do Veiculo', '', 25)

    JcBypassV2_Mensagem("Veiculo escolhido: " ..veiculoescolhido)
end
function JcBypassV2_TrazerVeiculo()
    for i = 1, 500 do
        Vehicle = selVehicle
        NetworkRequestEntityControl(Vehicle)
        cd = GetEntityCoords(PlayerPedId())
        savedpos1 = GetEntityCoords(PlayerPedId())
        SetEntityRotation(Vehicle, GetCamRot(Camera, 2), 0.0, GetCamRot(Camera, 2), 0.0, true)
        SetEntityCoords(selVehicle, savedpos1)
        Delay = GetGameTimer() + 500
    end
end
function JcBypassV2_IrVeiculo()
    for i = 0, 120 do
        Vehicle = selVehicle
        NetworkRequestEntityControl(Vehicle)
        NetworkRequestControlOfEntity(Vehicle)
        SetPedIntoVehicle(PlayerPedId(), Vehicle, -1)
    end
end
function JcBypassV2_Curar()
    if GetEntityHealth(PlayerPedId()) < 200 then
        SetEntityHealth(PlayerPedId(), 200)
    end
    if GetEntityHealth(PlayerPedId()) < 400 then
        SetEntityHealth(PlayerPedId(), 400)
    end
    if GetEntityHealth(PlayerPedId()) ~= 0 then 
    end
end
function JcBypassV2_Suicidio()
    SetEntityHealth(PlayerPedId(), 0)
end

function getmousepos()
    local x, y = GetNuiCursorPosition()
    local w, h = GetActiveScreenResolution()
    x = x / w ; y = y / h 
    return x, y
end
function TPveh()
    local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 100.0, 0, 70)
    local vehnamenotif = GetDisplayNameFromVehicleModel(GetEntityModel(GetVehiclePedIsIn(PlayerPedId())))
    if not IsPedInAnyVehicle(PlayerPedId()) then
    end
    if vehicle ~= nil then
        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)

    end
end

function colorpicker_botao(x, y,r,g,b)
    drag_x = JcBypassV2_Juca.MenuX-0.5
    drag_y = JcBypassV2_Juca.MenuY-0.5
    local dW, dH = JcBypassV2_Juca.MenuW-0.5, JcBypassV2_Juca.MenuH-0.5
    local drag_x, drag_y = JcBypassV2_Juca.MenuX-0.5, JcBypassV2_Juca.MenuY-0.5
    if x == 0.51 then 
        x = x + dW
        else
            x = x + dW/2
    end
    x = x + drag_x ; y = y + drag_y
    x = x + 0.111
    local resX, resY = GetActiveScreenResolution()
    JcBypassV2_DrawRect(x,y,0.0080,0.0138, r, g, b, 255)
    --JcBypassV2_DrawRect(x-0.004, y, 0.007, 0.013, r, g, b, 255)
    if JcBypassV2_Mouse(x, y, 0.0080, 0.0138) and clicked() then 
        return JcBypassV2_true 
    end
end


function JcBypassV2_GetWidth(str, font, scale)
    BeginTextCommandWidth('STRING')
    AddTextComponentSubstringPlayerName(str)
    SetTextFont(font or 4)
    SetTextScale(scale or 0.35, scale or 0.35)
    local length = EndTextCommandGetWidth(1)
    return length
end

   
function JcBypassV2_DrawText(JcBypassV2_text, x, y, scale, font, center)
    SetTextScale(0.0, scale)
    SetTextFont(font)
    SetTextCentre(center)

    BeginTextCommandDisplayText('TWOSTRINGS')
    AddTextComponentString(JcBypassV2_text)
    EndTextCommandDisplayText(x, y-0.011)
end

function JcBypassV2_CursorMouse(JcBypassV2_text, x, y, scale, font, outline, center, r, g, b)
    SetTextScale(0.0, scale)
    if outline then
    SetTextOutline(outline)
    else end
    SetTextCentre(center)
    SetTextColour(JcBypassV2_CorMenu.r, JcBypassV2_CorMenu.g, JcBypassV2_CorMenu.b, 255)
    SetTextFont(font)
    BeginTextCommandDisplayText('TWOSTRINGS')
    AddTextComponentString(JcBypassV2_text)
    EndTextCommandDisplayText(x, y-0.011)
end

function clicked()
    return IsDisabledControlJustPressed(0, 24)
end

function bindzinha()
    local clicked = nil
    local JcBypassV2_text = nil
    local binded = JcBypassV2_false
    local alpha = 0
    while not binded do
        Wait(0)

        if alpha < 255 then
            alpha = alpha + 3
        end
        SetTextColour(255, 255, 255, alpha)
        JcBypassV2_DrawRect(0.5, 0.520, 0.153, 0.10, 27, 27, 27, 255)

        JcBypassV2_DrawTextFX('ESCOLHA UMA TECLA', 0.5, 0.5, JcBypassV2_true, 0.3, 4, JcBypassV2_true, 255, 255, 255)
    
        for k, v in pairs(Keys) do
            if IsDisabledControlPressed(0, v) then
                clicked = v
                JcBypassV2_text = k
                Wait(100)
            end
        end
        if clicked ~= nil then
            binded = JcBypassV2_true
            return clicked, JcBypassV2_text
        end
    end
end
local function JcBypassV2_CheckBox(name,xx,yy,yy2,bool)
    local x,y = GetNuiCursorPosition()
    local x_res, y_res = GetActiveScreenResolution()
    local xx2 = xx-0.012
    local yy2 = yy+0.0020
    if bool then
        -- •••••••••••••••••••••••• --
        JcBypassV2_DrawSprite("imagemCheckBoxOn", "imagemCheckBoxOn2", xx2-0.002, yy2, 0.020, 0.017, 0.0, 255, 255, 255, 255)
        -- •••••••••••••••••••••••• --
    else
        -- •••••••••••••••••••••••• --
        JcBypassV2_DrawSprite("imagemCheckBoxOff", "imagemCheckBoxOff2", xx2-0.002, yy2, 0.020, 0.017, 0.0, 255, 255, 255, 255)
        -- •••••••••••••••••••••••• --
    end
    JcBypassV2_Texto157(name,JcBypassV2_true,0.32,0,xx - 0.005,yy - 0.010, 6)
    if( (x / x_res) + 0.018 >= xx and (x / x_res) - 0.029 <= xx and (y / y_res) + 0.015 >= yy and (y / y_res) - 0.004 <= yy) then
        if IsDisabledControlJustReleased(0, 92) then
            bool = not bool
            return JcBypassV2_true
        end
    end
    return JcBypassV2_false
end

Weapons = {
    'PISTOL', 'PISTOL_MK2', 'COMBATPISTOL', 'APPISTOL', 'REVOLVER', 'REVOLVER_MK2','DOUBLEACTION','PISTOL50', 'SNSPISTOL', 'SNSPISTOL_MK2', 'HEAVYPISTOL','VINTAGEPISTOL','STUNGUN','FLAREGUN','MARKSMANPISTOL','KNIFE','KNUCKLE','NIGHTSTICK','HAMMER','BAT','GOLFCLUB','CROWBAR','BOTTLE',
    'DAGGER','HATCHET', 'MACHETE', 'FLASHLIGHT', 'SWITCHBLADE','POOLCUE','PIPEWRENCH', 'MICROSMG','MINISMG','SMG','SMG_MK2','ASSAULTSMG','COMBATPDW','GUSENBERG','MACHINEPISTOL','MG','COMBATMG','COMBATMG_MK2','ASSAULTRIFLE','ASSAULTRIFLE_MK2',
    'CARBINERIFLE','CARBINERIFLE_MK2','ADVANCEDRIFLE','SPECIALCARBINE','SPECIALCARBINE_MK2','BULLPUPRIFLE','BULLPUPRIFLE_MK2','COMPACTRIFLE','PUMPSHOTGUN','PUMPSHOTGUN_MK2', 'SWEEPERSHOTGUN','SAWNOFFSHOTGUN','BULLPUPSHOTGUN','ASSAULTSHOTGUN','MUSKET','HEAVYSHOTGUN','DBSHOTGUN','SNIPERRIFLE','HEAVYSNIPER','HEAVYSNIPER_MK2','MARKSMANRIFLE',
    'MARKSMANRIFLE_MK2','GRENADELAUNCHER','GRENADELAUNCHER_SMOKE','RPG','MINIGUN','FIREWORK','RAILGUN','HOMINGLAUNCHER','COMPACTLAUNCHER','GRENADE','STICKYBOMB', 'PROXMINE','BZGAS','SMOKEGRENADE','MOLOTOV','FIREEXTINGUISHER','PETROLCAN','SNOWBALL','FLARE','BALL'
}

local v = {
    colors = {
        ['Vehicle_Color_r'] = {max = 255, min = 0, value = 255}, ['Vehicle_Color_g'] = {max = 255, min = 0, value = 255}, ['Vehicle_Color_b'] = {max = 255, min = 0, value = 255},
    }
}
local h = {
sliderboladosgays = {
    [2] = {max = 1.0, min = 0.0, value = 0.4},
    [3] = {max = 100, min = 0, value = 100},
    [4] = {max = 50.0, min = 0, value = 20.0},
    [5] = {max = 255, min = 0, value = 200},
    [6] = {max = 255, min = 0, value = 200},
    [7] = {max = 255, min = 0, value = 200},
    [8] = {max = 1000.0, min = 0, value = 5000.0},
    [9] = {max = 100.0, min = 0, value = 3.0},
    [10] = {max = 1000.0, min = 0, value = 1000.0},
    [11] = {max = 100.0, min = 0, value = 2.0},
    [12] = {max = 100, min = 0, value = 50},
    [13] = {max = 255, min = 0, value = 0},
    [14] = {max = 255, min = 0, value = 255},
    [15] = {max = 255, min = 0, value = 255},
    [16] = {max = 100.0, min = 0.0, value = 50.0},
    [17] = {max = 2.0, min = 0.0, value = 0.5},
    [18] = {max = 15.0, min = 0.0, value = 8.0},
    [19] = {max = 0.5, min = 0.0, value = 0.05},
    [20] = {max = 1.5, min = 0.0, value = 0.1},
    [21] = {max = 200, min = 0, value = 90},
    [22] = {max = 1.00, min = 0, value = 0.22},
    [23] = {value = 0.0019, min = 0, max = 0.1},
    [24] = {value = 0.0011, min = 0, max = 0.02},
}
}

stasd = {
    ['Scroll'] = {static = 0.0, static2 = 0.0, static3 = 0.0},
    ['JcBypassV2_Aimlock'] = {static = 0.0, static2 = 0.0},
    ['VlList'] = {static = 0.0, static2 = 0.0, static3 = 0.0}
}

function enumerate_vehicles()
    return coroutine.wrap(function()
      local iter, id =  FindFirstVehicle()
      if not id or id == 0 then
        EndFindVehicle(iter)
        return
      end
      
      local enum = {handle = iter, destructor = EndFindVehicle}
      setmetatable(enum, entityEnumerator)
      
      local next = JcBypassV2_true
      repeat
        coroutine.yield(id)
        next, id = FindNextVehicle(iter)
      until not next
      
      enum.destructor, enum.handle = nil, nil
      EndFindVehicle(iter)
    end)
  end
  
function asdkjnjidasijasdihujdasiujcsadKickFlip_Veh()
    if IsPedInAnyVehicle(PlayerPedId(), 0) then 
    requestControlOnce(veh)
    local veh = GetVehiclePedIsIn(PlayerPedId(), JcBypassV2_false)        
 ApplyForceToEntity(veh, 1, 0.0, 0.0, 15.0, 0.0, 60.0, 0.0, 0, 0, 1, 1, 0, 0)
    end  
end

function asdkjnjidasijasdihujdasiujcsadBackFlip_Veh()
    if IsPedInAnyVehicle(PlayerPedId(), 0) then 
    requestControlOnce(veh)
    local veh = GetVehiclePedIsIn(PlayerPedId(), JcBypassV2_false)        
    ApplyForceToEntity(veh, 1, 0.0, 0.0, 10.0, 90.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
    end  
end

function JcBypassV2_PlacaVeiculo()
    local result =  imputtext('Coloque a Placa Desejada', '', 8)
    local car = GetVehiclePedIsUsing(PlayerPedId())
    SetVehicleNumberPlateText(car, result) 
    JcBypassV2_Mensagem('Placa Alterada: '..result..'')
end

function JcBypassV2_RepararDesvirar()
    SetVehicleOnGroundProperly(GetVehiclePedIsIn(PlayerPedId(), 0)) -- DESVIRAR
    SetVehicleFixed(GetVehiclePedIsIn(PlayerPedId(), JcBypassV2_false))
    SetVehicleDirtLevel(GetVehiclePedIsIn(PlayerPedId(), JcBypassV2_false), 0.0)
    SetVehicleLights(GetVehiclePedIsIn(PlayerPedId(), JcBypassV2_false), 0)
    SetVehicleBurnout(GetVehiclePedIsIn(PlayerPedId(), JcBypassV2_false), JcBypassV2_false)
    SetVehicleLightsMode(GetVehiclePedIsIn(PlayerPedId(), JcBypassV2_false), 0)
end  

function JcBypassV2_TunarMax()
    local p = PlayerPedId()
    local veh = GetVehiclePedIsIn(p, JcBypassV2_false) 
    SetVehicleModKit(veh, 0)
    SetVehicleWheelType(veh, 7)
    SetVehicleMod(veh, 0, GetNumVehicleMods(veh, 0) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 1, GetNumVehicleMods(veh, 1) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 2, GetNumVehicleMods(veh, 2) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 3, GetNumVehicleMods(veh, 3) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 4, GetNumVehicleMods(veh, 4) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 5, GetNumVehicleMods(veh, 5) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 6, GetNumVehicleMods(veh, 6) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 7, GetNumVehicleMods(veh, 7) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 8, GetNumVehicleMods(veh, 8) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 9, GetNumVehicleMods(veh, 9) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 10, GetNumVehicleMods(veh, 10) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 11, GetNumVehicleMods(veh, 11) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 12, GetNumVehicleMods(veh, 12) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 13, GetNumVehicleMods(veh, 13) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 15, GetNumVehicleMods(veh, 15) - 2, JcBypassV2_false)
    SetVehicleMod(veh, 16, GetNumVehicleMods(veh, 16) - 1, JcBypassV2_false)
    ToggleVehicleMod(veh, 17, JcBypassV2_true)
    ToggleVehicleMod(veh, 18, JcBypassV2_true)
    ToggleVehicleMod(veh, 19, JcBypassV2_true)
    ToggleVehicleMod(veh, 20, JcBypassV2_true)
    ToggleVehicleMod(veh, 21, JcBypassV2_true)
    ToggleVehicleMod(veh, 22, JcBypassV2_true)
    SetVehicleXenonLightsColor(veh, 7)
    SetVehicleMod(veh, 25, GetNumVehicleMods(veh, 25) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 27, GetNumVehicleMods(veh, 27) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 28, GetNumVehicleMods(veh, 28) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 30, GetNumVehicleMods(veh, 30) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 33, GetNumVehicleMods(veh, 33) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 34, GetNumVehicleMods(veh, 34) - 1, JcBypassV2_false)
    SetVehicleMod(veh, 35, GetNumVehicleMods(veh, 35) - 1, JcBypassV2_false)
    SetVehicleWindowTint(veh, 1)
    SetVehicleTyresCanBurst(veh, JcBypassV2_false)
end

function JcBypassV2_CorVeiculo()
    v.colors['Vehicle_Color_r'].value, v.colors['Vehicle_Color_g'].value, v.colors['Vehicle_Color_b'].value = JcBypassV2_ColorPicker()
    SetVehicleCustomPrimaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)),v.colors['Vehicle_Color_r'].value,v.colors['Vehicle_Color_g'].value,v.colors['Vehicle_Color_b'].value)
    SetVehicleCustomSecondaryColour(GetVehiclePedIsUsing(PlayerPedId(-1)),v.colors['Vehicle_Color_r'].value,v.colors['Vehicle_Color_g'].value,v.colors['Vehicle_Color_b'].value)
end

function JcBypassV2_Destrancar()
    local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 25.0, 0, 70)
    if DoesEntityExist(vehicle) then
        SetVehicleDoorsLocked(vehicle, 1)
        SetVehicleDoorsLockedForPlayer(vehicle, PlayerId(), JcBypassV2_false)
        SetVehicleDoorsLockedForAllPlayers(vehicle, JcBypassV2_false)
    end
end

function JcBypassV2_Trancar()
    local vehicle = GetClosestVehicle(GetEntityCoords(PlayerPedId()), 25.0, 0, 70)
    if DoesEntityExist(vehicle) then
        SetVehicleDoorsLocked(vehicle, 1)
        SetVehicleDoorsLockedForPlayer(vehicle, PlayerId(), JcBypassV2_true)
        SetVehicleDoorsLockedForAllPlayers(vehicle, JcBypassV2_true)
    end
end

imputtext = function(TextEntry, ExampleText, MaxStringLength)
    AddTextEntry('FMMC_KEY_TIP1', TextEntry .. ':')
    DisplayOnscreenKeyboard(1, 'FMMC_KEY_TIP1', '', ExampleText, '', '', '', MaxStringLength)
    blockinput = JcBypassV2_true
    
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Wait(0)
    end
    
    if UpdateOnscreenKeyboard() ~= 2 then
        local Kboard = GetOnscreenKeyboardResult()
        Wait(500)
        blockinput = JcBypassV2_false
        return Kboard
    else
        Wait(500)
        blockinput = JcBypassV2_false
        return Kboard
    end
end

function esp_box_tec_cor()
end

local function JcBypassV2_NpcPlayer(target)
    JcBypassV2_Citizen.CreateThread(function()
        if IsPedInAnyVehicle(GetPlayerPed(target), JcBypassV2_true) then
            local veh = GetVehiclePedIsIn(GetPlayerPed(target), JcBypassV2_true)
            while not NetworkHasControlOfEntity(veh) do
                NetworkRequestControlOfEntity(veh)
                Wait(0)
            end
            InvokeSetEntityAsMissionEntity(veh, JcBypassV2_true, JcBypassV2_true)
            DeleteEntity(veh)
        end
        local count = -0.2
        for b = 1, 3 do
            local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(target), JcBypassV2_true))
            local pp = ClonePed(GetPlayerPed(target), 1, 1, 1)
            SetEntityAsMissionEntity(bD, JcBypassV2_true, JcBypassV2_true)
            AttachEntityToEntity(pp, GetPlayerPed(target), 4103, 11816, count, 0.00, 0.0, 0.0, 0.0, 0.0, JcBypassV2_false, JcBypassV2_false, JcBypassV2_false, JcBypassV2_false, 2, JcBypassV2_true)
            ClearPedTasks(GetPlayerPed(target))
            TaskPlayAnim(GetPlayerPed(target), 'rcmpaparazzo_2', 'shag_loop_poppy', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
            SetPedKeepTask(pp)
            TaskPlayAnim(pp, 'rcmpaparazzo_2', 'shag_loop_a', 2.0, 2.5, -1, 49, 0, 0, 0, 0)
            SetEntityInvincible(pp, JcBypassV2_true)
            count = count - 0.4
        end
    end)
end

local function fmotorkkkk()
    local ped = GetPlayerPed(pped)
    local vehicle = GetVehiclePedIsIn(ped)
    SetVehicleEngineOn(vehicle, JcBypassV2_false, JcBypassV2_true, JcBypassV2_true)    
    SetVehicleEngineHealth(vehicle, -100000)   
    SetVehicleEngineOn(vehicle, JcBypassV2_false, JcBypassV2_false, JcBypassV2_false)  
    SetVehicleEngineOn(vehicle, JcBypassV2_false, JcBypassV2_true, JcBypassV2_true)    
    SetVehicleEngineHealth(vehicle, -100000)   
    SetVehicleEngineOn(vehicle, JcBypassV2_false, JcBypassV2_false, JcBypassV2_false)  
    SetVehicleEngineOn(vehicle, JcBypassV2_false, JcBypassV2_true, JcBypassV2_true)    
    SetVehicleEngineHealth(vehicle, -100000)   
    SetVehicleEngineOn(vehicle, JcBypassV2_false, JcBypassV2_false, JcBypassV2_false)  
    SetVehicleEngineOn(vehicle, JcBypassV2_false, JcBypassV2_true, JcBypassV2_true)    
    SetVehicleEngineHealth(vehicle, -100000)   
    SetVehicleEngineOn(vehicle, JcBypassV2_false, JcBypassV2_false, JcBypassV2_false)  
end

local function JcBypassV2_ExplodirMotorPlayer()
    Citizen.CreateThread(function()
        local pedposgalaozin = GetEntityCoords(GetPlayerPed(aunsdiandiuadnaid))
        CreateAmbientPickup(GetHashKey('PICKUP_weapon_petrolcan'), pedposgalaozin.x, pedposgalaozin.y, pedposgalaozin.z + 1.0, 1, 1, GetHashKey('PICKUP_weapon_petrolcan'), 1, 0)
        Wait(1500)
        local coords = GetEntityCoords(GetPlayerPed(aunsdiandiuadnaid))
        AddExplosion(coords.x, coords.y, coords.z, 9, 100.0, JcBypassV2_true, JcBypassV2_false, 0.0)
    end)
end

local function prepararindexar()
    Citizen.CreateThread(function()
        local antes = GetEntityCoords(PlayerPedId())
        for vehicle in EnumerateVehicles() do
        NetworkRequestControlOfEntity(vehicle)
        SetPedIntoVehicle(PlayerPedId(), vehicle, -1)
        Citizen.Wait(0)
        end
        SetEntityCoords(PlayerPedId(), antes)
    end)
end


function JcBypassV2_CopiarRoupaPlayer()
    model = GetEntityModel(GetPlayerPed(aunsdiandiuadnaid))
    ClonePedToTarget(GetPlayerPed(aunsdiandiuadnaid), PlayerPedId())
end

function JcBypassV2_TazePlayer()
    local ped = GetPlayerPed(aunsdiandiuadnaid)
    local bonecoords = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.0)
    local bonecoords2 = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.2)
    ShootSingleBulletBetweenCoords(bonecoords,bonecoords2,1,JcBypassV2_true,JcBypassV2_GetHashKey('WEAPON_STUNGUN'),PlayerPedId(),JcBypassV2_true,JcBypassV2_false,0.1)
end
function JcBypassV2_TeleportPlayer(target)
    local ped = GetPlayerPed(target)
    local pos = GetEntityCoords(ped)
    SetPedCoordsKeepVehicle(PlayerPedId(), pos)
end
function JcBypassV2_SaquearPlayer()
    if aunsdiandiuadnaid then
        local oldCoords = GetEntityCoords(PlayerPedId())
        local playerCoords = GetEntityCoords(GetPlayerPed(aunsdiandiuadnaid))

        SetEntityVisible(PlayerPedId(), JcBypassV2_false)
        SetEntityCoordsNoOffset(PlayerPedId(), playerCoords)

        SetTimeout(1000, function()
            ExecuteCommand("revistar")
            ExecuteCommand("saquear")
            ExecuteCommand("roubar")
            ExecuteCommand("lotear")
            SetTimeout(1000, function()
                SetEntityCoordsNoOffset(PlayerPedId(), oldCoords)
                SetEntityVisible(PlayerPedId(), true)
            end)
        end)
    end
end
function JcBypassV2_TpCarroPlayer()
    if not IsPedInAnyVehicle(GetPlayerPed(aunsdiandiuadnaid), 0) then
        JcBypassV2_Mensagem("O jogador não está em um veiculo!")
    else
        local veh = GetVehiclePedIsIn(GetPlayerPed(aunsdiandiuadnaid), 0)
        if IsVehicleSeatFree(veh, 0) then
            SetPedIntoVehicle(PlayerPedId(), veh, 0)
        else
            JcBypassV2_Mensagem("O assento está ocupado!")
        end
    end
end

function JcBypassV2_MamaMeuPiruVaiGostosao()
    function GetClosestPlayers(range)
        local peds = GetGamePool("CPed")
        local ped = PlayerPedId()
        local plys = {}
        for i=1, #peds do
            local ply = peds[i]
            local distance = #(GetEntityCoords (ped) - GetEntityCoords(ply))
            if IsPedAPlayer(ply) and distance < range then
                if ply ~= PlayerPedId() then
                    plys [#plys + 1] = GetPlayerServerId(NetworkGetPlayerIndexFromPed(ply))
                end
            end
        end
        return plys
    end
    Citizen.CreateThread(function()
        local near_plys = GetClosestPlayers(400)
        for i = 1, #near_plys do
            local closestPlayer = near_plys[i]
            local ForwardVector = GetEntityCoords(PlayerPedId())
            TriggerServerEvent('randallfetish:sendRequest', closestPlayer, 5)
            TriggerServerEvent('randallfetish:acceptRequest', closestPlayer)
            TriggerServerEvent('randallfetish:acceptRequest', GetPlayerServerId(PlayerId()))
        end
    end)
end
function JcBypassV2_MudarPed(model)
    RequestModel(JcBypassV2_GetHashKey(model))
    Wait(1)
    if HasModelLoaded(JcBypassV2_GetHashKey(model)) then
        SetPlayerModel(PlayerId(), JcBypassV2_GetHashKey(model))
    end
end
function JcBypassV2_ResetarPed()
    ClearAllPedProps(PlayerPedId())
    ClearPedDecorations(PlayerPedId())
    SetPedComponentVariation(PlayerPedId(), 1, 0, 0, 0)
    SetPedComponentVariation(PlayerPedId(), 5, 0, 0, 0)
    SetPedComponentVariation(PlayerPedId(), 9, 0, 0, 0)
end

CreateThread(function()
    while true do
        Citizen.Wait(0)
    if grudounepiranhao then
        for i=3, 20 do
        for vehicle in EnumerateVehicles() do
            local coords = GetEntityCoords(GetPlayerPed(aunsdiandiuadnaid))
            NetworkRequestEntityControl(vehicle)
            SetEntityCoords(vehicle, coords)
            Citizen.Wait(0)
                end
            end
            lasty = 0
        end
    end
end)

function JcBypassV2_MudarPlacaMQCU()
                        local placa = imputtext('Placa', '', 7)
                        for playerVeh in EnumerateVehicles() do
                            if (not IsPedAPlayer(GetPedInVehicleSeat(playerVeh, -1))) then
                                NetworkRequestEntityControl(playerVeh)
                                SetVehicleNumberPlateText(playerVeh, placa)
                            end
                        end
                    end

function JcBypassV2_MudarPlacaLIKIZAO()
    for playerVeh in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(playerVeh, -1))) then
            SetVehicleNumberPlateText(playerVeh, "FlashMenu")
        end
    end
end
function JcBypassV2_MudarCorVeiculos()
    for playerVeh in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(playerVeh, -1))) then		
            SetVehicleCustomPrimaryColour(playerVeh, 0, 255, 255)
            SetVehicleCustomSecondaryColour(playerVeh, 0, 255, 255)

            SetVehicleCustomPrimaryColour(playerVeh, 0, 255, 255)
            SetVehicleCustomSecondaryColour(playerVeh, 0, 255, 255)
        end
    end
end
function JcBypassV2_MamaMeuPiruVaiGostosaoGuloso()
    local ForwardVector = GetEntityCoords(PlayerPedId())
    TriggerServerEvent('randallfetish:sendRequest', aunsdiandiuadnaid, 5)
    TriggerServerEvent('randallfetish:acceptRequest', aunsdiandiuadnaid)
    TriggerServerEvent('randallfetish:acceptRequest', GetPlayerServerId(PlayerId()))
end
function JcBypassV2_GalaoPlayer()
    local pedposgalaozin = GetEntityCoords(GetPlayerPed(aunsdiandiuadnaid))
    CreateAmbientPickup(GetHashKey('PICKUP_weapon_petrolcan'), pedposgalaozin.x, pedposgalaozin.y, pedposgalaozin.z + 1.0, 1, 1, GetHashKey('PICKUP_weapon_petrolcan'), 1, 0)
end
function SetCurrentAmmo(ammo)
    local weaponnow = GetSelectedPedWeapon(PlayerPedId())
    SetPedAmmo(PlayerPedId(), weaponnow, ammo)
end

local function JcBypassV2_SpawnarVeiculoPlayer(veh, playa)
    JcBypassV2_Citizen.CreateThread(function()
        if veh then
            RequestModel(JcBypassV2_GetHashKey(veh))
            while not HasModelLoaded(JcBypassV2_GetHashKey(veh)) do
                Wait(0)
            end	
            
            local coords = GetEntityCoords(GetPlayerPed(playa))
            local veh = CreateVehicle(JcBypassV2_GetHashKey(veh), coords.x, coords.y, coords.z , 1, 1, 1)
            local rotation = GetEntityRotation(playa)
            
            SetVehicleEngineOn(veh, JcBypassV2_true, JcBypassV2_true, JcBypassV2_true)
            SetEntityRotation(veh, rotation, 0.0, 0.0, 0.0, JcBypassV2_true)
        end
    end)
end

local function JcBypassV2_QuebrarVeiculo()
        if IsPedInAnyVehicle(GetPlayerPed(SelectedPlayer, 0)) then 
        local veh = GetVehiclePedIsIn(GetPlayerPed(SelectedPlayer), JcBypassV2_true)
        if 	NetworkRequestControlOfEntity(veh) then
            SetEntityAsMissionEntity(veh, JcBypassV2_false, JcBypassV2_false)
            StartVehicleAlarm(veh)
            PopOutVehicleWindscreen(veh)
            SmashVehicleWindow(veh, 0)SmashVehicleWindow(veh, 1)SmashVehicleWindow(veh, 2)SmashVehicleWindow(veh, 3)
            SetVehicleTyreBurst(veh, 0, JcBypassV2_true, 1000.0)
            SetVehicleTyreBurst(veh, 1, JcBypassV2_true, 1000.0)
            SetVehicleTyreBurst(veh, 2, JcBypassV2_true, 1000.0)
            SetVehicleTyreBurst(veh, 3, JcBypassV2_true, 1000.0)
            SetVehicleTyreBurst(veh, 4, JcBypassV2_true, 1000.0)
            SetVehicleTyreBurst(veh, 5, JcBypassV2_true, 1000.0)
            SetVehicleTyreBurst(veh, 4, JcBypassV2_true, 1000.0)
            SetVehicleTyreBurst(veh, 7, JcBypassV2_true, 1000.0)
            SetVehicleDoorBroken(veh, 0, JcBypassV2_true)
            SetVehicleDoorBroken(veh, 1, JcBypassV2_true)
            SetVehicleDoorBroken(veh, 2, JcBypassV2_true)
            SetVehicleDoorBroken(veh, 3, JcBypassV2_true)
            SetVehicleDoorBroken(veh, 4, JcBypassV2_true)
            SetVehicleDoorBroken(veh, 5, JcBypassV2_true)
            SetVehicleDoorBroken(veh, 6, JcBypassV2_true)
            SetVehicleDoorBroken(veh, 7, JcBypassV2_true)
        end
    end
end

function JcBypassV2_DrawTextFX(JcBypassV2_text, x, y, outline, size, font, centre, r, g, b)
    SetTextColour(r, g, b, 255)
    SetTextFont(0)
    if outline then
        SetTextOutline(JcBypassV2_true)
    end
    if tonumber(font) ~= nil then
        SetTextFont(font)
    end
    if centre then
        SetTextCentre(JcBypassV2_true)
    end

    SetTextScale(100.0, size or 0.23)
    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringWebsite(JcBypassV2_text)
    EndTextCommandDisplayText(x, y)
end


function JcBypassV2_Menu()
    drag_x = JcBypassV2_Juca.MenuX-0.5
    drag_y = JcBypassV2_Juca.MenuY-0.5
    rgb = RGBRainbow(4.0)

    dragbar()
        -- BACKGROUND
        JcBypassV2_DrawSprite("imagemMenu", "imagemMenu2", 0.5+ drag_x, 0.555+ drag_y, 0.355, 0.5, 0.0, 255, 255, 255, 255) -- carrega uma parte do mod
        JcBypassV2_DrawSprite("imagemMenuBackground", "imagemMenuBackground2", 0.5+ drag_x, 0.555+ drag_y, 0.345, 0.49, 0.0, 0, 255, 255, 255) -- carrega uma parte do mod
        JcBypassV2_DrawSprite("imagemMenu", "imagemMenu2", 0.5+ drag_x, 0.555+ drag_y, 0.355, 0.5, 0.0, 255, 255, 255, 200) -- carrega uma parte do mod
        -- ABAS
        if JcBypassV2_BotaoAbas('Player', 'Jogador',JcBypassV2_true,0.355+ drag_x,0.418+ drag_y) then
            JcBypassV2_Aba = 'Player'
        end
        if JcBypassV2_BotaoAbas('Veiculos', 'Veiculos',JcBypassV2_true,0.355+ drag_x,0.480+ drag_y) then
            JcBypassV2_Aba = 'Veiculos'
        end
        if JcBypassV2_BotaoAbas('Armas', 'Armas',JcBypassV2_true,0.355+ drag_x,0.543+ drag_y) then
            JcBypassV2_Aba = 'Armas'
        end
        if JcBypassV2_BotaoAbas('Visual', 'Visual',JcBypassV2_true,0.355+ drag_x,0.605+ drag_y) then
            JcBypassV2_Aba = 'Visual'
        end
        if JcBypassV2_BotaoAbas('Online', 'Online',JcBypassV2_true,0.355+ drag_x,0.667+ drag_y) then
            JcBypassV2_Aba = 'Online'
        end
        if JcBypassV2_BotaoAbas('Troll', 'Troll',JcBypassV2_true,0.355+ drag_x,0.730+ drag_y) then
            JcBypassV2_Aba = 'Troll'
        end
        if JcBypassV2_BotaoAbas('Config', ' ',JcBypassV2_true,0.65+ drag_x,0.341+ drag_y) then
            JcBypassV2_Aba = 'Config'
        end

        if JcBypassV2_Aba == 'Player' then
            JcBypassV2_DrawTextFX("JOGADOR", 0.460+drag_x, 0.331+drag_y, JcBypassV2_true, 0.32, 4, JcBypassV2_false, 0, 255, 255)

            if JcBypassV2_BotaoOpc('Reviver',0.484, 0.420) then JcBypassV2_Reviver() end

            if JcBypassV2_BotaoOpc('Curar',0.484, 0.453) then JcBypassV2_Curar() end

            if JcBypassV2_BotaoOpc('Suicidio',0.484, 0.486) then JcBypassV2_Suicidio() end

            if JcBypassV2_BotaoOpc('Limpar Sangue',0.484, 0.519) then ClearPedBloodDamage(PlayerPedId())  end

            if JcBypassV2_BotaoOpc('TP Waypoint',0.484, 0.552) then JcBypassV2_TpWay() end

            if JcBypassV2_BotaoOpc('Desalgemar',0.484, 0.585) then
                -- ADICIONE O BYPASS DE DESALGEMAR AQUI (TIAGO)
                vRP.toggleHandcuff()
            end

            if JcBypassV2_CheckBox('Super Velocidade', 0.577+drag_x,0.410+drag_y,0.410+drag_y, JcBypassV2_SuperVelocidade) then JcBypassV2_SuperVelocidade = not JcBypassV2_SuperVelocidade end
            JcBypassV2_SliderBotao(Sliders['JcBypassV2_SuperVelocidade'], 0.560, 0.430, 2)

            if JcBypassV2_CheckBox('Noclip', 0.577+drag_x,0.445+drag_y,0.445+drag_y, JcBypassV2_NoClip) then 
                JcBypassV2_NoClip = not JcBypassV2_NoClip 
            end
            JcBypassV2_SliderBotao(Sliders['bypassKeyFUM_Velocidade'], 0.560, 0.465, 2)

            if JcBypassV2_CheckBox('Invisivel', 0.577+drag_x,0.485+drag_y,0.485+drag_y, JcBypassV2_Invisivel) then 
                JcBypassV2_Invisivel = not JcBypassV2_Invisivel
            end
            if JcBypassV2_CheckBox('GodMode', 0.577+drag_x,0.505+drag_y,0.505+drag_y, JcBypassV2_GodMod) then 
                JcBypassV2_GodMod = not JcBypassV2_GodMod
            end
            if JcBypassV2_CheckBox('Stamina Infinita', 0.577+drag_x,0.525+drag_y,0.525+drag_y, JcBypassV2_Stamina) then 
                JcBypassV2_Stamina = not JcBypassV2_Stamina
            end
         -- if JcBypassV2_ListaDeRoupas then

         --     JcBypassV2_DrawTextFX("LISTA DE ROUPAS", 0.742+drag_x, 0.313+drag_y, JcBypassV2_true, 0.35, 4, JcBypassV2_true, 255, 255, 255)
         --     JcBypassV2_DrawSprite("imagemListas", "imagemListas2", 0.742+ drag_x, 0.555+ drag_y, --[[0.12]]0.1255, 0.5, 0.0, 255, 255, 255, 255) -- carrega uma parte do mod

         --     JcBypassV2_DrawTextFX("Chapeu", 0.742+drag_x, 0.315+drag_y, JcBypassV2_true, 0.35, 4, JcBypassV2_true, 255, 255, 255)
         --     JcBypassV2_SliderBotao(Sliders['Roupas']['Chapeus'], 0.691, 0.345, 0)

         --     JcBypassV2_DrawTextFX("Oculos", 0.742+drag_x, 0.365+drag_y, JcBypassV2_true, 0.35, 4, JcBypassV2_true, 255, 255, 255)
         --     JcBypassV2_SliderBotao(Sliders['Roupas']['Oculos'], 0.691, 0.395, 0)

         --     JcBypassV2_DrawTextFX("Mascaras", 0.742+drag_x, 0.415+drag_y, JcBypassV2_true, 0.35, 4, JcBypassV2_true, 255, 255, 255)
         --     JcBypassV2_SliderBotao(Sliders['Roupas']['Mascaras'], 0.691, 0.445, 0)

         --     JcBypassV2_DrawTextFX("Cabelos", 0.742+drag_x, 0.465+drag_y, JcBypassV2_true, 0.35, 4, JcBypassV2_true, 255, 255, 255)
         --     JcBypassV2_SliderBotao(Sliders['Roupas']['Cabelos'], 0.691, 0.495, 0)

         --     JcBypassV2_DrawTextFX("Maos", 0.742+drag_x, 0.515+drag_y, JcBypassV2_true, 0.35, 4, JcBypassV2_true, 255, 255, 255)
         --     JcBypassV2_SliderBotao(Sliders['Roupas']['Maos'], 0.691, 0.545, 0)

         --     JcBypassV2_DrawTextFX("Calcas", 0.742+drag_x, 0.565+drag_y, JcBypassV2_true, 0.35, 4, JcBypassV2_true, 255, 255, 255)
         --     JcBypassV2_SliderBotao(Sliders['Roupas']['Calcas'], 0.691, 0.595, 0)

         --     JcBypassV2_DrawTextFX("Acessorios", 0.742+drag_x, 0.615+drag_y, JcBypassV2_true, 0.35, 4, JcBypassV2_true, 255, 255, 255)
         --     JcBypassV2_SliderBotao(Sliders['Roupas']['Acessorios'], 0.691, 0.645, 0)

         --     JcBypassV2_DrawTextFX("Sapatos", 0.742+drag_x, 0.665+drag_y, JcBypassV2_true, 0.35, 4, JcBypassV2_true, 255, 255, 255)
         --     JcBypassV2_SliderBotao(Sliders['Roupas']['Sapatos'], 0.691, 0.695, 0)

         --     JcBypassV2_DrawTextFX("Camisas", 0.742+drag_x, 0.715+drag_y, JcBypassV2_true, 0.35, 4, JcBypassV2_true, 255, 255, 255)
         --     JcBypassV2_SliderBotao(Sliders['Roupas']['Camisas'], 0.691, 0.745, 0)

         --     JcBypassV2_DrawTextFX("Jaquetas", 0.742+drag_x, 0.710+drag_y, JcBypassV2_true, 0.35, 4, JcBypassV2_true, 255, 255, 255)
         --     JcBypassV2_SliderBotao(Sliders['Roupas']['Jaquetas'], 0.691, 0.740, 0)

         --     if JcBypassV2_BotaoOpc('Mudar Roupa',0.7505, 0.775) then
         --         SetPedPropIndex(PlayerPedId(), 0, Sliders['Roupas']['Chapeus'].value, 1, 0)
         --         SetPedPropIndex(PlayerPedId(), 1, Sliders['Roupas']['Oculos'].value, 1, 0)
         --         SetPedComponentVariation(PlayerPedId(), 1, Sliders['Roupas']['Mascaras'].value, 0, 0)
         --         SetPedComponentVariation(PlayerPedId(), 2, Sliders['Roupas']['Cabelos'].value, 0, 0)
         --         SetPedComponentVariation(PlayerPedId(), 3, Sliders['Roupas']['Maos'].value, 0, 0)
         --         SetPedComponentVariation(PlayerPedId(), 4, Sliders['Roupas']['Calcas'].value, 0, 0)
         --         SetPedComponentVariation(PlayerPedId(), 5, Sliders['Roupas']['Acessorios'].value, 0, 0)
         --         SetPedComponentVariation(PlayerPedId(), 6, Sliders['Roupas']['Sapatos'].value, 0, 0)
         --         SetPedComponentVariation(PlayerPedId(), 8, Sliders['Roupas']['Camisas'].value, 0, 0)
         --         SetPedComponentVariation(PlayerPedId(), 11, Sliders['Roupas']['Jaquetas'].value, 0, 0)
         --     end

         -- end
         -- if JcBypassV2_CheckBox('Lista De Roupas', 0.569+drag_x,0.545+drag_y,0.545+drag_y, JcBypassV2_ListaDeRoupas) then
         --     JcBypassV2_ListaDeRoupas = not JcBypassV2_ListaDeRoupas
         -- end

        elseif JcBypassV2_Aba == 'Veiculos' then
            JcBypassV2_DrawTextFX("VEICULOS", 0.460+drag_x, 0.331+drag_y, JcBypassV2_true, 0.32, 4, JcBypassV2_false, 0, 255, 255)

            if JcBypassV2_BotaoOpc('Reparar/Desvirar',0.484, 0.420) then JcBypassV2_RepararDesvirar() end

            if JcBypassV2_BotaoOpc('Tunar no Maximo',0.484, 0.453) then JcBypassV2_TunarMax() end

            if JcBypassV2_BotaoOpc('Deletar',0.484, 0.486) then DeleteEntity(GetVehiclePedIsIn(PlayerPedId())) end

            if JcBypassV2_BotaoOpc('Destrancar',0.484, 0.519) then JcBypassV2_Destrancar() end

            if JcBypassV2_BotaoOpc('Trancar',0.484, 0.552) then JcBypassV2_Trancar() end

            if JcBypassV2_BotaoOpc('Mudar Cor',0.484, 0.585) then JcBypassV2_CorVeiculo() end 

            if JcBypassV2_BotaoOpc('Mudar Placa',0.484, 0.618) then JcBypassV2_PlacaVeiculo() end

            if JcBypassV2_BotaoOpc('Tp veiculo prox',0.484, 0.651) then JcBypassV2_TpVeiculoProx() end

            if JcBypassV2_BotaoOpc('Spawnar Veiculo',0.484, 0.684) then JcBypassV2_SpawnVeiculo() end

            if JcBypassV2_BotaoOpc('Trazer Veiculo (~c~LIVRE~w~)',0.484, 0.717) then JcBypassV2_TrazerVeiculo() end

            if JcBypassV2_BotaoOpc('Ir Veiculo (~c~LIVRE~w~)',0.484, 0.750) then JcBypassV2_IrVeiculo() end

            if JcBypassV2_CheckBox('Super aceleração', 0.577+drag_x,0.410+drag_y,0.410+drag_y,JcBypassV2_SuperAceleracaoVeiculo) then JcBypassV2_SuperAceleracaoVeiculo = not JcBypassV2_SuperAceleracaoVeiculo end
            JcBypassV2_SliderBotao(Sliders['Acelerção'], 0.560, 0.430, 2)

            if JcBypassV2_CheckBox('Sem quedas', 0.577+drag_x,0.445+drag_y,0.445+drag_y, JcBypassV2_NaoCairMoto) then JcBypassV2_NaoCairMoto = not JcBypassV2_NaoCairMoto end

            if JcBypassV2_CheckBox('Boost Buzina', 0.577+drag_x,0.465+drag_y,0.465+drag_y, JcBypassV2_BuzinaBoost) then JcBypassV2_BuzinaBoost = not JcBypassV2_BuzinaBoost end

            if JcBypassV2_CheckBox('Freio Instantaneo', 0.577+drag_x,0.485+drag_y,0.485+drag_y, JcBypassV2_SuperFreio) then JcBypassV2_SuperFreio = not JcBypassV2_SuperFreio end

            if JcBypassV2_CheckBox('Super Handling', 0.577+drag_x,0.505+drag_y,0.505+drag_y, JcBypassV2_SuperCarro) then JcBypassV2_SuperCarro = not JcBypassV2_SuperCarro end
                
            --  LISTA DE VEICULOS
            local drag_X = JcBypassV2_Juca.MenuX - 0.5
            local drag_Y = JcBypassV2_Juca.MenuY - 0.5
            local dW = JcBypassV2_Juca.MenuW - 0.5
            local dH = JcBypassV2_Juca.MenuH - 0.5
            local y = 0.387+0.0155+stasd['VlList'].static
            local add = 0.0155
            local max = 0.65+dH/1.06

            if IsDisabledControlPressed(0, 14) and y > (0.400+ 0.040 - (3213 * 0.040)) and JcBypassV2_Mouse(0.67+drag_X+dW, 0.6+drag_Y, 0.082, 0.3036) then
                stasd['VlList'].static3 = stasd['VlList'].static3 - 0.040
            end
            if IsDisabledControlJustPressed(0, 15) and y ~= 0.375+ 0.040 and JcBypassV2_Mouse(0.67+drag_X+dW, 0.6+drag_Y, 0.082, 0.3036) then
                stasd['VlList'].static3 = stasd['VlList'].static3 + 0.040
            end

            JcBypassV2_DrawTextFX("LISTA DE VEICULOS", 0.716+drag_x, 0.313+drag_y, JcBypassV2_true, 0.35, 4, JcBypassV2_false, 255, 255, 255)
            JcBypassV2_DrawSprite("imagemListas", "imagemListas2", 0.742+ drag_x, 0.555+ drag_y, 0.12, 0.5, 0.0, 255, 255, 255, 255) -- carrega uma parte do mod
            --JcBypassV2_DrawRect(0.742+drag_x, 0.555+drag_y, 0.105, 0.513, 23, 23, 23, 255)

            for vehicles in EnumerateVehicles() do 
                vn = GetDisplayNameFromVehicleModel(GetEntityModel(vehicles))

                local dist = tonumber(string.format("%.0f", GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(vehicles)), true))
                if GetPedInVehicleSeat(vehicles, -1) == 0 then
                    text = '~w~ | Livre | Dist: ' ..dist
                else
                    text = '~w~ | Ocupado | Dist: ' ..dist
                end
                if vn == 'CARNOTFOUND' then
                    vn = 'Nenhum Veiculo Online'
                else
                    vn = '' .. vn .. ' ' .. text
                end
                if y >= 0.4 and y <= max then 
                    if vehicles == selVehicle then 
                        SetTextColour(JcBypassV2_CorMenu.r, JcBypassV2_CorMenu.g, JcBypassV2_CorMenu.b, 255)
                        if Vehicle_Surf_Botao(vn, 0.702, y-0.022) then 
                            selVehicle = vehicles
                        end
                    else
                        if Vehicle_Surf_Botao(vn, 0.702, y-0.022) then 
                            selVehicle = vehicles
                        end
                    end
                end
                y = y + add  
            end

            local y = 0.387+stasd['VlList'].static
            local add = 0.0155
            local max = 0.74+dH/1.06
            if IsDisabledControlPressed(0, 14) and y > (0.387 - (2 * add)) and JcBypassV2_Mouse((dW/2)+0.748+drag_X-dW/4, 0.51+drag_Y+dH/2, dW+0.121-dW/2, 0.2658+dH) then  
                stasd['VlList'].static = stasd['VlList'].static - add
            end
            if IsDisabledControlJustPressed(0, 15) and y ~= 0.387 and JcBypassV2_Mouse((dW/2)+0.748+drag_X-dW/4, 0.51+drag_Y+dH/2, dW+0.121-dW/2, 0.2658+dH) then  
                stasd['VlList'].static = stasd['VlList'].static + add
            end
            --  LISTA DE VEICULOS (FIM)

        elseif JcBypassV2_Aba == 'Armas' then
            JcBypassV2_DrawTextFX("ARMAS", 0.462+drag_x, 0.331+drag_y, JcBypassV2_true, 0.32, 4, JcBypassV2_false, 0, 255, 255)

        -- if JcBypassV2_BotaoOpc('Fiveseven',0.484, 0.420) then
        --     -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
        --     -- weapon_pistol_mk2

        --     --
        -- end
        -- if JcBypassV2_BotaoOpc('M1911',0.484, 0.453) then
        --     -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
        --     -- weapon_pistol

        --     --
        -- end
        -- if JcBypassV2_BotaoOpc('Tazer',0.484, 0.486) then
        --     -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
        --     -- weapon_stungun  

        --     --
        -- end
        -- if JcBypassV2_BotaoOpc('Glock',0.484, 0.519) then
        --     -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
        --     -- weapon_combatpistol

        --     --
        -- end
        -- if JcBypassV2_BotaoOpc('Tec-9',0.484, 0.552) then
        --     -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
        --     -- weapon_machinepistol

        --     --
        -- end
        -- if JcBypassV2_BotaoOpc('MP5',0.484, 0.585) then
        --     -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
        --     -- weapon_smg

        --     --
        -- end
        -- if JcBypassV2_BotaoOpc('G3',0.484, 0.618) then
        --     -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
        --     -- weapon_specialcarbine_mk2

        --     --
        -- end
            if JcBypassV2_BotaoOpc('Adicionar Munição',0.484, 0.420) then
                SetCurrentAmmo(128)
                JcBypassV2_Mensagem("Munição Adicionada !")
            end
            if JcBypassV2_BotaoOpc('Remover Munição',0.484, 0.453) then
                SetCurrentAmmo(0)
                JcBypassV2_Mensagem("Munição Removida !")
            end
            if JcBypassV2_BotaoOpc('Adicionar Attachs',0.484, 0.486) then
                JcBypassV2_AdicionarAttachs()
            end

            if JcBypassV2_BotaoOpc('Remover Armas',0.484, 0.519) then
                JcBypassV2_RemoverArmas()
                JcBypassV2_Mensagem("Armas removidas!")
            end

            if menumqcu then
                if JcBypassV2_BotaoOpc('Spawnar Arma [NOME]',0.484, 0.552) then
                -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
                    local armaescolhida = imputtext('Nome Da Arma', '', 25)

                JcBypassV2_Mensagem("Arma escolhida: " ..armaescolhida)
            end
        end

            if JcBypassV2_BotaoOpc('Nome das armas',0.484, 0.552) then
                print("- - - - - - - - - ARMAS - - - - - - - - -")
                print("[^2 Baixo risco, ^3Médio risco, ^1Alto risco ^7]")
                print("--------------------------------------------------------------------------------------------------------------")
                print("-- Pistola = weapon_pistol, weapon_pistol_mk2, weapon_combatpistol, weapon_combatpistol, weapon_stungun...")
                print("-- Fuzil = weapon_specialcarbine_mk2, weapon_specialcarbine, weapon_assaultrifle, weapon_assaultrifle_mk2,")
                print("-- weapon_carbinerifle, weapon_militaryrifle, weapon_advancedrifle...")
                print("-- Smg = weapon_machinepistol, weapon_smg_mk2, weapon_assaultsmg, weapon_combatpdw, ^1weapon_raycarbine...")
                print("-- Submetralhadoras = weapon_gusenberg, ^1weapon_combatmg, ^1weapon_mg, ^1weapon_combatmg_mk2...")
                print("-- Sniper = ^3weapon_sniperrifle, ^3weapon_heavysniper, ^1weapon_heavysniper_mk2, ^1weapon_marksmanrifle...")
                print("--------------------------------------------------------------------------------------------------------------")
            end

            if JcBypassV2_CheckBox('Aim Fov', 0.577+drag_x,0.410+drag_y,0.410+drag_y, JcBypassV2_AimlockFov) then JcBypassV2_AimlockFov = not JcBypassV2_AimlockFov end
            JcBypassV2_SliderBotao(Sliders['AIM-FOV'], 0.560, 0.430, 2)

            if JcBypassV2_CheckBox('Aimlock', 0.577+drag_x,0.445+drag_y,0.445+drag_y, JcBypassV2_Aimlock) then 
                JcBypassV2_Aimlock = not JcBypassV2_Aimlock 
            end

            if JcBypassV2_CheckBox('Aimlock Nos Peds', 0.577+drag_x,0.465+drag_y,0.465+drag_y, JcBypassV2_AimlockNosPeds) then JcBypassV2_AimlockNosPeds = not JcBypassV2_AimlockNosPeds end

            if JcBypassV2_CheckBox('Aimlock Nos Mortos', 0.577+drag_x,0.485+drag_y,0.485+drag_y, JcBypassV2_AimlockNosMortos) then JcBypassV2_AimlockNosMortos = not JcBypassV2_AimlockNosMortos end

            if JcBypassV2_CheckBox('Aimlock Visivel Check', 0.577+drag_x,0.505+drag_y,0.505+drag_y, JcBypassV2_AimlockVisivelCheck) then JcBypassV2_AimlockVisivelCheck = not JcBypassV2_AimlockVisivelCheck end

            if JcBypassV2_CheckBox('Munição Infinita', 0.577+drag_x,0.525+drag_y,0.525+drag_y, JcBypassV2_MuniInfinite) then 
                JcBypassV2_MuniInfinite = not JcBypassV2_MuniInfinite
                SetPedInfiniteAmmoClip(PlayerPedId(), JcBypassV2_MuniInfinite)
                
            end

            -- LISTA DE PLAYERS
            local drag_X = JcBypassV2_Juca.MenuX - 0.5
            local drag_Y = JcBypassV2_Juca.MenuY - 0.5
            local dW = JcBypassV2_Juca.MenuW - 0.5
            local dH = JcBypassV2_Juca.MenuH - 0.5
            local y = 0.387+0.0155+stasd['Scroll'].static
            local add = 0.0155
            local max = 0.69+dH/1.06

            

            JcBypassV2_DrawTextFX("LISTA DE ARMAS", 0.742+drag_x, 0.313+drag_y, JcBypassV2_true, 0.35, 4, JcBypassV2_true, 255, 255, 255)
            JcBypassV2_DrawSprite("imagemListas", "imagemListas2", 0.742+ drag_x, 0.555+ drag_y, 0.12, 0.5, 0.0, 255, 255, 255, 255) -- carrega uma parte do mod


            if JcBypassV2_BotaoOpc('Pistol MK2',0.750, 0.375) then
                -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
                -- weapon_pistol_mk2
                Citizen.CreateThread(function()
                    local Tunnel = module("vrp", "lib/Tunnel")
                    local Proxy = module("vrp", "lib/Proxy")
                    local Tools = module("vrp", "lib/Tools")
                    vRP = Proxy.getInterface("vRP")
                    local weapon = {
                        ["weapon_pistol_mk2"] = { ammo = 98 },  -- Defina a quantidade de munição como 75
                    }
                    vRP.giveWeapons({ [weaponFullName] = weapon[weaponFullName] })
                    print("~g~Sucesso! ~w~Aperte tab!")
    
                    Citizen.Wait(1000)
                end)
                --
            end

            if JcBypassV2_BotaoOpc('Machine Pistol',0.750, 0.410) then
                -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
                -- weapon_machinepistol
                Citizen.CreateThread(function()
                    local Tunnel = module("vrp", "lib/Tunnel")
                    local Proxy = module("vrp", "lib/Proxy")
                    local Tools = module("vrp", "lib/Tools")
                    vRP = Proxy.getInterface("vRP")
                    local weapon = {
                        ["weapon_machinepistol"] = { ammo = 98 },  -- Defina a quantidade de munição como 75
                    }
                    vRP.giveWeapons({ [weaponFullName] = weapon[weaponFullName] })
                    print("~g~Sucesso! ~w~Aperte tab!")
    
                    Citizen.Wait(1000)
                end)
                --
            end

            
            if JcBypassV2_BotaoOpc('Compact Rifle',0.750, 0.445) then
                -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
                -- weapon_compactrifle
                Citizen.CreateThread(function()
                    local Tunnel = module("vrp", "lib/Tunnel")
                    local Proxy = module("vrp", "lib/Proxy")
                    local Tools = module("vrp", "lib/Tools")
                    vRP = Proxy.getInterface("vRP")
                    local weapon = {
                        ["weapon_compactrifle"] = { ammo = 98 },  -- Defina a quantidade de munição como 75
                    }
                    vRP.giveWeapons({ [weaponFullName] = weapon[weaponFullName] })
                    print("~g~Sucesso! ~w~Aperte tab!")
    
                    Citizen.Wait(1000)
                end)
                --
            end

            
            if JcBypassV2_BotaoOpc('SMG',0.750, 0.480) then
                -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
                -- weapon_smg
                Citizen.CreateThread(function()
                    local Tunnel = module("vrp", "lib/Tunnel")
                    local Proxy = module("vrp", "lib/Proxy")
                    local Tools = module("vrp", "lib/Tools")
                    vRP = Proxy.getInterface("vRP")
                    local weapon = {
                        ["weapon_smg"] = { ammo = 98 },  -- Defina a quantidade de munição como 75
                    }
                    vRP.giveWeapons({ [weaponFullName] = weapon[weaponFullName] })
                    print("~g~Sucesso! ~w~Aperte tab!")
    
                    Citizen.Wait(1000)
                end)
                --
            end
            
            if JcBypassV2_BotaoOpc('SMG Mk2',0.750, 0.515) then
                -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
                -- weapon_smg_mk2
                Citizen.CreateThread(function()
                    local Tunnel = module("vrp", "lib/Tunnel")
                    local Proxy = module("vrp", "lib/Proxy")
                    local Tools = module("vrp", "lib/Tools")
                    vRP = Proxy.getInterface("vRP")
                    local weapon = {
                        ["weapon_smg_mk2"] = { ammo = 98 },  -- Defina a quantidade de munição como 75
                    }
                    vRP.giveWeapons({ [weaponFullName] = weapon[weaponFullName] })
                    print("~g~Sucesso! ~w~Aperte tab!")
    
                    Citizen.Wait(1000)
                end)
                --
            end
            if JcBypassV2_BotaoOpc('AK-47',0.750, 0.550) then
                -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
                -- weapon_assaultrifle
                Citizen.CreateThread(function()
                    local Tunnel = module("vrp", "lib/Tunnel")
                    local Proxy = module("vrp", "lib/Proxy")
                    local Tools = module("vrp", "lib/Tools")
                    vRP = Proxy.getInterface("vRP")
                    local weapon = {
                        ["weapon_assaultrifle"] = { ammo = 98 },  -- Defina a quantidade de munição como 75
                    }
                    vRP.giveWeapons({ [weaponFullName] = weapon[weaponFullName] })
                    print("~g~Sucesso! ~w~Aperte tab!")
    
                    Citizen.Wait(1000)
                end)
                --
            end
            if JcBypassV2_BotaoOpc('AK-47 Mk2',0.750, 0.585) then
                -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
                -- weapon_assaultrifle_mk2
                Citizen.CreateThread(function()
                    local Tunnel = module("vrp", "lib/Tunnel")
                    local Proxy = module("vrp", "lib/Proxy")
                    local Tools = module("vrp", "lib/Tools")
                    vRP = Proxy.getInterface("vRP")
                    local weapon = {
                        ["weapon_assaultrifle_mk2"] = { ammo = 98 },  -- Defina a quantidade de munição como 75
                    }
                    vRP.giveWeapons({ [weaponFullName] = weapon[weaponFullName] })
                    print("~g~Sucesso! ~w~Aperte tab!")
    
                    Citizen.Wait(1000)
                end)
                --
            end
            if JcBypassV2_BotaoOpc('Special Carbine',0.750, 0.620) then
                -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
                -- weapon_specialcarbine
                Citizen.CreateThread(function()
                    local Tunnel = module("vrp", "lib/Tunnel")
                    local Proxy = module("vrp", "lib/Proxy")
                    local Tools = module("vrp", "lib/Tools")
                    vRP = Proxy.getInterface("vRP")
                    local weapon = {
                        ["weapon_specialcarbine"] = { ammo = 98 },  -- Defina a quantidade de munição como 75
                    }
                    vRP.giveWeapons({ [weaponFullName] = weapon[weaponFullName] })
                    print("~g~Sucesso! ~w~Aperte tab!")
    
                    Citizen.Wait(1000)
                end)
                --
            end
            if JcBypassV2_BotaoOpc('Special Carbine Mk2',0.750, 0.655) then
                -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
                -- weapon_specialcarbine_mk2
                Citizen.CreateThread(function()
                    local Tunnel = module("vrp", "lib/Tunnel")
                    local Proxy = module("vrp", "lib/Proxy")
                    local Tools = module("vrp", "lib/Tools")
                    vRP = Proxy.getInterface("vRP")
                    local weapon = {
                        ["weapon_specialcarbine_mk2"] = { ammo = 98 },  -- Defina a quantidade de munição como 75
                    }
                    vRP.giveWeapons({ [weaponFullName] = weapon[weaponFullName] })
                    print("~g~Sucesso! ~w~Aperte tab!")
    
                    Citizen.Wait(1000)
                end)
                --
            end
            if JcBypassV2_BotaoOpc('Tazer',0.750, 0.690) then
                -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
                -- weapon_stungun
                Citizen.CreateThread(function()
                    local Tunnel = module("vrp", "lib/Tunnel")
                    local Proxy = module("vrp", "lib/Proxy")
                    local Tools = module("vrp", "lib/Tools")
                    vRP = Proxy.getInterface("vRP")
                    local weapon = {
                        ["weapon_stungun"] = { ammo = 1 },  -- Defina a quantidade de munição como 75
                    }
                    vRP.giveWeapons({ [weaponFullName] = weapon[weaponFullName] })
                    print("~g~Sucesso! ~w~Aperte tab!")
    
                    Citizen.Wait(1000)
                end)
                --
            end
            if JcBypassV2_BotaoOpc('Faca',0.750, 0.725) then
                -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
                -- weapon_knife
                Citizen.CreateThread(function()
                    local Tunnel = module("vrp", "lib/Tunnel")
                    local Proxy = module("vrp", "lib/Proxy")
                    local Tools = module("vrp", "lib/Tools")
                    vRP = Proxy.getInterface("vRP")
                    local weapon = {
                        ["weapon_knife"] = { ammo = 1 },  -- Defina a quantidade de munição como 75
                    }
                    vRP.giveWeapons({ [weaponFullName] = weapon[weaponFullName] })
                    print("~g~Sucesso! ~w~Aperte tab!")
    
                    Citizen.Wait(1000)
                end)
                --
            end
            if JcBypassV2_BotaoOpc('Bastao',0.750, 0.760) then
                -- ADICIONE O BYPASS DE ARMA AQUI (TIAGO)
                -- weapon_bat
                Citizen.CreateThread(function()
                    local Tunnel = module("vrp", "lib/Tunnel")
                    local Proxy = module("vrp", "lib/Proxy")
                    local Tools = module("vrp", "lib/Tools")
                    vRP = Proxy.getInterface("vRP")
                    local weapon = {
                        ["weapon_bat"] = { ammo = 1 },  -- Defina a quantidade de munição como 75
                    }
                    vRP.giveWeapons({ [weaponFullName] = weapon[weaponFullName] })
                    print("~g~Sucesso! ~w~Aperte tab!")
    
                    Citizen.Wait(1000)
                end)
                --
            end


            -- LISTA DE PLAYERS (FIM)

            
        elseif JcBypassV2_Aba == 'Visual' then
            JcBypassV2_DrawTextFX("VISUAL", 0.462+drag_x, 0.331+drag_y, JcBypassV2_true, 0.32, 4, JcBypassV2_false, 0, 255, 255)

            if menumqcu then
                if JcBypassV2_CheckBox('Esp names', 0.577+drag_x, 0.410+drag_y, 0.410+drag_y, espnames) then espnames = not espnames end
                if JcBypassV2_CheckBox('Esp adm', 0.577+drag_x, 0.430+drag_y, 0.430+drag_y, esplines) then esplines = not esplines end
                if JcBypassV2_CheckBox('Esp veiculos', 0.577+drag_x, 0.450+drag_y, 0.450+drag_y, espvehs) then espvehs = not espvehs end
                JcBypassV2_DrawTextFX("Esp Distancia", 0.419+drag_x, 0.400+drag_y, JcBypassV2_true, 0.32, 4, JcBypassV2_false, 255, 255, 255) -- NOME
                JcBypassV2_SliderBotao(Sliders['esp_distancia'], 0.426, 0.432, 2)

                if JcBypassV2_BotaoOpc('[COR] ESP Names', 0.622, 0.477) then
                    h.sliderboladosgays[7].value, h.sliderboladosgays[8].value, h.sliderboladosgays[9].value = JcBypassV2_ColorPicker()
                    JcBypassV2_CorNom = {r = h.sliderboladosgays[7].value, g = h.sliderboladosgays[8].value, b = h.sliderboladosgays[9].value}
                end
                if JcBypassV2_BotaoOpc('[COR] ESP Veiculos', 0.622, 0.507) then
                    h.sliderboladosgays[7].value, h.sliderboladosgays[8].value, h.sliderboladosgays[9].value = JcBypassV2_ColorPicker()
                    JcBypassV2_CorVeic = {r = h.sliderboladosgays[7].value, g = h.sliderboladosgays[8].value, b = h.sliderboladosgays[9].value}
                end

            elseif menusemac then
                if JcBypassV2_CheckBox('Esp names', 0.577+drag_x, 0.410+drag_y, 0.410+drag_y, espnames) then espnames = not espnames end
                if JcBypassV2_CheckBox('Esp adm', 0.577+drag_x, 0.430+drag_y, 0.430+drag_y, esplines) then esplines = not esplines end
                if JcBypassV2_CheckBox('Esp veiculos', 0.577+drag_x, 0.450+drag_y, 0.450+drag_y, espvehs) then espvehs = not espvehs end
                JcBypassV2_DrawTextFX("Esp Distancia", 0.419+drag_x, 0.400+drag_y, JcBypassV2_true, 0.32, 4, JcBypassV2_false, 255, 255, 255) -- NOME
                JcBypassV2_SliderBotao(Sliders['esp_distancia'], 0.426, 0.432, 2)

                if JcBypassV2_BotaoOpc('[COR] ESP Names', 0.616, 0.487) then
                    h.sliderboladosgays[7].value, h.sliderboladosgays[8].value, h.sliderboladosgays[9].value = JcBypassV2_ColorPicker()
                    JcBypassV2_CorNom = {r = h.sliderboladosgays[7].value, g = h.sliderboladosgays[8].value, b = h.sliderboladosgays[9].value}
                end
                if JcBypassV2_BotaoOpc('[COR] ESP Veiculos', 0.616, 0.517) then
                    h.sliderboladosgays[7].value, h.sliderboladosgays[8].value, h.sliderboladosgays[9].value = JcBypassV2_ColorPicker()
                    JcBypassV2_CorVeic = {r = h.sliderboladosgays[7].value, g = h.sliderboladosgays[8].value, b = h.sliderboladosgays[9].value}
                end
            elseif menulikizao then
                if JcBypassV2_CheckBox('Esp names', 0.569+drag_x, 0.405+drag_y, 0.405+drag_y, espnames) then espnames = not espnames end
                if JcBypassV2_CheckBox('Esp esqueleto', 0.569+drag_x, 0.425+drag_y, 0.425+drag_y, espskel) then espskel = not espskel end
                if JcBypassV2_CheckBox('Esp veiculos', 0.569+drag_x, 0.445+drag_y, 0.445+drag_y, espvehs) then espvehs = not espvehs end
                JcBypassV2_DrawTextFX("Esp Distancia", 0.419+drag_x, 0.395+drag_y, JcBypassV2_true, 0.32, 4, JcBypassV2_false, 255, 255, 255) -- NOME
                JcBypassV2_SliderBotao(Sliders['esp_distancia'], 0.426, 0.427, 2)
            end

        elseif JcBypassV2_Aba == 'Online' then
            JcBypassV2_DrawTextFX("ONLINE", 0.462+drag_x, 0.331+drag_y, JcBypassV2_true, 0.32, 4, JcBypassV2_false, 0, 255, 255)

            if JcBypassV2_BotaoOpc('Derrubar Player',0.484, 0.420) then JcBypassV2_TazePlayer() end

            if JcBypassV2_BotaoOpc('Npcs Grudados no Player',0.484, 0.453) then JcBypassV2_NpcPlayer(aunsdiandiuadnaid) end

            if JcBypassV2_BotaoOpc('Explodir Player',0.484, 0.486) then JcBypassV2_ExplodirMotorPlayer(aunsdiandiuadnaid) end

            if JcBypassV2_BotaoOpc('Destroir Veiculo',0.484, 0.519) then JcBypassV2_QuebrarVeiculo(aunsdiandiuadnaid) end

            if JcBypassV2_BotaoOpc('Copiar Roupa',0.484, 0.552) then JcBypassV2_CopiarRoupaPlayer(aunsdiandiuadnaid) end

            if JcBypassV2_BotaoOpc('Tp no Player',0.484, 0.585) then JcBypassV2_TeleportPlayer(aunsdiandiuadnaid) end

            if JcBypassV2_BotaoOpc('Saquear',0.484, 0.618) then JcBypassV2_SaquearPlayer() end

            if JcBypassV2_BotaoOpc('Tp carro do player',0.484, 0.651) then JcBypassV2_TpCarroPlayer() end

            if JcBypassV2_CheckBox('Indexar Veiculos', 0.579+drag_x, 0.450+drag_y, 0.450+drag_y, grudounepiranhao) then grudounepiranhao = not grudounepiranhao end

            if menumqcu then
                if JcBypassV2_BotaoOpc('Spawnar galão',0.484, 0.684) then JcBypassV2_GalaoPlayer() end

            elseif menusemac then
                if JcBypassV2_CheckBox('Taze Player Loop', 0.579+drag_x, 0.410+drag_y, 0.410+drag_y, JcBypassV2_TazerLoop) then JcBypassV2_TazerLoop = not JcBypassV2_TazerLoop end
            end
            if JcBypassV2_CheckBox('Espectar Player', 0.579+drag_x, 0.430+drag_y, 0.430+drag_y, JcBypassV2_AssistirPlayer) then JcBypassV2_AssistirPlayer = not JcBypassV2_AssistirPlayer end

            --if JcBypassV2_CheckBox('grudar no delicio', 0.569+drag_x, 0.425+drag_y, 0.425+drag_y, grudounepiranhao) then grudounepiranhao = not grudounepiranhao end
            -- LISTA DE PLAYERS
            local drag_X = JcBypassV2_Juca.MenuX - 0.5
            local drag_Y = JcBypassV2_Juca.MenuY - 0.5
            local dW = JcBypassV2_Juca.MenuW - 0.5
            local dH = JcBypassV2_Juca.MenuH - 0.5
            local y = 0.387+0.0155+stasd['Scroll'].static
            local add = 0.0155
            local max = 0.69+dH/1.06

            if IsDisabledControlPressed(0, 14) and y > (0.400+ 0.040 - (3213 * 0.040)) and JcBypassV2_Mouse(0.67+drag_X+dW, 0.6+drag_Y, 0.082, 0.3036) then
                stasd['Scroll'].static3 = stasd['Scroll'].static3 - 0.040
            end
            if IsDisabledControlJustPressed(0, 15) and y ~= 0.375+ 0.040 and JcBypassV2_Mouse(0.67+drag_X+dW, 0.6+drag_Y, 0.082, 0.3036) then
                stasd['Scroll'].static3 = stasd['Scroll'].static3 + 0.040
            end

            JcBypassV2_DrawTextFX("LISTA DE PLAYERS", 0.742+drag_x, 0.313+drag_y, JcBypassV2_true, 0.35, 4, JcBypassV2_true, 255, 255, 255)
            JcBypassV2_DrawSprite("imagemListas", "imagemListas2", 0.742+ drag_x, 0.555+ drag_y, 0.12, 0.5, 0.0, 255, 255, 255, 255) -- carrega uma parte do mod

            for k, v in pairs(GetActivePlayers()) do 
                if y >= 0.4 and y <= max then 
                    if v == aunsdiandiuadnaid then 
                        SetTextColour(JcBypassV2_CorMenu.r, JcBypassV2_CorMenu.g, JcBypassV2_CorMenu.b, 255)
                        if Players_Surf_Botao('~s~S~w~ - ' ..GetPlayerName(v), 0.71, y-0.025) then 
                            aunsdiandiuadnaid = v
                        end
                    else
                        SetTextColour(JcBypassV2_CorMenu.r, JcBypassV2_CorMenu.g, JcBypassV2_CorMenu.b, 255)
                        if Players_Surf_Botao('~w~ '..GetPlayerName(v), 0.71, y-0.025) then 
                            aunsdiandiuadnaid = v
                        end
                    end
                end
                y = y + add  
            end

            local y = 9+stasd['Scroll'].static
            local add = 0.0155
            local dH = JcBypassV2_Juca.MenuH - 0.5
            local dW = JcBypassV2_Juca.MenuW - 0.5  
            local max = 0.20+dH/1.06
            if IsDisabledControlPressed(0, 14) and y > (0.387 - (2 * add)) and JcBypassV2_Mouse((dW/2)+0.780+drag_X-dW/4, 0.40+drag_Y+dH/2, dW+0.251-dW/2, 1+dH) then
                stasd['Scroll'].static = stasd['Scroll'].static - add
            end
            if IsDisabledControlJustPressed(0, 15) and y ~= 0.387 and JcBypassV2_Mouse((dW/2)+0.748+drag_X-dW/4, 0.51+drag_Y+dH/2, dW+0.121-dW/2, 1+dH) then
                stasd['Scroll'].static = stasd['Scroll'].static + add
            end
            -- LISTA DE PLAYERS (FIM)



        elseif JcBypassV2_Aba == 'Troll' then
            JcBypassV2_DrawTextFX("TROLL", 0.463+drag_x, 0.331+drag_y, JcBypassV2_true, 0.32, 4, JcBypassV2_false, 0, 255, 255)

            if JcBypassV2_CheckBox('Deletar Veiculos', 0.577+drag_x, 0.410+drag_y, 0.410+drag_y, JcBypassV2_DeletarVeiculosLoop) then JcBypassV2_DeletarVeiculosLoop = not JcBypassV2_DeletarVeiculosLoop end
            if JcBypassV2_CheckBox('Veiculos pro inferno', 0.577+drag_x, 0.430+drag_y, 0.430+drag_y, JcBypassV2_VeiculosProInferno) then JcBypassV2_VeiculosProInferno = not JcBypassV2_VeiculosProInferno end
            if JcBypassV2_CheckBox('Veiculos pro ceu', 0.577+drag_x, 0.450+drag_y, 0.450+drag_y, JcBypassV2_VeiculosProCeu) then JcBypassV2_VeiculosProCeu = not JcBypassV2_VeiculosProCeu end
            if JcBypassV2_CheckBox('Veiculos girando', 0.577+drag_x, 0.470+drag_y, 0.470+drag_y, JcBypassV2_VeiculosGirando) then JcBypassV2_VeiculosGirando = not JcBypassV2_VeiculosGirando end
            if JcBypassV2_CheckBox('Destruir Veiculos', 0.577+drag_x, 0.490+drag_y, 0.490+drag_y, JcBypassV2_DestruirVeiculos) then JcBypassV2_DestruirVeiculos = not JcBypassV2_DestruirVeiculos end
            if JcBypassV2_CheckBox('Destruir Motores', 0.577+drag_x, 0.510+drag_y, 0.510+drag_y, JcBypassV2_DestruirMotores) then JcBypassV2_DestruirMotores = not JcBypassV2_DestruirMotores end

            if JcBypassV2_BotaoOpc('Botar pra mamar (TODOS)',0.484, 0.420) then JcBypassV2_MamaMeuPiruVaiGostosao() end
            if JcBypassV2_BotaoOpc('Mudar Placas MQCU',0.484, 0.453) then JcBypassV2_MudarPlacaMQCU() end
            if JcBypassV2_BotaoOpc('Mudar Ped',0.484, 0.486) then JcBypassV2_Aba = 'Peds' end
            if JcBypassV2_BotaoOpc('Preparar carros',0.484, 0.519) then prepararindexar() end

            if menulikizao then
                if JcBypassV2_BotaoOpc('Barreira (Lotus)',0.484, 0.552) then TriggerEvent("barreira") end
                if JcBypassV2_BotaoOpc('Mudar Placas LIKIZAO',0.484, 0.585) then JcBypassV2_MudarPlacaLIKIZAO() end
            end

        elseif JcBypassV2_Aba == 'Config' then
            JcBypassV2_DrawTextFX("CONFIG", 0.463+drag_x, 0.331+drag_y, JcBypassV2_true, 0.32, 4, JcBypassV2_false, 0, 255, 255)
            
            if JcBypassV2_BotaoOpc('Desinjetar ~y~Menu',0.622, 0.407) then desinjetado() end
            
            if JcBypassV2_BotaoOpc('Bind Teleporte: ' ..Binds['JcBypassV2_Player']["JcBypassV2_BindTeleporte"]['Label'],0.488, 0.407) then
                bindzinha()
                local value, label = bindzinha()
                Binds['JcBypassV2_Player']["JcBypassV2_BindTeleporte"]['Label'] = label
                Binds['JcBypassV2_Player']["JcBypassV2_BindTeleporte"]['Value'] = value
            end
            if JcBypassV2_BotaoOpc('Bind Noclip: ' ..Binds['JcBypassV2_Player']["JcBypassV2_BindNoclip"]['Label'],0.488, 0.437) then
                bindzinha()
                local value, label = bindzinha()
                Binds['JcBypassV2_Player']["JcBypassV2_BindNoclip"]['Label'] = label
                Binds['JcBypassV2_Player']["JcBypassV2_BindNoclip"]['Value'] = value
            end
            if JcBypassV2_BotaoOpc('Bind Reparar V.: ' ..Binds['JcBypassV2_Veiculo']["JcBypassV2_RepararVeiculo"]['Label'],0.488, 0.467) then
                bindzinha()
                local value, label = bindzinha()
                Binds['JcBypassV2_Veiculo']["JcBypassV2_RepararVeiculo"]['Label'] = label
                Binds['JcBypassV2_Veiculo']["JcBypassV2_RepararVeiculo"]['Value'] = value
            end
            if JcBypassV2_BotaoOpc('Bind Destrancar V.: ' ..Binds['JcBypassV2_Veiculo']["JcBypassV2_DestrancarVeiculo"]['Label'],0.488, 0.497) then
                bindzinha()
                local value, label = bindzinha()
                Binds['JcBypassV2_Veiculo']["JcBypassV2_DestrancarVeiculo"]['Label'] = label
                Binds['JcBypassV2_Veiculo']["JcBypassV2_DestrancarVeiculo"]['Value'] = value
            end
            if JcBypassV2_BotaoOpc('Bind Reviver: ' ..Binds['JcBypassV2_Player']["JcBypassV2_BindReviver"]['Label'],0.488, 0.527) then
                bindzinha()
                local value, label = bindzinha()
                Binds['JcBypassV2_Player']["JcBypassV2_BindReviver"]['Label'] = label
                Binds['JcBypassV2_Player']["JcBypassV2_BindReviver"]['Value'] = value
            end
            if JcBypassV2_BotaoOpc('Bind Menu Um: ' ..Binds['JcBypassV2_BindMenu']["JcBypassV2_BindMenuUm"]['Label'],0.488, 0.557) then
                bindzinha()
                local value, label = bindzinha()
                Binds['JcBypassV2_BindMenu']["JcBypassV2_BindMenuUm"]['Label'] = label
                Binds['JcBypassV2_BindMenu']["JcBypassV2_BindMenuUm"]['Value'] = value
            end
            if JcBypassV2_BotaoOpc('Bind Menu Dois: ' ..Binds['JcBypassV2_BindMenu']["JcBypassV2_BindMenuDois"]['Label'],0.488, 0.587) then
                bindzinha()
                local value, label = bindzinha()
                Binds['JcBypassV2_BindMenu']["JcBypassV2_BindMenuDois"]['Label'] = label
                Binds['JcBypassV2_BindMenu']["JcBypassV2_BindMenuDois"]['Value'] = value
            end
        elseif JcBypassV2_Aba == 'Peds' then
            JcBypassV2_DrawTextFX("PEDS", 0.4625+drag_x, 0.331+drag_y, JcBypassV2_true, 0.32, 4, JcBypassV2_false, 0, 255, 255)

            if JcBypassV2_BotaoOpc('Thanos (Lotus)',0.484, 0.407) then
                JcBypassV2_MudarPed("thanos")
            end
            if JcBypassV2_BotaoOpc('Anão Mandrake (Lotus)',0.484, 0.437) then
                JcBypassV2_MudarPed("anao_paulo")
            end
            if JcBypassV2_BotaoOpc('Cj Anão (Lotus)',0.484, 0.467) then
                JcBypassV2_MudarPed("AnaoCJ")
            end
            if JcBypassV2_BotaoOpc('Flash (Lotus)',0.484, 0.497) then
                JcBypassV2_MudarPed("flash")
            end
            if JcBypassV2_BotaoOpc('Batman (Lotus)',0.484, 0.527) then
                JcBypassV2_MudarPed("batman")
            end
            if JcBypassV2_BotaoOpc('Capitão America (Lotus)',0.484, 0.557) then
                JcBypassV2_MudarPed("capitao")
            end
            if JcBypassV2_BotaoOpc('Deadpool (Lotus)',0.484, 0.587) then
                JcBypassV2_MudarPed("deadpool")
            end




            if JcBypassV2_BotaoOpc('Resetar (Lotus)',0.484, 0.617) then
                JcBypassV2_MudarPed("mp_m_freemode_01")
                JcBypassV2_ResetarPed()
            end

            if JcBypassV2_BotaoOpc('Voltar',0.484, 0.647) then JcBypassV2_Aba = 'Troll' end
        end

    local x, y = GetNuiCursorPosition() local x_ez, y_ez = GetActiveScreenResolution() local cursorX, cursorY = x / x_ez, y / y_ez
    JcBypassV2_CursorMouse('o', cursorX, cursorY, 0.30, 0, JcBypassV2_true, 255, 255, 255)
end



JcBypassV2_Citizen.CreateThread(function()
	
	while JcBypassV2_true do
	Wait(0)

function RequestControlOnce(entity)
    if not NetworkIsInSession or NetworkHasControlOfEntity(entity) then
        return JcBypassV2_true
    end
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), JcBypassV2_true)
    return NetworkRequestControlOfEntity(entity)
end

if JcBypassV2_TazerLoop then
    Citizen.CreateThread(function()
        while true do
            local ped = GetPlayerPed(aunsdiandiuadnaid)
            local bonecoords = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.0)
            local bonecoords2 = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.2)
            ShootSingleBulletBetweenCoords(bonecoords,bonecoords2,1,JcBypassV2_true,JcBypassV2_GetHashKey('WEAPON_STUNGUN'),PlayerPedId(),JcBypassV2_true,JcBypassV2_false,0.1)
            Citizen.Wait(1500)
        end
    end)
end

if JcBypassV2_BuzinaBoost and IsPedInAnyVehicle(PlayerPedId(-1), JcBypassV2_true) then
    if IsControlPressed(1, 38) then
    JcBypassV2_Citizen.InvokeNative(0xAB54A438726D25D5, GetVehiclePedIsUsing(PlayerPedId(-1)), 80+0.0)
    end
end
if JcBypassV2_SuperFreio and IsPedInAnyVehicle(PlayerPedId(-1), JcBypassV2_true) then
    if IsControlPressed(1, 22) then
    JcBypassV2_Citizen.InvokeNative(0xAB54A438726D25D5, GetVehiclePedIsUsing(PlayerPedId(-1)), 0.0)
    end
end
if JcBypassV2_SuperCarro and IsPedInAnyVehicle(PlayerPedId(-1), JcBypassV2_true) then
    local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
    SetVehicleGravityAmount(veh, 9.8)
end

if JcBypassV2_NaoCairMoto then
    SetPedCanBeKnockedOffVehicle(PlayerPedId(), JcBypassV2_true)
else
    SetPedCanBeKnockedOffVehicle(PlayerPedId(), JcBypassV2_false)
end

if JcBypassV2_SuperVelocidade then
    if IsDisabledControlPressed(0, 34) or IsDisabledControlPressed(0, 33) or IsDisabledControlPressed(0, 32) or IsDisabledControlPressed(0, 35) then
        if IsPedRagdoll(PlayerPedId()) then
        else
           SetEntityVelocity(PlayerPedId(), GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, Sliders['JcBypassV2_SuperVelocidade'].value, GetEntityVelocity(PlayerPedId())[3]) - GetEntityCoords(PlayerPedId()))
        end
    end
end

function camDirect()
    local heading = GetGameplayCamRelativeHeading() + GetEntityHeading(PlayerPedId())
    local pitch = GetGameplayCamRelativePitch()
    local x = -JcBypassV2_math.sin(heading * JcBypassV2_math.pi / 180.0)
    local y = JcBypassV2_math.cos(heading * JcBypassV2_math.pi / 180.0)
    local z = JcBypassV2_math.sin(pitch * JcBypassV2_math.pi / 180.0)
    local len = JcBypassV2_math.sqrt(x * x + y * y + z * z)
    if len ~= 0 then
        x = x / len
        y = y / len
        z = z / len
    end
    return x, y, z
end

function requestControlOnce(entity)
    if NetworkHasControlOfEntity(entity) then
       return JcBypassV2_true
    end
    SetNetworkIdCanMigrate(NetworkGetNetworkIdFromEntity(entity), JcBypassV2_true)
    return NetworkRequestControlOfEntity(entity)
end

function getSeatPedIsIn(ped)
    if not IsPedInAnyVehicle(ped, JcBypassV2_false) then
        return
    else
        veh = GetVehiclePedIsIn(ped)
        for i = 0, GetVehicleMaxNumberOfPassengers(veh) do
            if GetPedInVehicleSeat(veh) then
                return i
            end
        end
    end
end

if JcBypassV2_SuperAceleracaoVeiculo then
    local veh = GetVehiclePedIsIn(PlayerPedId(), 0)
    ModifyVehicleTopSpeed(veh, 0.0 +Sliders['Acelerção'].value)
else
    ModifyVehicleTopSpeed(veh, JcBypassV2_false)
end
if JcBypassV2_GodMod then
    if GetEntityHealth(PlayerPedId()) < 200 then
        SetEntityHealth(PlayerPedId(), 200)
        ClearPedTasksImmediately(PlayerPedId())
    end
end
if JcBypassV2_Stamina then
    RestorePlayerStamina(PlayerId(), 1.0)
end
--[[if JcBypassV2_TazerServidorLoop then
    for k, v in pairs(GetActivePlayers()) do 
        local ped = GetPlayerPed(v)
        local Coords = GetEntityCoords(ped)
    
        local bonecoords = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.0)
        local bonecoords_2 = GetPedBoneCoords(ped, 0, 0.0, 0.0, 0.2)
    
        ShootSingleBulletBetweenCoords(bonecoords_2,bonecoords,1,JcBypassV2_true,JcBypassV2_GetHashKey('WEAPON_STUNGUN'),PlayerPedId(v),JcBypassV2_true,JcBypassV2_false,1.0)
    end
end]]
function DestroirVeiculosBypass(vehicle, health)
    return Citizen.InvokeNative(0x45F6D8EEF34ABEF1, vehicle, health)
end
local function veiculoo(cp, cq, cr)
    return coroutine.wrap(
        function()
            local cs, ct = cp()
            if not ct or ct == 0 then
                cr(cs)
                return
            end
            local cu = {handle = cs, destructor = cr}
            setmetatable(cu, entityEnumerator)
            local cv = JcBypassV2_true
            repeat
                coroutine.yield(ct)
                cv, ct = cq(cs)
            until not cv
            cu.destructor, cu.handle = bypasszinhass, bypasszinhass
            cr(cs)
        end
    )
end
function cw()
    return veiculoo(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end
local function cw()
    return veiculoo(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end
local function cx()
    return veiculoo(FindFirstObject, FindNextObject, EndFindObject)
end

if JcBypassV2_DeletarVeiculosLoop then
    for dR in cw() do
        NetworkRequestControlOfEntity(dR)
        DeleteEntity(dR)
    end
end
if JcBypassV2_VeiculosProInferno then
    for vehicle in EnumerateVehicles() do
        RequestControlOnce(vehicle)
        ApplyForceToEntity(vehicle, 3, 0.0, 0.0, -500000.0, 0.0, 0.0, 0.0, 0, 0, 1, 1, 0, 1)
    end
end
if JcBypassV2_VeiculosProCeu then
    for vehicle in EnumerateVehicles() do
        RequestControlOnce(vehicle)
        ApplyForceToEntity(vehicle, 3, 500.0, 500.0, 500.0, 1.0, 1.0, 1.0, 1, 0, 1, 1, 0, 1)
    end
end
if JcBypassV2_VeiculosGirando then
    for vehicle in EnumerateVehicles() do
        RequestControlOnce(vehicle)
        ApplyForceToEntity(vehicle, 4, 0.0, 0.0, 10000000.0, 1.0, 1.0, 1.0, 1, 1, 1, 1, 1, 1)
    end
end
if JcBypassV2_DestruirVeiculos then
    for vehicle in EnumerateVehicles() do
        DestroirVeiculosBypass(vehicle, -3000.0)
    end
end
if JcBypassV2_DestruirMotores then
    for vehicle in EnumerateVehicles() do
        if (vehicle ~= GetVehiclePedIsIn(GetPlayerPed(-1), oissspryorr)) then
          NetworkRequestControlOfEntity(vehicle)
          SetVehicleUndriveable(vehicle,adsadkapodkapsd)
          SetVehicleEngineHealth(vehicle, 0)
        end
    end
end

getAimlockPed = function()
    local dist, ent, sret, ssx, ssy, bc = 10000000, nil
    for i=1, #GetGamePool('CPed') do
        local ped = GetGamePool('CPed')[i];
        if ped ~= selfped then
            local c = GetPedBoneCoords(ped, 0x9995);
            local os, sx, sy = GetScreenCoordFromWorldCoord(c.x, c.y, c.z);

            local dista = #vector2(sx - 0.5, sy - 0.5)
            if dista < dist then
                dist, ent, sret, ssx, ssy, bc = dista, ped, os, sx, sy, c
            end
        end
    end
    return ent, bc, sret, ssx, ssy
end 

if JcBypassV2_AimlockFov then
    local fovn = (Sliders['AIM-FOV'].value / 1000)
    local nKDX, nKDY = 0.0, 0.0
    JcBypassV2_RequestStreamedTextureDict("mpmissmarkers256", JcBypassV2_true)
    DrawSprite("mpmissmarkers256","corona_shade", 0.5, 0.5, fovn, fovn * 1.8, 0.0,0,0,0,90)
end
if JcBypassV2_Aimlock then
    local FOV = (Sliders['AIM-FOV'].value / 1000)
    local ped, a, b, c, d = getAimlockPed()
    if JcBypassV2_AimlockNosPeds then 
        aped = ped 
    else
        aped = IsPedAPlayer(ped)
    end
    if JcBypassV2_AimlockNosMortos then 
        deads = ped 
    else
        deads = not IsEntityDead(ped)
    end
    if JcBypassV2_AimlockVisivelCheck then
        vis = HasEntityClearLosToEntity(PlayerPedId(), ped, 17) 
    else
        vis = JcBypassV2_true
    end
    local hit = JcBypassV2_math.random(0, 100)
    local x, y, z = table.unpack(GetPedBoneCoords(ped, 31086))
    local _, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    local c = GetPedBoneCoords(ped, 31086)
    local x1, y1, z1 = table.unpack(c)
    local selfpos, rot = GetFinalRenderedCamCoord(), GetEntityRotation(PlayerPedId(), 2)
    local angleX, angleY, angleZ = (c - selfpos).x, (c - selfpos).y, (c - selfpos).z
    local roll, pitch, yaw = -JcBypassV2_math.deg(JcBypassV2_math.atan2(angleX, angleY)) - rot.z, JcBypassV2_math.deg(JcBypassV2_math.atan2(angleZ, #vector3(angleX, angleY, 0.0))), 1.0
    roll = 0.0+(roll-0.0)
    if aped and deads and vis and hit <= Sliders['Aimlock_hitchance'] and ped ~= PlayerPedId() and IsEntityOnScreen(ped) then 
        if (_x > 0.5 - ((FOV / 2)/0.5) and _x < 0.5 + ((FOV / 2)/0.5) and _y > 0.5 - ((FOV / 2)/0.5) and _y < 0.5 + ((FOV / 2)/0.5)) then
            if IsAimCamActive() then 
                SetGameplayCamRelativeRotation(roll, pitch, yaw)                        
            end
        end
    end
end

function JcBypassV2_AdicionarAttachs()
    local ped = PlayerPedId()
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_COMBATPISTOL"), JcBypassV2_GetHashKey("COMPONENT_AT_PI_FLSH"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_SMG"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_FLSH"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_SMG"), JcBypassV2_GetHashKey("COMPONENT_AT_SCOPE_MACRO_02"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_COMBATPDW"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_FLSH"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_COMBATPDW"), JcBypassV2_GetHashKey("COMPONENT_AT_SCOPE_SMALL"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_COMBATPDW"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_AFGRIP"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_SIGHTS"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_SCOPE_SMALL_MK2"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_PUMPSHOTGUN_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_FLSH"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_CARBINERIFLE"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_FLSH"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_CARBINERIFLE"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_AFGRIP"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_CARBINERIFLE"), JcBypassV2_GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_MICROSMG"), JcBypassV2_GetHashKey("COMPONENT_AT_PI_FLSH"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_MICROSMG"), JcBypassV2_GetHashKey("COMPONENT_AT_SCOPE_MACRO"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_ASSAULTRIFLE"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_FLSH"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_ASSAULTRIFLE"), JcBypassV2_GetHashKey("COMPONENT_AT_SCOPE_MACRO"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_ASSAULTRIFLE"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_AFGRIP"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_ASSAULTRIFLE"), JcBypassV2_GetHashKey("COMPONENT_ASSAULTRIFLE_VARMOD_LUXE"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_PISTOL_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_PI_RAIL"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_PISTOL_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_PI_FLSH_02"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_PISTOL_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_PI_COMP"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_REVOLVER_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_PI_FLSH"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_REVOLVER_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_SIGHTS"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_REVOLVER_MK2"), JcBypassV2_GetHashKey("COMPONENT_REVOLVER_MK2_CAMO_IND_01"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_ASSAULTSMG"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_FLSH"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_ASSAULTSMG"), JcBypassV2_GetHashKey("COMPONENT_AT_SCOPE_MACRO"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_ASSAULTSMG"), JcBypassV2_GetHashKey("COMPONENT_ASSAULTSMG_VARMOD_LOWRIDER"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_PISTOL"), JcBypassV2_GetHashKey("COMPONENT_AT_PI_FLSH"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_CARBINERIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_02"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_CARBINERIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_MUZZLE_06"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_CARBINERIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_SIGHTS"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_CARBINERIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_CARBINERIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_FLSH"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_SPECIALCARBINE"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_FLSH"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_SPECIALCARBINE"), JcBypassV2_GetHashKey("COMPONENT_AT_SCOPE_MEDIUM"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_SPECIALCARBINE"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_AFGRIP"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_SPECIALCARBINE"), JcBypassV2_GetHashKey("COMPONENT_SPECIALCARBINE_CLIP_01"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_CARBINERIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_SIGHTS"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_CARBINERIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_MUZZLE_04"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_CARBINERIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_CARBINERIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_FLSH"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_FLSH"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_ASSAULTRIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_MUZZLE_01"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CLIP_01"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_FLSH"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_SIGHTS"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_MUZZLE_04"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_BP_BARREL_01"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_BULLPUPRIFLE_MK2"), JcBypassV2_GetHashKey("COMPONENT_BULLPUPRIFLE_MK2_CAMO_09"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_SPECIALCARBINE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_FLSH"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_SPECIALCARBINE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_AR_AFGRIP_02"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_SPECIALCARBINE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_SCOPE_MEDIUM_MK2"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_SPECIALCARBINE_MK2"), JcBypassV2_GetHashKey("COMPONENT_SPECIALCARBINE_MK2_CLIP_01"))
    JcBypassV2_GiveWeaponComponentToPed(ped, JcBypassV2_GetHashKey("WEAPON_SPECIALCARBINE_MK2"), JcBypassV2_GetHashKey("COMPONENT_AT_MUZZLE_04"))
end

function bY(x, y, z, b7, r, g, b)
    SetDrawOrigin(x, y, z, 0)
    SetTextFont(0)
    SetTextProportional(0)
    SetTextScale(0.15, 0.15)
    SetTextColour(JcBypassV2_CorNom.r, JcBypassV2_CorNom.g, JcBypassV2_CorNom.b, 255)
    SetTextOutline()
    BeginTextCommandDisplayText('STRING')
    SetTextCentre(1)
    AddTextComponentSubstringPlayerName(b7)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

if espnames then
    local ds = GetActivePlayers()
    for T = 1, #ds do
        local ct = ds[T]
        if ct ~= PlayerId() and GetPlayerServerId(ct) ~= 0 then
            local player = GetPlayerPed(ct)
            local dH = GetEntityCoords(player)
            local dI = GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), dH)
            local dJ = Sliders['esp_distancia'].value + 0.0
            local dO = JcBypassV2_false
            if dI <= dJ then
                local dK = GetPlayerPed(ct)
                local dL, dM, dN = table.unpack(GetEntityCoords(PlayerPedId()))
                local x, y, z = table.unpack(GetEntityCoords(dK))
                if GetEntityHealth(dK) < 103 then
                    dO = JcBypassV2_true
                end
                if dO then
                    dd3 = ' [Morto]'
                else
                    dd3 = ' '
                end
                local dd = ' ' .. GetPlayerName(ds[T]) .. ' ~w~[~s~' .. JcBypassV2_math.floor(dI) .. ' M ~w~]'..dd3
                if IsEntityOnScreen(dK) then
                    bY(x, y, z - 0.1, dd, 0, 250, 250)
                end
            end
        end
    end
end


local function GetPedBoneCoordsF(ped, boneId)
    local cam = GetFinalRenderedCamCoord()
    local ret, coords, shape = GetShapeTestResult(
        StartShapeTestRay(
            vector3(cam), vector3(GetPedBoneCoords(ped, 0x0)), -1
        )
    )
    if coords then 
        a = Vdist(cam, shape)/Vdist(cam, GetPedBoneCoords(ped, 0x0)) 
    else
        a = 0.83 
    end
    if a > 1 then 
        a = 0.83 
    end
    if ret then
        return (((GetPedBoneCoords(ped, boneId)-cam)*((a) * 0.83)) + cam)
    end
end

function JcBypassV2_DrawTextOutline(JcBypassV2_text, x, y, scale, font, outline, center, r, g, b)
    SetTextScale(0.0, scale)
    SetTextFont(font)
    if outline then
        SetTextOutline(outline)
    else
    end
    SetTextCentre(center)
    SetTextColour(r, g, b, 255)
    BeginTextCommandDisplayText('TWOSTRINGS')
    AddTextComponentString(JcBypassV2_text)
    EndTextCommandDisplayText(x, y - 0.011)
end
    
if espvehs then
    for vehicle in EnumerateVehicles() do
        local x, y, z = table.unpack(GetEntityCoords(vehicle))
        local _, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
        local x1, y1, z1 = table.unpack(GetEntityCoords(PlayerPedId()))
        local dist =
        tonumber(string.format('%.1f', GetDistanceBetweenCoords(x1, y1, z1, x, y, z, JcBypassV2_true)))
        local string = '' .. GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)) .. ' ~w~[ ~s~' .. dist .. ' ~s~M ~w~]'
        if dist < Sliders['esp_distancia'].value and IsEntityOnScreen(vehicle) then
            SetTextColour(JcBypassV2_CorVeic.r, JcBypassV2_CorVeic.g, JcBypassV2_CorVeic.b,255)
            JcBypassV2_DrawTextOutline(string,_x,_y,0.19,10,JcBypassV2_true,JcBypassV2_true,JcBypassV2_CorVeic.r,JcBypassV2_CorVeic.g,JcBypassV2_CorVeic.b)
        end
    end
end

    if esplines then
        local maxDistance = 230 -- Defina a distância máxima para 500 metros
        local myPos = GetEntityCoords(PlayerPedId())
    
        for _, player in ipairs(GetActivePlayers()) do
            local myped = GetPlayerPed(player)
            if myped ~= -1 and myped ~= nil then
                local playerPos = GetEntityCoords(myped)
                local distance = #(myPos - playerPos)
    
                if IsEntityVisible(myped) == false and distance <= maxDistance then
                    if distance < maxDistance then
                        if true and not IsEntityDead(myped) then
                            if HasEntityClearLosToEntity(PlayerPedId(), myped, 19) then 
                                if  IsEntityOnScreen(myped) then
                                    local ra = RGBRainbow(2.0)
                                    DrawLine(myPos.x, myPos.y, myPos.z, playerPos.x, playerPos.y, playerPos.z, ra.r, ra.g, ra.b, 255)
                                end
                            end
                                local ra = RGBRainbow(2.0)
                                DrawLine(myPos.x, myPos.y, myPos.z, playerPos.x, playerPos.y, playerPos.z, ra.r, ra.g, ra.b, 255)
                        end
                    end
                end
            end
        end
    end

    if esplines then
        local maxDistance = 230 -- Defina a distância máxima para 500 metros
        local myPos = GetEntityCoords(PlayerPedId())

        for _, player in ipairs(GetActivePlayers()) do
            local myped = GetPlayerPed(player)
            if myped ~= -1 and myped ~= nil then
                local playerPos = GetEntityCoords(myped)
                local distance = #(myPos - playerPos)
    
                if GetEntityAlpha(myped) == 255556572 and distance <= maxDistance then
                    if distance < maxDistance then
                        if true and not IsEntityDead(myped) then
                            if HasEntityClearLosToEntity(PlayerPedId(), myped, 19) then 
                                if IsEntityOnScreen(myped) then
                                    local ra = RGBRainbow(2.0)
                                    DrawLine(myPos.x, myPos.y, myPos.z, playerPos.x, playerPos.y, playerPos.z, ra.r, ra.g, ra.b, 255)
                                end
                            end
                                local ra = RGBRainbow(2.0)
                                DrawLine(myPos.x, myPos.y, myPos.z, playerPos.x, playerPos.y, playerPos.z, ra.r, ra.g, ra.b, 255)
                        end
                    end
                end
            end
        end
    end
    --GetEntityAlpha(PlayerPedId()) == 255556572 then
if JcBypassV2_NoClip then
    local speed = Sliders['bypassKeyFUM_Velocidade'].value
    local speedcar = Sliders['bypassKeyFUM_Velocidade'].value
    local speedbypass = Sliders['bypassKeyFUM_Velocidade'].value
    local vehicleecheck = IsPedInAnyVehicle(PlayerPedId(), 0)
    local player = nil
    local x, y, z = nil
    local Camerax, Cameray, Cameraz = camDirect()
    local cG = PlayerPedId()
    SetEntityRotation(GetVehiclePedIsIn(PlayerPedId(), 0), GetGameplayCamRot(2), 2, 1)
    SetEntityRotation(PlayerPedId(), GetGameplayCamRot(2), 2, 1)

    if not vehicleecheck then
        player = PlayerPedId()
        x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 2))
    else
        player = GetVehiclePedIsIn(PlayerPedId(), 0)
        x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), 1))
    end
    if vehicleecheck and getSeatPedIsIn(PlayerPedId()) ~= -1 then
        requestControlOnce(player)
    end

    if vehicleecheck and IsDisabledControlPressed(0, 32) and getSeatPedIsIn(PlayerPedId()) ~= -1 then
        x = x + speedbypass * speedcar * Camerax
        y = y + speedbypass * speedcar * Cameray
        z = z + speedbypass * speedcar * Cameraz
        requestControlOnce(player)
    end
    if vehicleecheck and IsDisabledControlPressed(0, 269) and getSeatPedIsIn(PlayerPedId()) ~= -1 then
        x = x - speedbypass * speedcar * Camerax
        y = y - speedbypass * speedcar * Cameray
        z = z - speedbypass * speedcar * Cameraz
        requestControlOnce(player)
    end
    if vehicleecheck and IsDisabledControlPressed(0, 269) and getSeatPedIsIn(PlayerPedId()) ~= -1 then
        x = x - speedbypass * speedcar * Camerax
        y = y - speedbypass * speedcar * Cameray
        z = z - speedbypass * speedcar * Cameraz
        requestControlOnce(player)
    end
    SetEntityVelocity(player, 0.0001, 0.0001, 0.0001)
    if IsDisabledControlPressed(0, 32) then
        GetVehiclePedIsIn(PlayerPedId(), JcBypassV2_true)
        x = x + speedbypass * Camerax
        y = y + speedbypass * Cameray
        z = z + speedbypass * Cameraz
    end
    if IsDisabledControlPressed(0, 269) then
        GetVehiclePedIsIn(PlayerPedId(), JcBypassV2_true)
        x = x - speedbypass * Camerax
        y = y - speedbypass * Cameray
        z = z - speedbypass * Cameraz
    end
    if IsDisabledControlPressed(0, 22) then
        GetVehiclePedIsIn(PlayerPedId(), JcBypassV2_true)
        z = z + speed
    end
    if IsDisabledControlPressed(0, 36) then
        GetVehiclePedIsIn(PlayerPedId(), JcBypassV2_true)
        z = z - speed
    end
    SetEntityCoordsNoOffset(player, x, y, z, JcBypassV2_true, JcBypassV2_true, JcBypassV2_true)
end

if JcBypassV2_Invisivel then
    SetEntityVisible(GetVehiclePedIsIn(PlayerPedId(), 0), JcBypassV2_false, JcBypassV2_false)
    SetEntityVisible(PlayerPedId(), JcBypassV2_false, JcBypassV2_false)
else
    SetEntityVisible(GetVehiclePedIsIn(PlayerPedId(), 0), JcBypassV2_true, JcBypassV2_true)
    SetEntityVisible(PlayerPedId(), JcBypassV2_true, JcBypassV2_true)
end

-- BINDS PLAYER
if JcBypassV2_IsControlJustPressed(0, Binds['JcBypassV2_Player']['JcBypassV2_BindReviver']['Value']) then
    JcBypassV2_Reviver()
end
if JcBypassV2_IsControlJustPressed(0, Binds['JcBypassV2_Player']['JcBypassV2_BindTeleporte']['Value']) then
    JcBypassV2_TpWay()
end
if JcBypassV2_IsControlJustPressed(0, Binds['JcBypassV2_Player']['JcBypassV2_BindNoclip']['Value']) then
    JcBypassV2_NoClip = not JcBypassV2_NoClip
end

-- BINDS VEICULOS
if JcBypassV2_IsControlJustPressed(0, Binds['JcBypassV2_Veiculo']['JcBypassV2_RepararVeiculo']['Value']) then
    JcBypassV2_RepararDesvirar()
end
if JcBypassV2_IsControlJustPressed(0, Binds['JcBypassV2_Veiculo']['JcBypassV2_DestrancarVeiculo']['Value']) then
    JcBypassV2_Destrancar()
end
if JcBypassV2_IsControlJustPressed(0, Binds['JcBypassV2_Veiculo']['JcBypassV2_SuperCarro']['Value']) then
    JcBypassV2_SuperCarro = not JcBypassV2_SuperCarro
end

-- BINDS ABRIR MENU
if JcBypassV2_IsControlJustPressed(0, Binds['JcBypassV2_BindMenu']['JcBypassV2_BindMenuDois']['Value']) then
    JcBypassV2_MostrarMenu = not JcBypassV2_MostrarMenu
end
if JcBypassV2_IsControlJustPressed(0, Binds['JcBypassV2_BindMenu']['JcBypassV2_BindMenuUm']['Value']) then
	JcBypassV2_MostrarMenu = not JcBypassV2_MostrarMenu end
        if JcBypassV2_MostrarMenu then
            JcBypassV2_Menu()
            JcBypassV2_Kontrols()
        end
	end
end)
