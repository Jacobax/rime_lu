--[[中文输入法 （同文无障碍版）

【颜色表2.0】

作者： 风之漫舞 
调用方式：
将本lua放进以下目录/storage/emulated/0/Android/rime/script

trime.yaml:

preset_keys:
  _Keyboard_Color: {label: 🥶, send: function, command: '颜色表2.0.lua'}

preset_keyboards:
  - {click: _Keyboard_Color}
2020-09-11
]]
require "import"
import "android.widget.*"
import "android.view.*"
import "android.graphics.RectF"
import "android.graphics.Color"
import "android.graphics.drawable.StateListDrawable"
import "java.io.File"


local arr={

  {"Emo",
    {
      --{按键名,符号table 或 文本}
      {"表情",[[😀😃😄😁😆😅🤣😂🙂🙃😉😊😇🥰😍🤩😘😗☺😚😙🥲😋😛😜🤪😝🤑🤗🤭🤫🤔🤐🤨😐😑😶😏😒🙄😬🤥😌😔😪🤤😴😷🤒🤕🤢🤮🤧🥵🥶🥴😵🤯🤠🥳🥸😎🤓🧐😕😟🙁☹😮😯😲😳🥺😦😧😨😰😥😢😭😱😖😣😞😓😩😫🥱😤😡😠🤬😈👿💀☠💩🤡👹👺👻👽👾🤖😺😸😹😻😼😽🙀😿😾🙈🙉🙊💋💌💘💝💖💗💓💞💕💟❣💔❤❤❤🧡💛💚💙💜🤎🖤🤍💯💢💥💫💦💨🕳💣💬👁🗨🗯💭💤]]}, --[[长文本，可换行]]
      {"中标",{"，","。","？","！","～","、","：","＃","；","％","＊","——","……","＆","·","￥","（","）","‘","’","“","”","[","]","『","』","〔","〕","｛","｝","【","】","‖","〖","〗","《","》","「","」","｜","〈","〉","«","»","‹","›"}},
      {"英标",{".","@", "~", "-", ",", ":", "*","?","!","_","#","/","=","+","﹉","&","^",";","%","…","$","(",")","\\","..","<",">","|","·","¥","[","]","\"","{","}","–","'","€","¡","¿","`","´","＂","＇","£","¢","฿","♀","♂"}},
      {"数学",[[=+-·/×÷^＞＜≥≤≮≯≡≠≈≒±√³√π%‰％℅½⅓⅔¼¾∶∵∴∷㏒㏑∫∬∭∮∯∰∂∑∏∈∉∅⊂⊃⊆⊇⊄⊅⊊⊈⫋⫌∀∃∩∪∧∨⊙⊕∥⊥⌒∟∠△⊿∝∽∞≌°℃℉㎎㎏μm㎜㎝㎞㎡m³㏄㏕]]},
      {"手势",[[👋🤚🖐✋🖖👌🤌🤏✌🤞🤟🤘🤙👈👉👆🖕👇☝👍👎✊👊🤛🤜👏🙌👐🤲🤝🙏✍💅🤳💪🦾🦿🦵🦶👂🦻👃🧠🫀🫁🦷🦴👀👁👅👄👶🧒👦👧🧑👱👨🧔👩🧓👴👵🙍🙎🙅🙆💁🙋🧏🙇🤦🤷💆💇🚶🧍🧎🏃💃🕺🕴👯🧖🧗🧘🛀🛌]]},
      {"动植",[[🐵🐒🦍🦧🐶🐕🦮🐩🐺🦊🦝🐱🐈🦁🐯🐅🐆🐴🐎🦄🦓🦌🦬🐮🐂🐃🐄🐷🐖🐗🐽🐏🐑🐐🐪🐫🦙🦒🐘🦣🦏🦛🐭🐁🐀🐹🐰🐇🐿🦫🦔🦇🐻🐨🐼🦥🦦🦨🦘🦡🐾🦃🐔🐓🐣🐤🐥🐦🐧🕊🦅🦆🦢🦉🦤🪶🦩🦚🦜🐸🐊🐢🦎🐍🐲🐉🦕🦖🐳🐋🐬🦭🐟🐠🐡🦈🐙🐚🐌🦋🐛🐜🐝🪲🐞🦗🪳🕷🕸🦂🦟🪰🪱🦠💐🌸💮🏵🌹🥀🌺🌻🌼🌷🌱🪴🌲🌳🌴🌵🌾🌿☘🍀🍁🍂🍃🍇🍈🍉🍊🍋🍌🍍🥭🍎🍏🍐🍑🍒🍓🫐🥝🍅🫒🥥🥑🍆🥔🥕🌽🌶🫑🥒🥬🥦🧄🧅🍄🥜🌰🍞🥐🥖🫓🥨🥯🥞🧇🧀🍖🍗🥩🥓🍔🍟🍕🌭🥪🌮🌯🫔🥙🧆🥚🍳🥘🍲🫕🥣🥗🍿🧈🧂🥫🍱🍘🍙🍚🍛🍜🍝🍠🍢🍣🍤🍥🥮🍡🥟🥠🥡🦀🦞🦐🦑🦪🍦🍧🍨🍩🍪🎂🍰🧁🥧🍫🍬🍭🍮🍯🍼🥛☕🫖🍵🍶🍾🍷🍸🍹🍺🍻🥂🥃🥤🧋🧃🧉🧊🥢🍽🍴🥄🔪🏺]]},
      {"音标",[[ɑːɔ:ɜːi:u:ʌɒəɪʊeæeɪaɪɔɪɪəeəʊəəʊaʊptkfθsbdgvðzʃhtstʃjtrʒrdzdʒdrwmnŋl]]},
      {"希腊",[[ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩαβγδεζηθικλμνξοπρστυφχψω]]},
      {"箭头",[[→←↑↓↖↗↙↘↔↕⇞⇟⇆⇅⇔⇕↰↱↲↴↶↷↺↻↜↝↞↟↠↡➺➻➼➳➽➸➹➷⇎➠↣☞☜☟⇦⇧⇨⇩⇪➩➪➫➬➯➱➮➭➠➡➢➣➤➥➦➧➨]]},
      {"旗子",[[🇨🇳🇭🇰🇲🇴🇷🇺🇺🇸🇺🇲🇯🇵🇰🇵🇰🇷🇩🇪🇫🇷🇬🇧🇮🇹🇪🇸🇮🇳🇨🇦🇦🇺🇻🇳🇧🇷🇹🇼🇦🇨🇦🇩🇦🇪🇦🇫🇦🇬🇦🇮🇦🇱🇦🇲🇦🇴🇦🇶🇦🇷🇦🇸🇦🇹🇦🇼🇦🇽🇦🇿🇧🇦🇧🇧🇧🇩🇧🇪🇧🇫🇧🇬🇧🇭🇧🇮🇧🇯🇧🇱🇧🇲🇧🇳🇧🇴🇧🇶🇧🇸🇧🇹🇧🇻🇧🇼🇧🇾🇧🇿🇨🇨🇨🇩🇨🇫🇨🇬🇨🇭🇨🇮🇨🇰🇨🇱🇨🇲🇨🇴🇨🇵🇨🇷🇨🇺🇨🇻🇨🇼🇨🇽🇨🇾🇨🇿🇩🇬🇩🇯🇩🇰🇩🇲🇩🇴🇩🇿🇪🇦🇪🇨🇪🇪🇪🇬🇪🇭🇪🇷🇪🇹🇪🇺🇫🇮🇫🇯🇫🇰🇫🇲🇫🇴🇬🇦🇬🇩🇬🇪🇬🇫🇬🇬🇬🇭🇬🇮🇬🇱🇬🇲🇬🇳🇬🇵🇬🇶🇬🇷🇬🇸🇬🇹🇬🇺🇬🇼🇬🇾🇭🇲🇭🇳🇭🇷🇭🇹🇭🇺🇮🇨🇮🇩🇮🇪🇮🇱🇮🇲🇮🇴🇮🇶🇮🇷🇮🇸🇯🇪🇯🇲🇯🇴🇰🇪🇰🇬🇰🇭🇰🇮🇰🇲🇰🇳🇰🇼🇰🇾🇰🇿🇱🇦🇱🇧🇱🇨🇱🇮🇱🇰🇱🇷🇱🇸🇱🇹🇱🇺🇱🇻🇱🇾🇲🇦🇲🇨🇲🇩🇲🇪🇲🇫🇲🇬🇲🇭🇲🇰🇲🇱🇲🇲🇲🇳🇲🇵🇲🇶🇲🇷🇲🇸🇲🇹🇲🇺🇲🇻🇲🇼🇲🇽🇲🇾🇲🇿🇳🇦🇳🇨🇳🇪🇳🇫🇳🇬🇳🇮🇳🇱🇳🇴🇳🇵🇳🇷🇳🇺🇳🇿🇴🇲🇵🇦🇵🇪🇵🇫🇵🇬🇵🇭🇵🇰🇵🇱🇵🇲🇵🇳🇵🇷🇵🇸🇵🇹🇵🇼🇵🇾🇶🇦🇷🇪🇷🇴🇷🇸🇷🇼🇸🇦🇸🇧🇸🇨🇸🇩🇸🇪🇸🇬🇸🇭🇸🇮🇸🇯🇸🇰🇸🇱🇸🇲🇸🇳🇸🇴🇸🇷🇸🇸🇸🇹🇸🇻🇸🇽🇸🇾🇸🇿🇹🇦🇹🇨🇹🇩🇹🇫🇹🇬🇹🇭🇹🇯🇹🇰🇹🇱🇹🇲🇹🇳🇹🇴🇹🇷🇹🇹🇹🇻🇹🇿🇺🇦🇺🇬🇺🇾🇺🇿🇻🇦🇻🇨🇻🇪🇻🇬🇻🇮🇻🇺🇼🇫🇼🇸🇽🇰🇾🇪🇾🇹🇿🇦🇿🇲🇿🇼]]}
    }
  },
  {"色值",
   { --存放表情的table
    --{按键名,符号table 或 文本}
    {"表1",{"#FFFFFF","#DDDDDD","#AAAAAA","#888888","#666666","#444444","#000000","#FFB7DD","#FF88C2","#FF44AA","#FF0088","#C10066","#A20055","#8C0044","#FFCCCC","#FF8888","#FF3333","#FF0000","#CC0000","#AA0000","#880000","#FFC8B4","#FFA488","#FF7744","#FF5511","#E63F00","#C63300","#A42D00","#FFDDAA","#FFBB66","#FFAA33","#FF8800","#EE7700","#CC6600","#BB5500","#FFEE99","#FFDD55","#FFCC22","#FFBB00","#DDAA00","#AA7700","#886600","#FFFFBB","#FFFF77","#FFFF33","#FFFF00","#EEEE00","#BBBB00","#888800","#EEFFBB","#DDFF77","#CCFF33","#BBFF00","#99DD00","#88AA00","#668800","#CCFF99","#BBFF66","#99FF33","#77FF00","#66DD00","#55AA00","#227700","#99FF99","#66FF66","#33FF33","#00FF00","#00DD00","#00AA00","#008800","#BBFFEE","#77FFCC","#33FFAA","#00FF99","#00DD77","#00AA55","#008844","#AAFFEE","#77FFEE","#33FFDD","#00FFCC","#00DDAA","#00AA88","#008866","#99FFFF","#66FFFF","#33FFFF","#00FFFF","#00DDDD","#00AAAA","#008888","#CCEEFF","#77DDFF","#33CCFF","#00BBFF","#009FCC","#0088A8","#007799","#CCDDFF","#99BBFF","#5599FF","#0066FF","#0044BB","#003C9D","#003377","#CCCCFF","#9999FF","#5555FF","#0000FF","#0000CC","#0000AA","#000088","#CCBBFF","#9F88FF","#7744FF","#5500FF","#4400CC","#2200AA","#220088","#D1BBFF","#B088FF","#9955FF","#7700FF","#5500DD","#4400B3","#3A0088","#E8CCFF","#D28EFF","#B94FFF","#9900FF","#7700BB","#66009D","#550088","#F0BBFF","#E38EFF","#E93EFF","#CC00FF","#A500CC","#7A0099","#660077","#FFB3FF","#FF77FF","#FF3EFF","#FF00FF","#CC00CC","#990099","#770077"}},
    {"表2",{"#f7acbc","#deab8a","#817936","#444693","#ef5b9c","#fedcbd","#7f7522","#2b4490","#feeeed","#f47920","#80752c","#2a5caa","#f05b72","#905a3d","#87843b","#224b8f","#f15b6c","#8f4b2e","#726930","#003a6c","#f8aba6","#87481f","#454926","#102b6a","#f69c9f","#5f3c23","#2e3a1f","#426ab3","#f58f98","#6b473c","#4d4f36","#46485f","#ca8687","#faa755","#b7ba6b","#4e72b8","#f391a9","#fab27b","#b2d235","#181d4b","#bd6758","#f58220","#5c7a29","#1a2933","#d71345","#843900","#bed742","#121a2a","#d64f44","#905d1d","#7fb80e","#0c212b","#d93a49","#8a5d19","#a3cf62","#6a6da9","#b3424a","#8c531b","#769149","#585eaa","#c76968","#826858","#6d8346","#494e8f","#bb505d","#64492b","#78a355","#afb4db","#987165","#ae6642","#abc88b","#9b95c9","#ac6767","#56452d","#74905d","#6950a1","#973c3f","#96582a","#cde6c7","#6f60aa","#b22c46","#705628","#1d953f","#867892","#a7324a","#4a3113","#77ac98","#918597","#aa363d","#412f1f","#007d65","#6f6d85","#ed1941","#845538","#84bf96","#594c6d","#f26522","#8e7437","#45b97c","#694d9f","#d2553d","#69541b","#225a1f","#6f599c","#b4534b","#d5c59f","#367459","#8552a1","#ef4136","#cd9a5b","#007947","#543044","#c63c26","#cd9a5b","#40835e","#63434f","#f3715c","#b36d41","#2b6447","#7d5886","#a7573b","#df9464","#005831","#401c44","#aa2116","#b76f40","#006c54","#472d56","#b64533","#ad8b3d","#375830","#45224a","#b54334","#dea32c","#274d3d","#411445","#853f04","#d1923f","#375830","#4b2f3d","#840228","#c88400","#27342b","#402e4c","#7a1723","#c37e00","#65c294","#c77eb5","#a03939","#c37e00","#73b9a2","#ea66a6","#8a2e3b","#e0861a","#72baa7","#f173ac","#8e453f","#ffce7b","#005344","#fffffb","#8f4b4a","#fcaf17","#122e29","#fffef9","#892f1b","#ba8448","#293047","#f6f5ec","#6b2c25","#896a45","#00ae9d","#d9d6c3","#733a31","#76624c","#508a88","#d1c7b7","#54211d","#6d5826","#70a19f","#f2eada","#78331e","#ffc20e","#50b7c1","#d3d7d4","#53261f","#fdb933","#00a6ac","#999d9c","#f15a22","#d3c6a6","#78cdd1","#a1a3a6","#b4533c","#c7a252","#008792","#9d9087","#84331f","#dec674","#94d6da","#8a8c8e","#f47a55","#b69968","#afdfe4","#74787c","#f15a22","#c1a173","#5e7c85","#7c8577","#f3704b","#dbce8f","#76becc","#72777b","#da765b","#ffd400","#90d7ec","#77787b","#c85d44","#ffd400","#009ad6","#4f5555","#ae5039","#ffe600","#145b7d","#6c4c49","#6a3427","#f0dc70","#11264f","#563624","#8f4b38","#fcf16e","#7bbfea","#3e4145","#8e3e1f","#decb00","#33a3dc","#3c3645","#f36c21","#cbc547","#228fbd","#464547","#b4532a","#6e6b41","#2468a2","#130c0e","#b7704f","#596032","#2570a1","#281f1d","#de773f","#525f42","#2585a6","#2f271d","#c99979","#5f5d46","#1b315e"}}
   }
  }
}

local 参数=(...)
local 脚本目录=tostring(service.getLuaExtDir("script"))
local 脚本路径=debug.getinfo(1,"S").source:sub(2)--获取Lua脚本的完整路径
local 纯脚本名=File(脚本路径).getName()
local 目录=string.sub(脚本路径,1,#脚本路径-#纯脚本名)
local 脚本相对路径=string.sub(脚本路径,#脚本目录+1)

local 编号=1
if 参数!=nil && string.find(参数,"《《")!=nil && string.find(参数,"》》")!=nil then
  编号=tonumber(string.sub(参数,string.find(参数,"《《")+6,string.find(参数,"》》")-1))
end



local ids,data={},{}
local item={LinearLayout,
  layout_width=-1,
  padding="2dp",
  gravity=17,
  {CardView,
    radius="8dp",
    CardElevation="5dp",
    cardBackgroundColor="0xff000000",
    layout_width=-1,
    {TextView,
      id="a",
      padding="8dp",
      gravity=17,
      layout_width=-1,
      textColor=0xffffffff,
      textSize="18dp"}
  }
}


local adp=LuaAdapter(service,data,item)

local function Back() --生成功能键背景
  local bka=LuaDrawable(function(c,p,d)
    local b=d.bounds
    b=RectF(b.left,b.top,b.right,b.bottom)
    p.setColor(0xffffffff)
    c.drawRoundRect(b,20,20,p) --圆角20
  end)
  local bkb=LuaDrawable(function(c,p,d)
    local b=d.bounds
    b=RectF(b.left,b.top,b.right,b.bottom)
    p.setColor(0xff3F4C60)
    c.drawRoundRect(b,20,20,p)
  end)

  local stb=StateListDrawable()
  stb.addState({-android.R.attr.state_pressed},bkb)
  stb.addState({android.R.attr.state_pressed},bka)
  return stb
end



--刷新列表
local function fresh(t)
  table.clear(data)
  if type(t)~="table" then
    local ts={}
    for a in utf8.gmatch(tostring(t),"%S")
      table.insert(ts,a)
    end
    t=ts
  end
  for _,v in ipairs(t) do
    if string.find(v,"#[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]")==nil then
      --print(v.." 非颜色代码")
      table.insert(data,{
        a={
          Text=v,
          BackgroundColor=Color.parseColor("#cccccccc"),
        },
      })
     else
      table.insert(data,{
        a={
          Text=v,
          BackgroundColor=Color.parseColor(v),
        },
      })
    end

  end
  adp.notifyDataSetChanged()

end

--刷新列表
local function fresh2(t)
  table.clear(data)
  if type(t)~="table" then
    local ts={}
    local c = 0
    local s = ""
    for a in utf8.gmatch(tostring(t),"%S")
      c = c + 1
      s = s..a
      if c == 2 then
       table.insert(ts,s)
       c = 0
       s = ""
      end
      end
    t=ts
  end
  for _,v in ipairs(t) do
    if string.find(v,"#[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]")==nil then
      --print(v.." 非颜色代码")
      table.insert(data,{
        a={
          Text=v,
          BackgroundColor=Color.parseColor("#ff777777"),
        },
      })
     else
      table.insert(data,{
        a={
          Text=v,
          BackgroundColor=Color.parseColor(v),
        },
      })
    end

  end
  adp.notifyDataSetChanged()

end

--刷新列表
local function fresh3(t)
  table.clear(data)
  if type(t)~="table" then
    local ts={}
    local c = 0
    local s = ""
    for a in utf8.gmatch(tostring(t),"%S")
      c = c + 1
      s = s..a
      if c == 4 then
       table.insert(ts,s)
       c = 0
       s = ""
      end
      end
    t=ts
  end
  for _,v in ipairs(t) do
    if string.find(v,"#[0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f][0-9A-Fa-f]")==nil then
      --print(v.." 非颜色代码")
      table.insert(data,{
        a={
          Text=v,
          BackgroundColor=Color.parseColor("#ff777777"),
        },
      })
     else
      table.insert(data,{
        a={
          Text=v,
          BackgroundColor=Color.parseColor(v),
        },
      })
    end

  end
  adp.notifyDataSetChanged()

end

local function bus(t,id)
  local Bus={LinearLayout,
    paddingLeft="2dp",
    layout_width=-1}

  for _,v in ipairs(t) do
    tex = tostring(v[1])
    if tex == "旗子" then
      table.insert(Bus,{TextView,
      text=tostring(v[1]),
      layout_margin="2dp",
      layout_marginLeft="1dp",
      layout_marginRight="1dp",
      paddingTop="9dp",
      paddingBottom="9dp",
      gravity=17,
      layout_width=-1,
      layout_height=-1,
      layout_weight=1,
      onClick=function()
        fresh2(v[2])
      end,
      OnLongClickListener={onLongClick=function() return true end},
      Background=Back(),
      textColor=0xffffffff,
      textSize="15dp"}) 
    else
      table.insert(Bus,{TextView,
      text=tostring(v[1]),
      layout_margin="2dp",
      layout_marginLeft="1dp",
      layout_marginRight="1dp",
      paddingTop="9dp",
      paddingBottom="9dp",
      gravity=17,
      layout_width=-1,
      layout_height=-1,
      layout_weight=1,
      onClick=function()
        fresh(v[2])
      end,
      OnLongClickListener={onLongClick=function() return true end},
      Background=Back(),
      textColor=0xffffffff,
      textSize="15dp"})
    end
  end
  if ids.main.getChildAt(1)
    ids.main.removeViewAt(1)
  end
  ids.main.addView(loadlayout(Bus))
end

local function Icon(k,s) --获取k功能图标,没有返回s
  k=Key.presetKeys[k]
  return k and k.label or s
end

local function Bu_R(id) --生成功能键
  local Bu={LinearLayout,
    layout_height=-1,
    layout_width=-1,
    layout_weight=1,
    padding="2dp",
    {FrameLayout,
      layout_height=-1,
      layout_width=-1,
      Background=Back(),
      {TextView,
        gravity=17|48,
        layout_height=-1,
        layout_width=-1,
        layout_marginTop="2dp",
        textColor=0xffffffff,
        textSize="10dp"},
      {TextView,
        gravity=17,
        layout_height=-1,
        layout_width=-1,
        textColor=0xffffffff,--标签颜色
        textSize="18dp"}}}
  local msg=Bu[2][2] --上标签
  local label=Bu[2][3] --主标签


  if id<=#arr then
    label.text=Icon(arr[id][1],arr[id][1])
    label.textSize="18dp" --默认符号⌫太小,字体大小改为22dp,后面同理
    Bu.onClick=function()
      fresh(arr[id][2][1][2])
      bus(arr[id][2])
    end
    Bu.OnLongClickListener={onLongClick=function() return true end}
   elseif id==(#arr+3) then
    label.text=Icon("Keyboard_default","返回")
    Bu.onClick=function()
      service.sendEvent("Keyboard_default")
    end
   elseif id==(#arr+1) then
    label.text=Icon("编辑","编辑")
    Bu.onClick=function()
      service.editFile(脚本路径)--用内置编辑器打开文件
    end
   elseif id==(#arr+2) then
    label.text=Icon("BackSpace","⌫")
    Bu.onClick=function()
      service.sendEvent("BackSpace")
    end
    Bu.OnLongClickListener={onLongClick=function() return true end}
  end
  return Bu
end

local height="240dp" --键盘高度
pcall(function()
  --键盘自适应高度,旧版中文不支持,放pcall里防报错
  height=service.getLastKeyboardHeight()
end)

local layout={LinearLayout,
  orientation=1,
  --键盘高度
  layout_height=height,
  layout_width=-1,
  --背景颜色
  BackgroundColor=0xff293047,
  {TextView,
    layout_height="1dp",
    layout_width=-1,
    BackgroundColor=0xff293047},
  {LinearLayout,
    layout_height=-1,
    layout_width=-1,

    {LinearLayout,
      id="main",
      orientation=1,
      --右侧功能键宽度
      layout_width=-1,
      layout_height=-1,
      layout_weight=1,
      --layout_gravity=5|84,
      {GridView, --列表控件
        id="list",
        numColumns=7, --6列
        paddingLeft="2dp",
        paddingRight="2dp",
        layout_width=-1,
        layout_weight=1}},
    {LinearLayout,
      orientation=1,
      layout_width="49dp",
      layout_height=-1,
      layout_gravity=5|84,

      --Bu_R(1),

    },
  }}

for i=1,#arr+3 do
  table.insert(layout[3][3],Bu_R(i))
end

layout=loadlayout(layout,ids)

ids.list.Adapter=adp

ids.list.onItemClick=function(l,v,p)
  local s=data[p+1].a.Text
  --dofile(tostring(service.getLuaExtDir("script")).."/包/字符串/字符串数组互转.lua")
  --print(数组转字符串(s))
  service.commitText(s)
end

ids.list.onItemLongClick=function(l,v,p)
  --返回（真）,否则长按也会触发点击事件
  return true
end




--初始显示Emoji第一项内容
fresh(arr[1][2][1][2])
bus(arr[1][2],1)



service.setKeyboard(layout)